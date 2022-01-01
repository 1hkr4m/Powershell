$namez = Read-Host "Please enter name of VM"
$sizez = Read-Host "Size of VHDX"

New-VM -Name "$namez" -Path c:\Hyper-V\$namez\ -MemoryStartupBytes 2GB -Version 8.0 -Generation 2 -NewVHDPath c:\Hyper-v\$name\$name1.vhdx -NewVHDSizeBytes $sizezGB
