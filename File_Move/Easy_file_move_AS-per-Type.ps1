#####
$_path=$null;
[System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') | Out-Null
[string]$_path = [Microsoft.VisualBasic.Interaction]::InputBox("Please enter the path of the files to be sorted", "Read-Host")

if($_path -ne $null){


$file_types=Get-ChildItem $_path -Recurse |Where-Object{($_.PSIsContainer -match "False") -and ($_.Extension -ne "")} | Select-Object -Property Extension -Unique

foreach($fltype in $file_types.Extension){
$fldrnme= $fltype.ToString().split(".")[1];
if((Test-Path "$_path\FIles_As_per_Types\$fldrnme") -eq $false){
New-Item -Path "$_path\FIles_As_per_Types\" -Name $fltype.ToString().split(".")[1] -ItemType Directory -Force -Verbose
}

Get-ChildItem $_path\ -Recurse |Where-Object{($_.DirectoryName -notlike "*$fldrnme*") -and ($_.Extension -match $fltype)} |Move-Item -Destination "$_path\FIles_As_per_Types\$fldrnme" -Force -Verbose


}
}


