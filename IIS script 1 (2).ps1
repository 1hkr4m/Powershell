
# enter a powershell session on a remote machine
Enter-PSSession -computername server2016core

# install web server (iis) role and management service
install-windowsfeature -name Web-server, Web-Mgmt-Service

# configure remote management for IIS
Set-ItemProperty -Path "HKLM:\Software\Microsoft\WebManagement\Server" -name "EnableRemoteManegement" -Value 1

# configure remote management service to start automatically
Set-Service WMSVC -startuptype Automatic

#restart computer
restart-computer





