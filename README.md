# Count Code Lines

![GitHub license](https://img.shields.io/github/license/Naereen/StrapDown.js.svg)

_**NOTE:** Node.js and PowerShell is required to use this script._

## Table of Contents

- [Description](#description)
- [Usage](#usage)
  - [VSCode extension](#vscode-extension)
  - [Keyboard shortcut](#keyboard-shortcut)
- [License](#license)



## Description

The "countlines" extension for VSCode counts source lines in the terminal's current project directory and displays the result in a terminal window.

The counter skips common cache, dependency, and generated-output folders at any depth:

- Python caches and environments: `__pycache__`, `.pytest_cache`, `.mypy_cache`, `.ruff_cache`, `.tox`, `.nox`, `.venv`, `venv`, `env`
- Dependencies: `node_modules`, `vendor`
- Build output and reports: `build`, `dist`, `out`, `bin`, `obj`, `target`, `coverage`, `.VSCodeCounter`
- Tool caches and output: `.cache`, `.next`, `.nuxt`, `.output`, `.parcel-cache`, `.turbo`, `.gradle`, `.dart_tool`
- Version control: `.git`, `.hg`, `.svn`

Directory names are matched exactly (case-insensitively), so names like `build-tools` still count. Directory links are not followed. Only the supported source-file extensions below are counted; compiled Python files such as `.pyc` are already excluded. This does not read `.gitignore`.

When running the PowerShell script directly, you can replace the default exclusions if your project uses one of these names for source code:

```powershell
./CountLines.ps1 -path . -excludeDirectories @('__pycache__', 'node_modules', 'custom-cache')
```

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

### VSCode extension

1. Press `Ctrl + Shift + P`
2. Type `Count Code Lines`
3. Press `Enter`

### Keyboard shortcut

If you have the extension installed, you can press `Ctrl + Alt + Z` to count the lines of code in the project.
The default keyboard shortcut can be changed in the VSCode settings.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.
# 
