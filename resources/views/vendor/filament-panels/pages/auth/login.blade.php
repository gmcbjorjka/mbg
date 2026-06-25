<x-filament-panels::page.simple>
<style>
    h1, .fi-simple-header {
        display: none !important;
    }
</style>
    {{-- =========================
        BRAND HEADER (SPPG BGN)
    ========================== --}}
    <div class="flex flex-col items-center mb-6">

        {{-- Logo --}}
        <img
            src="{{ asset('logo.png') }}"
            class="w-20 h-20 mb-3"
            alt="Badan Gizi Nasional"
        >

        {{-- Title --}}
        <h1 class="text-xl font-bold tracking-wide text-gray-900 text-center">
            SPPG
        </h1>

        {{-- Subtitle --}}
        <p class="text-sm text-gray-600 text-center mt-1 leading-snug">
            Badan Gizi Nasional<br>
            Sistem Monitoring Penerima Manfaat MBG
        </p>
    </div>

    {{-- =========================
        HOOK BEFORE FORM
    ========================== --}}
    {{ \Filament\Support\Facades\FilamentView::renderHook(
        \Filament\View\PanelsRenderHook::AUTH_LOGIN_FORM_BEFORE,
        scopes: $this->getRenderHookScopes()
    ) }}

    {{-- =========================
        LOGIN FORM
    ========================== --}}
    <x-filament-panels::form id="form" wire:submit="authenticate">

        <div class="space-y-4">

            {{-- Dynamic Filament Form Fields --}}
            {{ $this->form }}

        </div>

        {{-- LOGIN BUTTON --}}
        <x-filament-panels::form.actions
            :actions="$this->getCachedFormActions()"
            :full-width="true"
        />

    </x-filament-panels::form>

    {{-- =========================
        FOOTER
    ========================== --}}
    <div class="text-center mt-6 text-xs text-gray-400">
        © {{ date('Y') }} Sistem Monitoring Penerima Manfaat MBG. All rights reserved.
    </div>

    {{-- =========================
        HOOK AFTER FORM
    ========================== --}}
    {{ \Filament\Support\Facades\FilamentView::renderHook(
        \Filament\View\PanelsRenderHook::AUTH_LOGIN_FORM_AFTER,
        scopes: $this->getRenderHookScopes()
    ) }}

</x-filament-panels::page.simple>