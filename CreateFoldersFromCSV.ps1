$csvfilepath = "C:\SharedDirectory\Gesamtliste.csv"
$folderpath = "C:\SharedDirectory\Mandanten"   

$foldernames = Import-csv -Delimiter ";" $csvfilepath -Header "MGNr"  | Select-Object -ExpandProperty MGNr

foreach ($MGNr in $foldernames){
    $Folderfullpath = Join-Path $folderpath $MGNr
    if(!(Test-Path -Path $Folderfullpath -PathType Container)){
        New-item -ItemType Directory -Path $Folderfullpath
        Write-Host "Folder created successfully!"
    }else{
        Write-Host "Folder &MGNr already exits!"
    }
}