param (
    [string]$path = ".",
    [string[]]$excludeDirectories = @(
        ".git", ".hg", ".svn", ".VSCodeCounter",
        "__pycache__", ".pytest_cache", ".mypy_cache", ".ruff_cache", ".tox", ".nox",
        ".venv", "venv", "env", "node_modules", "vendor",
        "build", "dist", "out", "bin", "obj", "target", "coverage",
        ".cache", ".next", ".nuxt", ".output", ".parcel-cache", ".turbo", ".gradle", ".dart_tool"
    )
)

$totalLines = 0
$supportedExtensions = @("*.py", "*.js", "*.jsx", "*.ts", "*.tsx", "*.css", "*.scss", "*.html", "*.cs", "*.c", "*.cpp", "*.h", "*.php", "*.java", "*.go", "*.rb", "*.rs", "*.swift", "*.kt", "*.lua", "*.sh", "*.bat", "*.ps1")

function Get-SourceFiles {
    param ([string]$directory)

    # Prune excluded folders before traversal, including nested dependencies/caches.
    # Do not follow directory links, which may lead outside the project or loop.
    Get-ChildItem -LiteralPath $directory | ForEach-Object {
        if ($_.PSIsContainer) {
            if ($excludeDirectories -notcontains $_.Name -and
                -not ($_.Attributes -band [System.IO.FileAttributes]::ReparsePoint)) {
                Get-SourceFiles -directory $_.FullName
            }
        }
        elseif ($supportedExtensions -contains ("*" + $_.Extension)) {
            $_
        }
    }
}

Get-SourceFiles -directory $path | ForEach-Object {
    $extension = $_.Extension
    $lines = 0

    if ($extension -eq ".py") {
        $lines = Get-Content -LiteralPath $_.FullName -Raw | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".js") {
        $lines = Get-Content -LiteralPath $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".jsx") {
        $lines = Get-Content -LiteralPath $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".ts") {
        $lines = Get-Content -LiteralPath $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".tsx") {
        $lines = Get-Content -LiteralPath $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".css") {
        $lines = Get-Content -LiteralPath $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".scss") {
        $lines = Get-Content -LiteralPath $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".html") {
        $lines = Get-Content -LiteralPath $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".cs") {
        $lines = Get-Content -LiteralPath $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".c") {
        $lines = Get-Content -LiteralPath $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".cpp") {
        $lines = Get-Content -LiteralPath $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".h") {
        $lines = Get-Content -LiteralPath $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".php") {
        $lines = Get-Content -LiteralPath $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".java") {
        $lines = Get-Content -LiteralPath $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".go") {
        $lines = Get-Content -LiteralPath $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".rb") {
        $lines = Get-Content -LiteralPath $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".rs") {
        $lines = Get-Content -LiteralPath $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".swift") {
        $lines = Get-Content -LiteralPath $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".kt") {
        $lines = Get-Content -LiteralPath $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".lua") {
        $lines = Get-Content -LiteralPath $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".sh") {
        $lines = Get-Content -LiteralPath $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".bat") {
        $lines = Get-Content -LiteralPath $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".ps1") {
        $lines = Get-Content -LiteralPath $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    else {
        Write-Warning "Unsupported file extension: $extension"
    }

    $totalLines += $lines
    [PSCustomObject]@{ Lines = $lines; Path = $_.FullName }
}

Write-Output "Total Lines: $totalLines"
