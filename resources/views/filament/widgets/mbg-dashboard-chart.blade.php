<x-filament::section>

<div class="grid grid-cols-1 md:grid-cols-4 gap-4">


<div class="p-4 rounded-xl bg-blue-50">
    <div class="text-sm">
        Jadwal MBG
    </div>

    <div class="text-3xl font-bold">
        {{ $this->getData()['schedule'] }}
    </div>
</div>



<div class="p-4 rounded-xl bg-green-50">
    <div class="text-sm">
        Distribusi
    </div>

    <div class="text-3xl font-bold">
        {{ $this->getData()['distribution'] }}
    </div>
</div>



<div class="p-4 rounded-xl bg-yellow-50">
    <div class="text-sm">
        Penerimaan
    </div>

    <div class="text-3xl font-bold">
        {{ $this->getData()['confirmation'] }}
    </div>
</div>



<div class="p-4 rounded-xl bg-purple-50">
    <div class="text-sm">
        Rating
    </div>

    <div class="text-3xl font-bold">
        {{ $this->getData()['rating'] }}
    </div>
</div>


</div>



<div class="mt-6">

<x-filament::section.heading>
Status Penerimaan MBG
</x-filament::section.heading>


<div class="grid grid-cols-3 gap-4 mt-3">


@foreach($this->getData()['status'] as $status=>$jumlah)

<div class="p-4 rounded-xl bg-gray-100">

<div>
{{ ucfirst($status) }}
</div>

<div class="text-2xl font-bold">
{{ $jumlah }}
</div>

</div>

@endforeach


</div>

</div>


</x-filament::section>