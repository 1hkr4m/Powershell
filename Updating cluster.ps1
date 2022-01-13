
Get-WindowsFeature *clustering*

invoke-command server2016,server2016-2 { Install-WindowsFeature rsat-clustering -IncludeAllSubFeature }

Update-ClusterFunctionalLevel

Get-Cluster | fl *
