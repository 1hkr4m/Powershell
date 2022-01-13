

## ISCSI Initiators (pre-target) ##

# Start ICSCI initiator service on both nodes
invoke-command server2016,server2016-2 { get-service *iscsi* | Set-Service -StartupType Automatic -PassThru | Start-Service }

# view iscsi initiator addresses
invoke-command server2016,server2016-2 { Get-InitiatorPort }

# Create iscsi target portal for discovery
invoke-command server2016,server2016-2 { New-IscsiTargetPortal -TargetPortalAddress 172.16.60.39 }




## ISCSI initiators (port-target) ##

# Update discovery portal with new target information
invoke-command server2016,server2016-2 { Get-IscsiTargetPortal | Update-IscsiTargetPortal }

# view iscsi target
invoke-command server2016,server2016-2 { Get-IscsiTarget }

# Connect initiators to target
invoke-command server2016,server2016-2 { Get-IscsiTarget | Connect-IscsiTarget }

# Force the connection persist (across-reboots)
invoke-command server2016,server2016-2 { Get-IscsiSession | Register-IscsiSession }


## Failover clustering ##

# Install failover clustering feature on both nodes
invoke-command server2016,server2016-2 { Install-WindowsFeature failover-clustering }

# Create a new cluster (single domain)
new cluster -name CL-ITBilik -node server2016,server2016-2 -staticaddress 172.16.60.41

# Create a new cluster (multidomain/workgroup)
new cluster -name CL-ITBilik -node server2016,server2016-2 -staticaddress 172.16.60.41 -AdministrativeAccessPoint dns