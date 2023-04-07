# EXIF date to file created/modified date QuickAction

This sets the "created at" date from EXIF data of an image to the file created and modified date.

Useful for sorting and organizing image files, as more often than not the created date on the system is overwritten to the date the image is actually copied to the disk, and not when it was created.

## Requirements

- macOS (Linux/Windows not supported at the moment)
- Developer tools (script uses [SetFile](https://ss64.com/osx/setfile.html) utility)

Install developer tools by running the following in terminal. Ignore if devtools or xcode are already installed.

```bash
xcode-select --install
```


## Installation

Open the workflow, and save it by giving it any name.

Alternatively:

| Step | Example |
|------|---------|
| 1. Create a new Automator Quick Action | ![Quick Action](/examples/quick_action.png) |
| 2. Specify the action inputs (image files from Finder) | ![Inputs](/examples/inputs.png) |
| 3. Drag the "Run Shell Script" workflow to the action window. Choose `/bin/bash` as shell. Pass input `as arguments`. | ![Run Script](/examples/run_script.png) |
| 4. Paste the script contents `exif_to_created_at.sh` on to the script input field. | ![Workflow](/examples/workflow.png) |
| 5. Save the script (⌘S) | ![Save](/examples/save.png) |

The quick action will now appear on finder.


## Usage/Example

| Description | Image |
|-------------|-------|
| Creation date for this image is the date it was copied to a disk,  | ![Created Modified Date](/examples/created_modified_date.png) |
| EXIF data shows the proper camera capture date | ![EXIF date](/examples/exif_date.png) |
| Run the script from finder | ![Run script](/examples/run_action.png) |
| Dates are now updated! | ![Success](/examples/success.png) |
