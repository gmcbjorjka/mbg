<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\MbgMenu;
use Illuminate\Http\Request;

class MbgMenuController extends Controller
{
    /**
     * GET /api/mbg/menu
     *
     * contoh:
     * /api/mbg/menu
     * /api/mbg/menu?date=2026-07-16
     */
    public function index(Request $request)
    {

        $date = $request->date
            ?? now()->format('Y-m-d');


        $menu = MbgMenu::with([

            'items',

            'nutritions',

            'benefits'

        ])

        ->whereDate(
            'date',
            $date
        )

        ->where(
            'is_active',
            true
        )

        ->first();



        if (!$menu) {

            return response()->json([

                'success' => false,

                'message' => 'Menu MBG tidak tersedia',

                'data' => null

            ], 404);

        }



        return response()->json([

            'success' => true,

            'data' => $menu

        ]);

    }





    /**
     * GET /api/mbg/menu/{id}
     *
     * detail menu
     */
    public function show($id)
    {

        $menu = MbgMenu::with([

            'items',

            'nutritions',

            'benefits'

        ])

        ->find($id);



        if (!$menu) {

            return response()->json([

                'success' => false,

                'message' => 'Menu tidak ditemukan'

            ], 404);

        }



        return response()->json([

            'success' => true,

            'data' => $menu

        ]);

    }





    /**
     * GET /api/mbg/menu/today
     *
     * shortcut mobile
     */
    public function today()
    {

        $menu = MbgMenu::with([

            'items',

            'nutritions',

            'benefits'

        ])

        ->whereDate(
            'date',
            now()->format('Y-m-d')
        )

        ->where(
            'is_active',
            true
        )

        ->first();



        if (!$menu) {

            return response()->json([

                'success' => false,

                'message' => 'Menu hari ini belum tersedia'

            ], 404);

        }



        return response()->json([

            'success' => true,

            'data' => $menu

        ]);

    }

}
