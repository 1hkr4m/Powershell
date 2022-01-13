# Install docker provider
Install-Module -name dockermsftprovider -Repository PSGallery -force

# Install docker
install-package -name docker -providername dockermsftprovider -force

# Reboot
restart-computer -force

# Docker install & root directory
get-childitem -name 'c:\Program Files\Docker'
get-childitem -name 'c:\ProgramData\Docker'

# Docker daemon
get-service -name docker

# Docker client
docker version
docker info

# Configure docker daemon
$json = '{ "graph": "c:\\Docker"}'
$json | set-content c:\ProgramData\Docker\config\daemon.json
new-item -ItemType directory -path c:\Docker

# Restart service
restart-service -name docker