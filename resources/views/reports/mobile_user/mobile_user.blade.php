<div
    class="
        mx-4
        my-6
        rounded-xl
        bg-white
        dark:bg-gray-900
        shadow-md
        border
        border-gray-200
        dark:border-gray-700
        p-6
        space-y-6
    "
>


    {{-- HEADER --}}

    <div>


        <h2
            class="
                text-xl
                font-bold
                text-gray-900
                dark:text-white
            "
        >
            User Mobile
        </h2>


        <p
            class="
                mt-1
                text-sm
                text-gray-600
                dark:text-gray-300
            "
        >
            Data pengguna mobile dan informasi profile penerima.
        </p>


    </div>








    {{-- RANGKUMAN --}}

    <div
        class="
            grid
            grid-cols-1
            sm:grid-cols-3
            gap-4
        "
    >


        @foreach($summary as $key=>$value)


            <div
                class="
                    flex
                    flex-col
                    items-center
                    justify-center

                    rounded-lg

                    bg-gray-100
                    dark:bg-gray-800

                    border
                    border-gray-200
                    dark:border-gray-600

                    px-5
                    py-5

                    min-h-[120px]
                "
            >


                <p
                    class="
                        text-sm
                        font-semibold
                        uppercase
                        text-center

                        text-gray-800
                        dark:text-gray-200
                    "
                >

                    @switch($key)

                        @case('total')
                            Total Data
                            @break

                        @case('pregnant')
                            Ibu Hamil
                            @break

                        @case('toddler')
                            Orang Tua Balita
                            @break

                        @default
                            {{ ucwords(str_replace('_',' ',$key)) }}

                    @endswitch


                </p>



                <p
                    class="
                        mt-2

                        text-2xl
                        font-bold
                        text-center

                        text-gray-900
                        dark:text-white
                    "
                >

                    {{ number_format($value) }}

                </p>


            </div>


        @endforeach


    </div>









    {{-- TABLE --}}


    <div
        class="
            overflow-x-auto
            rounded-lg
            border
            border-gray-200
            dark:border-gray-600
        "
    >


        <table
            class="
                min-w-full
                divide-y
                divide-gray-200
                dark:divide-gray-700
            "
        >



            <thead
                class="
                    bg-gray-100
                    dark:bg-gray-800
                "
            >

                <tr>


                    <th
                        class="
                            px-3
                            py-3
                            text-center
                            text-xs
                            font-bold
                            uppercase
                            text-gray-800
                            dark:text-gray-100
                        "
                    >

                        No

                    </th>





                    @foreach(array_keys($data[0] ?? []) as $column)


                    <th
                        class="
                            px-4
                            py-3
                            text-left
                            text-xs
                            font-bold
                            uppercase
                            whitespace-nowrap
                            text-gray-800
                            dark:text-gray-100
                        "
                    >

                        {{ match($column) {

                            'nama'=>'Nama',

                            'email'=>'Email',

                            'no_hp'=>'Nomor HP',

                            'status'=>'Status',

                            'tanggal_daftar'=>'Tanggal Daftar',

                            'nik'=>'NIK',

                            'alamat'=>'Alamat',

                            'tanggal_lahir'=>'Tanggal Lahir',

                            'jenis_kelamin'=>'Jenis Kelamin',

                            'jenis_penerima'=>'Jenis Penerima',

                            'nama_anak'=>'Nama Anak',

                            'nik_anak'=>'NIK Anak',

                            'jenis_kelamin_anak'=>'Jenis Kelamin Anak',

                            'tanggal_lahir_anak'=>'Tanggal Lahir Anak',

                            default=>ucwords(
                                str_replace('_',' ',$column)
                            )

                        } }}

                    </th>


                    @endforeach


                </tr>


            </thead>








            <tbody
                class="
                    bg-white
                    dark:bg-gray-900

                    divide-y
                    divide-gray-100
                    dark:divide-gray-700
                "
            >



                @forelse($data as $index=>$row)


                <tr
                    class="
                        hover:bg-gray-50
                        dark:hover:bg-gray-800
                    "
                >



                    <td
                        class="
                            px-3
                            py-3
                            text-center
                            text-sm
                            text-gray-800
                            dark:text-gray-200
                        "
                    >

                        {{ $index+1 }}

                    </td>






                    @foreach($row as $value)


                    <td
                        class="
                            px-4
                            py-3
                            text-sm
                            whitespace-nowrap
                            text-gray-800
                            dark:text-gray-200
                        "
                    >

                        {{ $value ?: '-' }}

                    </td>


                    @endforeach



                </tr>



                @empty



                <tr>

                    <td
                        colspan="100"
                        class="
                            px-4
                            py-8
                            text-center
                            text-sm
                            text-gray-500
                            dark:text-gray-300
                        "
                    >

                        Tidak ada data

                    </td>

                </tr>



                @endforelse



            </tbody>


        </table>


    </div>


</div>