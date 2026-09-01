<?php
require __DIR__ . '/vendor/autoload.php';

$zip = new ZipArchive();
if ($zip->open('C:/Users/LENOVO/Desktop/Manual_Book_SMPM_MBG.docx') === TRUE) {
    $xml = $zip->getFromName('word/document.xml');
    echo "Length of document.xml: " . strlen($xml) . "\n";
    echo "Snippet of document.xml:\n" . substr(strip_tags($xml), 0, 500) . "\n";
    $zip->close();
} else {
    echo "Failed to open zip archive.\n";
}
