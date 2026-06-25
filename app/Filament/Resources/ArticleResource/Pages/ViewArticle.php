<?php

namespace App\Filament\Resources\ArticleResource\Pages;

use App\Filament\Resources\ArticleResource;
use Filament\Resources\Pages\ViewRecord;

class ViewArticle extends ViewRecord
{
    protected static string $resource = ArticleResource::class;

    protected static string $view = 'filament.resources.article-resource.pages.view-article';

    public function mount($record): void
    {
        parent::mount($record);

        $article = $this->record;

        if (! session()->has('viewed_' . $article->id)) {
            $article->increment('views');
            session()->put('viewed_' . $article->id, true);
        }
    }

    protected function hasInfolist(): bool
    {
        return false;
    }

    protected function hasForm(): bool
    {
        return false;
    }
}
