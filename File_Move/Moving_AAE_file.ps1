<#$fldr=Get-ChildItem 'E:\Dubai Vacation\cloud\' | select Name

$AAE_file= Get-ChildItem 'E:\Dubai Vacation\Apple_All_PhotosVideos\AAE' | Select BaseName

foreach($AAE in $AAE_file.BaseName){

foreach($othrfldr in $fldr.Name){

if(Get-ChildItem E:\"Dubai Vacation"\cloud\$othrfldr\ | Where-Object{$_.BaseName -match $AAE}){

Write-Host "File found in" $othrfldr "Hence moving it there and deleting from AAE folder"
Get-ChildItem -Path 'E:\Dubai Vacation\Apple_All_PhotosVideos\AAE' | Where-Object{$_.BaseName -match $AAE} | Move-Item -Destination E:\"Dubai Vacation"\cloud\\$othrfldr\ -Force 
$AAE_file= $AAE_file| Where-Object{$_.basename -notmatch $AAE}
break;
}
else{
Write-Host "File Not found in" $othrfldr
}

}
} #>
