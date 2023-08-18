$csvfilepath = "C:\SharedDirectory\List.csv" #Give locaction of CSV-File
$folderpath = "C:\SharedDirectory\Accounts"   #Give Location where Folders will be created

$foldernames = Import-csv -Delimiter ";" $csvfilepath -Header "Foldername"  | Select-Object -ExpandProperty FolderName #Specify Delimiter 

foreach ($foldername in $foldernames){
    $Folderfullpath = Join-Path $folderpath $foldername
    if(!(Test-Path -Path $Folderfullpath -PathType Container)){
        New-Item -ItemType Directory -Path $Folderfullpath #Creates Folders 
        New-Item -Path $Folderfullpath -Name $foldername"_Info.txt" -ItemType "file" #Creates Info .txt Files for each Account
        Write-Host "Folder created successfully!"
    }else{
        Write-Host "Folder already exits!"
    }
}
