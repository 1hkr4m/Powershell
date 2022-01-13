
# viewe server migation tools feature
get-windowsfeature -name migration

# install windows server migration tools
Install-WindowsFeature -name migration

# navigate to smt directory
cd \windows\system32\servermigrationtools

# generate package for source machine
.\smigdeploy.exe /package /architecture amd64 /os WS12R2 /path C:\Migrationtools

# copy package over to source machine
copy-item -path C:\Migrationtools\SMT_ws12R2_amd64 -destination \\server2012gui\Migrationtools -recurse


### Complete steps on server2012gui machine before going further ###

# import smig cmdlets into session
add-pssnapin microsoft.windows.servermanager.migration

# install DHCP role and import settings!
import-smigserversetting -featureID DHCP -path C:\Migrationtools -verbose -force
