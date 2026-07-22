<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Confirmation;
use Illuminate\Http\Request;

class ConfirmationController extends Controller
{
    public function index(Request $request)
    {
        $query = Confirmation::with(
            'distribution.schedule'
        )
        ->where(
            'user_id',
            auth()->id()
        );


        if ($request->filled('month') && $request->filled('year')) {

            $query->whereMonth(
                'received_at',
                $request->month
            )
            ->whereYear(
                'received_at',
                $request->year
            );

        }


        $confirmations = $query
            ->latest()
            ->get();


        return response()->json([

            'success' => true,

            'data' => $confirmations

        ]);
    }


    public function store(Request $request)
    {
        $request->validate([

            'distribution_id' => 'required|exists:distributions,id',

            'photo' => 'required|image|max:10048',

            'latitude' => 'nullable|numeric',

            'longitude' => 'nullable|numeric',

            'rating' => 'nullable|integer|min:1|max:5',

            'kritik' => 'nullable|string',

        ]);

        // Tidak boleh verifikasi dua kali
        $exists = Confirmation::where('distribution_id', $request->distribution_id)
            ->where('user_id', auth()->id())
            ->exists();

        if ($exists) {

            return response()->json([

                'success' => false,

                'message' => 'Anda sudah melakukan verifikasi penerimaan.'

            ], 422);
        }

        $photo = $request->file('photo')
            ->store('confirmations', 'public');

        $confirmation = Confirmation::create([

            'distribution_id' => $request->distribution_id,

            'user_id' => auth()->id(),

            'photo' => $photo,

            'latitude' => $request->latitude,

            'longitude' => $request->longitude,

            'rating' => $request->rating,

            'kritik' => $request->kritik,

            'status' => 'diterima',

            'received_at' => now(),

        ]);

        return response()->json([

            'success' => true,

            'message' => 'Verifikasi berhasil dikirim.',

            'data' => $confirmation,

        ]);
    }

    public function latest()
    {

        $confirmation = Confirmation::with(
            'distribution.schedule'
        )
        ->where(
            'user_id',
            auth()->id()
        )
        ->latest()
        ->first();



        return response()->json([

            'data' => $confirmation

        ]);

    }

    public function show($id)
    {
        $confirmation = Confirmation::with(
            'distribution.schedule'
        )
        ->where('id', $id)
        ->where('user_id', auth()->id())
        ->first();


        if (!$confirmation) {

            return response()->json([

                'success' => false,

                'message' => 'Data verifikasi tidak ditemukan.'

            ], 404);

        }


        return response()->json([

            'success' => true,

            'data' => $confirmation

        ]);
    }

}
