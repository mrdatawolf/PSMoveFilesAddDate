# PSMoveFilesAddDate

A PowerShell script that copies (or moves) files from one folder to another and automatically adds the file's last-modified date to each filename.

**Example:** `vacation-photo.jpg` → `vacation-photo_05112026.jpg`

---

## What it does

1. Asks you for a source folder and a destination folder
2. Asks whether you want to **copy** or **move** the files
3. Processes every file in the source folder, appending the date the file was last modified (in `MMDDYYYY` format) to the end of its name
4. Places the renamed files in the destination folder

The source files are never touched if you choose **copy** mode. The destination folder is created automatically if it doesn't already exist.

---

## Requirements

- Windows with PowerShell 5.1 or later (comes pre-installed on Windows 10/11)
- No additional software needed

---

## How to use

1. Open **PowerShell** (search for it in the Start menu)
2. Run the script:
   ```powershell
   .\CopyFilesToNewFolderWithDateAdded.ps1
   ```
3. Follow the prompts:
   - Enter the **source folder** path (where your files currently are)
   - Enter the **destination folder** path (where you want them to go)
   - Type `move` to move files, or just press **Enter** to copy them

> **Tip:** You can paste a folder path by right-clicking in the PowerShell window.

---

## Example

```
Enter the origin folder path: C:\Users\Patrick\Downloads\Reports
Enter the destination folder path: C:\Users\Patrick\Documents\Archived
Type 'move' to move files or press Enter to copy: [Enter]

Copied: Q1-Summary.xlsx → Q1-Summary_03152026.xlsx
Copied: Budget.xlsx     → Budget_01082026.xlsx
```

---

## Notes

- Only files directly inside the source folder are processed — subfolders are not included
- If a file with the same name already exists in the destination, it will be overwritten
- Date format used is `MMDDYYYY` based on the file's **last modified** date
