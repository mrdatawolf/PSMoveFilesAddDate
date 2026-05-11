# Global Variables
$script:OriginFolder = ""
$script:DestinationFolder = ""
$script:MoveFiles = $false  # Default is copy; set to $true to move

function Get-FolderPath {
    $script:OriginFolder = Read-Host "Enter the origin folder path"
    $script:DestinationFolder = Read-Host "Enter the destination folder path"

    if (-not (Test-Path $script:OriginFolder)) {
        Write-Error "Origin folder does not exist. Exiting script."
        exit
    }

    if (-not (Test-Path $script:DestinationFolder)) {
        Write-Host "Destination folder does not exist. Creating it..."
        try {
            New-Item -ItemType Directory -Path $script:DestinationFolder -ErrorAction Stop | Out-Null
        } catch {
            Write-Error "Failed to create destination folder: $_"
            exit
        }
    }
}

function Set-TransferMode {
    $mode = Read-Host "Type 'move' to move files or press Enter to copy"
    if ($mode -eq "move") {
        $script:MoveFiles = $true
        Write-Host "Mode set to MOVE"
    } else {
        Write-Host "Mode set to COPY"
    }
}

function Invoke-FileTransfer {
    $files = Get-ChildItem -Path $script:OriginFolder -File


    $total = $files.Count
    $count = 0
    foreach ($file in $files) {
        $count++
        Write-Progress -Activity "Transferring files" -Status "$count of $total" -PercentComplete (($count / $total) * 100)
        $dateModified = $file.LastWriteTime.ToString("MMddyyyy")
        $baseName = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
        $extension = $file.Extension
        $newFileName = "${baseName}_${dateModified}${extension}"
        $destinationPath = Join-Path -Path $script:DestinationFolder -ChildPath $newFileName

        if ($script:MoveFiles) {
            Move-Item -Path $file.FullName -Destination $destinationPath -Force
            Write-Host "Moved: $($file.Name) → $newFileName"
        } else {
            Copy-Item -Path $file.FullName -Destination $destinationPath -Force
            Write-Host "Copied: $($file.Name) → $newFileName"
        }
    }
}

# Main Execution
Get-FolderPath
Set-TransferMode
Invoke-FileTransfer