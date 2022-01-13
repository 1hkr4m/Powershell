
# view storage related cmdlets
get-command -module Storage

# view disks
get-disk

# Initialize disk as GPT
initialize-disk -number 2 -partitionstyle GPT

# view partitions
get-partition

# Partition an entire disk
new-partition -disknumber 2 -usemaximumsize -driveletter I

# view volumes
Get-Volume

# Format with a file system
format-volume -DriveLetter I -filesystem ReFS -AllocationUnitSize 4096 -newfilesystemlabel "IT Data"


# Format remaining disk with a single command
get-disk |
 where-object partitionstyle -eq "RAW" |
  initialize-disk -partitionstyle GPT -passthru |
   new-partition -usemaximumsize -driveletter V |
    format-volume -filesystem ReFS -AllocationUnitSize 65536 -NewFileSystemLabel "VM Data"
