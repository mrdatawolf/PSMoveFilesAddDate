# Setup

## Prerequisites

- Windows 10 or Windows 11
- PowerShell 5.1 or later (included with Windows — no install needed)
- No third-party tools, packages, or dependencies required

## Installation

1. Clone or download this repository:
   ```powershell
   git clone https://github.com/PatrickMoon/PSMoveFilesAddDate.git
   cd PSMoveFilesAddDate
   ```
   Or download the ZIP from GitHub and extract it anywhere you like.

2. That's it — there is nothing to install or build.

## Running the script

Open PowerShell and navigate to the folder where you saved the script, then run:

```powershell
.\CopyFilesToNewFolderWithDateAdded.ps1
```

If Windows blocks the script with an "execution policy" error, run this once to allow local scripts:

```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
```

Then try running the script again.

## Notes

- No configuration files or environment variables are needed
- The script is fully self-contained in a single `.ps1` file
- To change the default behavior from copy to move, open the script and change line 3 from `$false` to `$true`:
  ```powershell
  $script:MoveFiles = $true
  ```
