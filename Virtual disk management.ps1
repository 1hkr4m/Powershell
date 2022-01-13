
# Get windows feature
get-windowsfeature *hyper-v*

# Install Hyper-V powershell cmdlets
Install-WindowsFeature -name hyper-v -IncludeManagementTools

# View VHD related cmdlets
get-command -module hyper-v -name *VHD*

# Create a new dynamic vhdx
new-vhd -path V:\VIrtual Disks\virtual disk 2.vhdx -sizebytes 5gb -dynamic

# Mount it
mount-vhd -path V:\VIrtual Disks\virtual disk 2.vhdx

# Initialize, partition and format it
initialize-disk -number 5 -partitionstyle GPT -PassThru | new-partition -UseMaximumSize -AssignDriveLetter | Format-Volume -FileSystem NTFS

# Unmount it
dismount-vhd -path V:\VIrtual Disks\virtual disk 2.vhdx

# View disk information
get-vhd -path V:\VIrtual Disks\virtual disk 2.vhdx