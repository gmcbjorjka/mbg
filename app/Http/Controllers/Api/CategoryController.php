<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Category;

class CategoryController extends Controller
{
    /**
     * Get education categories
     */
    public function index()
    {

        $categories = Category::where(
            'is_active',
            true
        )
        ->select(
            'id',
            'name',
            'slug',
            'icon',
            'color'
        )
        ->orderBy(
            'name',
            'asc'
        )
        ->get();


        return response()->json([

            'success' => true,

            'data' => $categories

        ]);

    }

}
