# Disable hyper-v
Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All
# Removing Hyper-V with DISM
DISM /Online /Disable-Feature:Microsoft-Hyper-V
# Disable hyper-v with bcedit
bcdedit /set hypervisorlaunchtype off