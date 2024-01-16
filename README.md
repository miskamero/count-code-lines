# README.md

This file serves as the documentation for the "count-code-lines" project.

## Description

The "count-code-lines" project is a tool that allows you to count the number of lines in a given code file or directory.
Currently supported languages are:
- Python
- JavaScript
- JavaScript (React)
- TypeScript
- TypeScript (React)
- CSS
- SCSS
- HTML
- C#
- C
- C++
- C Header
- PHP
- Java
- Go
- Ruby
- Rust
- Swift
- Kotlin
- Lua
- Shell Script
- Batch Script
- PowerShell

## Usage

### VSCode shortcut example

1. Open VSCode
2. Press `Ctrl + Shift + P`
3. Type `Preferences: Open Keyboard Shortcuts (JSON)` and press `Enter`
4. Add a new keybind as a shortcut for the script, here is an example:

```json
[
    {
        "key": "ctrl+shift+z",
        "command": "workbench.action.terminal.sendSequence",
        "args": {
            "text": "PowerShell -ExecutionPolicy Bypass -File \"C:\\SCRIPT\\PATH\\HERE\\CountLines.ps1\"\u000D"
        },
        "when": "editorTextFocus && !editorReadonly"
    }
]
```
Replace `C:\\SCRIPT\\PATH\\HERE\\CountLines.ps1` with the path to the script.

You can replace `ctrl+shift+z` with any key combination you want.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.
# 
