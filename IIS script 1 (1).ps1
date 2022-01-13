
# enter a powershell session on a remote machine
Enter-PSSession -computername server2016core

# view all available features
get-windowsfeature -name web*

# install web server (iis) role and management service
install-windowsfeature -name Web-server, Web-Mgmt-Service

# view installed features
get-windowsfeature | Where-Object Installed -eq True

# configure remote management for IIS
Set-ItemProperty -Path "HKLM:\Software\Microsoft\WebManagement\Server" -name "EnableRemoteManegement" -Value 1

# configure remote management service to start automatically
Set-Service WMSVC -startuptype Automatic

# exit remote powershell session
exit-pssession

# send a command over to a remote machine
invoke-command -computername server2016core -scriptblock {get-service W3SVC, WMSVC}

# get list of services
get-service -computername server2016core





