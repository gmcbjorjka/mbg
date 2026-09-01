<?php

require __DIR__ . '/vendor/autoload.php';

use PhpOffice\PhpWord\PhpWord;
use PhpOffice\PhpWord\IOFactory;

function saveDocFile($phpWord, $filePath) {
    $tempFile = sys_get_temp_dir() . '/temp_' . md5(uniqid()) . '.docx';
    $writer = IOFactory::createWriter($phpWord, 'Word2007');
    $writer->save($tempFile);
    copy($tempFile, $filePath);
    @unlink($tempFile);
}

// Test saving to multiple files
$phpWord = new PhpWord();
$section = $phpWord->addSection();
$section->addText("Hello World Manual Book");

saveDocFile($phpWord, 'C:/Users/LENOVO/Desktop/Manual_Book_SMPM_MBG.docx');
saveDocFile($phpWord, 'C:/Users/LENOVO/Desktop/Manual_Book_SMPM_MBG.doc');

$zip = new ZipArchive();
if ($zip->open('C:/Users/LENOVO/Desktop/Manual_Book_SMPM_MBG.docx') === TRUE) {
    echo "DOCX VALID: " . strlen($zip->getFromName('word/document.xml')) . " bytes.\n";
    $zip->close();
} else {
    echo "DOCX INVALID.\n";
}

if ($zip->open('C:/Users/LENOVO/Desktop/Manual_Book_SMPM_MBG.doc') === TRUE) {
    echo "DOC VALID: " . strlen($zip->getFromName('word/document.xml')) . " bytes.\n";
    $zip->close();
} else {
    echo "DOC INVALID.\n";
}
