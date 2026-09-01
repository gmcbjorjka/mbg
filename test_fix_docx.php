<?php

require __DIR__ . '/vendor/autoload.php';

use PhpOffice\PhpWord\PhpWord;
use PhpOffice\PhpWord\IOFactory;

$phpWord = new PhpWord();
$section = $phpWord->addSection();
$section->addText("TEST DOCUMENT CONTENT");

$writer1 = IOFactory::createWriter($phpWord, 'Word2007');
$writer1->save('C:/Users/LENOVO/Desktop/test1.docx');

$zip = new ZipArchive();
if ($zip->open('C:/Users/LENOVO/Desktop/test1.docx') === TRUE) {
    echo "SUCCESS OPEN ZIP: " . strlen($zip->getFromName('word/document.xml')) . " bytes.\n";
    $zip->close();
} else {
    echo "FAILED TO OPEN ZIP.\n";
}
