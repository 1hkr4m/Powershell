# Set the path to the Age of Empires savegames directory
$saveGameDir = "C:\Users\username\Documents\My Games\Age of Empires DE\Savegame"

# Set the path to the backup directory
$backupDir = "C:\Users\username\Documents\Age of Empires Savegames Backup"

# Create the backup directory if it doesn't exist
if (-not (Test-Path $backupDir)) {
    New-Item -ItemType Directory -Path $backupDir | Out-Null
}

# Get the current date and time for the backup file name
$dateTime = Get-Date -Format "yyyyMMdd_HHmmss"

# Set the backup file name
$backupFileName = "AgeOfEmpires_Savegames_$dateTime.zip"

# Compress the savegame directory and save the backup file
Compress-Archive -Path $saveGameDir -DestinationPath "$backupDir\$backupFileName"

# Output a message indicating that the backup was successful
Write-Host "Age of Empires savegames backed up to $backupDir\$backupFileName"