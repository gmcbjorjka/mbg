<div
    class="
        mt-6
        mx-2
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
            {{ $reportTitle  }}
        </h2>


        <p
            class="
                mt-1
                text-sm
                text-gray-600
                dark:text-gray-300
            "
        >
            Data laporan berdasarkan filter yang dipilih.
        </p>

    </div>





    {{-- SUMMARY --}}

    @if(count($summary))


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
                        text-center
                        rounded-xl
                        bg-gray-100
                        dark:bg-gray-800
                        border
                        border-gray-200
                        dark:border-gray-700
                        px-4
                        py-5
                    "
                >


                    <span
                        class="
                            text-sm
                            font-semibold
                            text-gray-600
                            dark:text-gray-300
                        "
                    >

                        {{ match($key){

                            'total'=>'Total Data',

                            'pregnant'=>'Ibu Hamil',

                            'toddler'=>'Orang Tua Balita',

                            default=>ucwords(
                                str_replace('_',' ',$key)
                            )

                        } }}

                    </span>



                    <span
                        class="
                            mt-2
                            text-2xl
                            font-bold
                            text-gray-900
                            dark:text-white
                        "
                    >

                        {{ number_format($value) }}

                    </span>


                </div>


            @endforeach


        </div>


    @endif







    {{-- TABLE --}}

    <div
        class="
            overflow-x-auto
            rounded-xl
            border
            border-gray-200
            dark:border-gray-700
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
                            px-4
                            py-3
                            text-center
                            text-xs
                            font-bold
                            uppercase
                            text-gray-700
                            dark:text-gray-200
                        "
                    >
                        No
                    </th>



                    @foreach($columns as $label)


                        <th
                            class="
                                px-4
                                py-3
                                text-left
                                text-xs
                                font-bold
                                uppercase
                                whitespace-nowrap
                                text-gray-700
                                dark:text-gray-200
                            "
                        >

                            {{ $label }}

                        </th>


                    @endforeach


                </tr>


            </thead>






            <tbody
                class="
                    divide-y
                    divide-gray-100
                    dark:divide-gray-700
                    bg-white
                    dark:bg-gray-900
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
                                px-4
                                py-3
                                text-center
                                text-sm
                                text-gray-800
                                dark:text-gray-200
                            "
                        >

                            {{ $index+1 }}

                        </td>





                        @foreach($columns as $key=>$label)


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

                                {{ $row[$key] ?? '-' }}

                            </td>


                        @endforeach





                    </tr>



                @empty


                    <tr>


                        <td
                            colspan="{{ count($columns)+1 }}"
                            class="
                                px-4
                                py-8
                                text-center
                                text-sm
                                text-gray-500
                                dark:text-gray-400
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