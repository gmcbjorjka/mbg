<x-filament::page>

    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">

        <!-- TOTAL USER -->
        <div class="p-5 bg-white rounded-2xl shadow hover:shadow-lg transition border-l-4 border-blue-500">
            <div class="flex items-center justify-between">
                <div>
                    <div class="text-sm text-gray-500">Total User</div>
                    <div class="text-3xl font-bold text-gray-800">
                        {{ \App\Models\User::count() }}
                    </div>
                </div>

                <div class="p-3 bg-blue-100 rounded-xl">
                    <svg class="w-6 h-6 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M17 20h5v-2a4 4 0 00-3-3.87M9 20H4v-2a4 4 0 013-3.87m10-4a4 4 0 10-8 0 4 4 0 008 0z"/>
                    </svg>
                </div>
            </div>
        </div>

        <!-- ADMIN -->
        <div class="p-5 bg-white rounded-2xl shadow hover:shadow-lg transition border-l-4 border-red-500">
            <div class="flex items-center justify-between">
                <div>
                    <div class="text-sm text-gray-500">Admin</div>
                    <div class="text-3xl font-bold text-gray-800">
                        {{ \App\Models\User::where('role','super_admin')->count() }}
                    </div>
                </div>

                <div class="p-3 bg-red-100 rounded-xl">
                    <svg class="w-6 h-6 text-red-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M9 12l2 2 4-4m5 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                    </svg>
                </div>
            </div>
        </div>

        <!-- KADER -->
        <div class="p-5 bg-white rounded-2xl shadow hover:shadow-lg transition border-l-4 border-green-500">
            <div class="flex items-center justify-between">
                <div>
                    <div class="text-sm text-gray-500">Kader Posyandu</div>
                    <div class="text-3xl font-bold text-gray-800">
                        {{ \App\Models\User::where('role','kader')->count() }}
                    </div>
                </div>

                <div class="p-3 bg-green-100 rounded-xl">
                    <svg class="w-6 h-6 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M12 4v16m8-8H4"/>
                    </svg>
                </div>
            </div>
        </div>

        <!-- BENEFICIARY -->
        <div class="p-5 bg-white rounded-2xl shadow hover:shadow-lg transition border-l-4 border-yellow-500">
            <div class="flex items-center justify-between">
                <div>
                    <div class="text-sm text-gray-500">Penerima Manfaat</div>
                    <div class="text-3xl font-bold text-gray-800">
                        {{ \App\Models\User::where('role','beneficiary')->count() }}
                    </div>
                </div>

                <div class="p-3 bg-yellow-100 rounded-xl">
                    <svg class="w-6 h-6 text-yellow-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M5.121 17.804A13.937 13.937 0 0112 16c2.5 0 4.847.655 6.879 1.804M15 10a3 3 0 11-6 0 3 3 0 016 0z"/>
                    </svg>
                </div>
            </div>
        </div>

    </div>

</x-filament::page>