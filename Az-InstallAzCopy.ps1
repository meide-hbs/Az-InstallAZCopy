#Download AzCopy
Invoke-WebRequest -Uri "https://aka.ms/downloadazcopy-v10-windows" -OutFile AzCopy.zip -UseBasicParsing
 
#Curl.exe option (Windows 10 Spring 2018 Update (or later))
curl.exe -L -o AzCopy.zip https://aka.ms/downloadazcopy-v10-windows
 
#Expand Archive
Expand-Archive ./AzCopy.zip ./AzCopy -Force

#Create Target Folder 
try {
        New-Item -ItemType "directory" -Path "c:\Tools\AZCopy" -ErrorAction Stop
}
catch [System.IO.IOException] 
{
    if ($_.CategoryInfo.Category -eq $resExistErr) {Write-host "Dir Exist"}
}

#Move AzCopy to the destination you want to store it
Get-ChildItem ./AzCopy/*/azcopy.exe | Move-Item -Destination "C:\tools\AzCopy\AzCopy.exe"
 
#Add your AzCopy path to the Windows environment PATH (C:\Users\thmaure\AzCopy in this example), e.g., using PowerShell:
$userenv = [System.Environment]::GetEnvironmentVariable("Path", "User")
[System.Environment]::SetEnvironmentVariable("PATH", $userenv + ";C:\tools\AzCopy", "User")