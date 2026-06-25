<x-filament-panels::page>
    <div class="max-w-3xl mx-auto bg-white dark:bg-gray-900 rounded-xl shadow overflow-hidden">

        {{-- COVER IMAGE --}}
        @if($record->thumbnail)
            <img
                src="{{ asset('storage/' . $record->thumbnail) }}"
                class="w-full h-72 object-cover"
            />
        @endif

        <div class="p-6 space-y-6">

            {{-- META --}}
            <div class="flex flex-wrap gap-3 text-sm text-gray-500">

                <span class="bg-primary-100 text-primary-700 px-2 py-1 rounded">
                    {{ $record->category->name ?? '-' }}
                </span>

                <span>•</span>

                <span>{{ $record->reading_time }} min read</span>

                <span>•</span>

                <span>{{ optional($record->published_at)->format('d M Y') }}</span>

            </div>

            {{-- TITLE --}}
            <h1 class="text-3xl font-bold text-gray-900 dark:text-white leading-tight">
                {{ $record->title }}
            </h1>

            {{-- SUMMARY --}}
            @if($record->summary)
                <p class="text-lg text-gray-600 dark:text-gray-300">
                    {{ $record->summary }}
                </p>
            @endif

            <hr class="border-gray-200 dark:border-gray-700">

            {{-- CONTENT (REAL ARTICLE VIEW) --}}
            <article class="prose max-w-none dark:prose-invert prose-lg">
                {!! $record->content !!}
            </article>

            <hr class="border-gray-200 dark:border-gray-700">

            {{-- FOOTER --}}
            <div class="flex justify-between text-sm text-gray-500">

                <div>
                    👁 {{ $record->views }} views
                </div>

                <div>
                    ✍️ {{ $record->author->name ?? 'Admin' }}
                </div>

            </div>

        </div>
    </div>
</x-filament-panels::page>