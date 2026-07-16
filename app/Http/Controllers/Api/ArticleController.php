<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Article;
use Illuminate\Http\Request;

class ArticleController extends Controller
{
    /**
     * List artikel edukasi
     *
     * Query:
     * ?keyword=ASI
     * ?category_id=1
     */
    public function index(Request $request)
    {


        $articles = Article::with('category:id,name')

            ->where(
                'status',
                'published'
            )


            // SEARCH KEYWORD
            ->when(
                $request->keyword,
                function ($query) use ($request) {

                    $keyword = $request->keyword;


                    $query->where(function ($q) use ($keyword) {


                        $q->where(
                            'title',
                            'like',
                            "%{$keyword}%"
                        )


                        ->orWhere(
                            'summary',
                            'like',
                            "%{$keyword}%"
                        )


                        ->orWhere(
                            'content',
                            'like',
                            "%{$keyword}%"
                        );


                    });


                }
            )


            // FILTER CATEGORY
            ->when(
                $request->category_id,
                function ($query) use ($request) {


                    $query->where(
                        'category_id',
                        $request->category_id
                    );


                }
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


        $article = Article::with('category:id,name')

            ->where(
                'slug',
                $slug
            )

            ->where(
                'status',
                'published'
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
