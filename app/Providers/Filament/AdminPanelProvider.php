<?php

namespace App\Providers\Filament;

use Filament\Http\Middleware\Authenticate;
use Filament\Http\Middleware\AuthenticateSession;
use Filament\Http\Middleware\DisableBladeIconComponents;
use Filament\Http\Middleware\DispatchServingFilamentEvent;
use Filament\Pages;
use Filament\Panel;
use Filament\PanelProvider;
use Filament\Support\Colors\Color;
use Filament\Widgets;
use Illuminate\Cookie\Middleware\AddQueuedCookiesToResponse;
use Illuminate\Cookie\Middleware\EncryptCookies;
use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken;
use Illuminate\Routing\Middleware\SubstituteBindings;
use Illuminate\Session\Middleware\StartSession;
use Illuminate\View\Middleware\ShareErrorsFromSession;
use Filament\Support\Facades\FilamentView;
use Filament\View\PanelsRenderHook;

class AdminPanelProvider extends PanelProvider
{
    public function boot(): void
    {
        FilamentView::registerRenderHook(
            PanelsRenderHook::HEAD_END,
            fn (): string => '
            <style>
                .fi-sidebar {
                    border-right: 1px solid rgb(229 231 235);
                    box-shadow:
                        0 4px 6px -1px rgb(0 0 0 / 0.1),
                        0 2px 4px -2px rgb(0 0 0 / 0.1),
                        8px 0 24px -8px rgb(0 0 0 / 0.15);
                }

                .dark .fi-sidebar {
                    border-right-color: rgb(55 65 81);
                    box-shadow:
                        0 4px 6px -1px rgb(0 0 0 / 0.3),
                        0 2px 4px -2px rgb(0 0 0 / 0.3),
                        8px 0 24px -8px rgb(0 0 0 / 0.4);
                }
            </style>
        '
        );
    }


    public function panel(Panel $panel): Panel
    {
        return $panel
            ->default()
            ->id('admin')
            ->path('admin')
           ->login(\App\Filament\Auth\Login::class)
            ->brandName('SMPM MBG')
            ->colors([
                'primary' => Color::Blue,
            ])

            // =========================
            // SIDEBAR GROUPING MENU
            // =========================
            ->navigationGroups([
                'Overview',
                'Data Master',
                'Operasional',
                'Konten',
                'Feedback',
                'Reporting',
                'Sistem',
            ])

            ->discoverResources(in: app_path('Filament/Resources'), for: 'App\\Filament\\Resources')
            ->discoverPages(in: app_path('Filament/Pages'), for: 'App\\Filament\\Pages')

            ->pages([
                Pages\Dashboard::class,
                \App\Filament\Pages\Profile::class,
    \App\Filament\Pages\ChangePassword::class,
            ])
            ->sidebarCollapsibleOnDesktop()
            ->discoverWidgets(in: app_path('Filament/Widgets'), for: 'App\\Filament\\Widgets')
            ->widgets([
\App\Filament\Widgets\UserStats::class,
    \App\Filament\Widgets\ReviewChart::class,
            ])

            ->middleware([
                EncryptCookies::class,
                AddQueuedCookiesToResponse::class,
                StartSession::class,
                AuthenticateSession::class,
                ShareErrorsFromSession::class,
                VerifyCsrfToken::class,
                SubstituteBindings::class,
                DisableBladeIconComponents::class,
                DispatchServingFilamentEvent::class,
            ])

            ->authMiddleware([
                Authenticate::class,
            ]);
    }
}
