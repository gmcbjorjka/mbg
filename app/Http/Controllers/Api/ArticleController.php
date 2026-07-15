<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Article;

class ArticleController extends Controller
{
    /**
     * List artikel edukasi
     */
    public function index()
    {


        $articles = Article::with('category')

            ->where(
                'status',
                'published'
            )

            ->orderBy(
                'published_at',
                'desc'
            )

            ->get();



        return response()->json([

            'success' => true,

            'data' => $articles

        ]);

    }





    /**
     * Detail artikel berdasarkan slug
     */
    public function show($slug)
    {


        $article = Article::with('category')

            ->where(
                'slug',
                $slug
            )

            ->first();



        if (!$article) {

            return response()->json([

                'success' => false,

                'message' => 'Artikel tidak ditemukan'

            ], 404);

        }



        // tambah jumlah pembaca
        $article->increment('views');



        return response()->json([

            'success' => true,

            'data' => $article

        ]);

    }


}
