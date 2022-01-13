
# import nano server ps bits into session
import-module D:\NanoServer\NanoServerImageGenerator -verbose


## nanoserver ##
# create nano server vdi
new-nanoserverimage -mediapath d: -basepath .\base -targetpath .\nanoserver.wim -deploymenttype guest -edition standard -computername nanoserver -administratorpassword (convertto-securestring -string 'Pa$$w0rd' -asplaintext -force) 

# create and start vm
New-VM -name nanoserver -vhdpath .\nanoserver.vhd -memorystartupbytes 1gb -generation 2 | start-vm