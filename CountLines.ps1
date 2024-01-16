param (
    [string]$path = "."
)

$totalLines = 0
$supportedExtensions = @("*.py", "*.js", "*.jsx", "*.ts", "*.tsx", "*.css", "*.scss", "*.html", "*.cs", "*.c", "*.cpp", "*.h", "*.php", "*.java", "*.go", "*.rb", "*.rs", "*.swift", "*.kt", "*.lua", "*.sh", "*.bat", "*.ps1")

Get-ChildItem -Recurse -Path $path -Include $supportedExtensions | ForEach-Object {
    $extension = $_.Extension
    $lines = 0

    if ($extension -eq ".py") {
        $lines = Get-Content $_.FullName -Raw | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".js") {
        $lines = Get-Content $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".jsx") {
        $lines = Get-Content $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".ts") {
        $lines = Get-Content $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".tsx") {
        $lines = Get-Content $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".css") {
        $lines = Get-Content $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".scss") {
        $lines = Get-Content $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".html") {
        $lines = Get-Content $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".cs") {
        $lines = Get-Content $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".c") {
        $lines = Get-Content $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".cpp") {
        $lines = Get-Content $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".h") {
        $lines = Get-Content $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".php") {
        $lines = Get-Content $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".java") {
        $lines = Get-Content $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".go") {
        $lines = Get-Content $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".rb") {
        $lines = Get-Content $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".rs") {
        $lines = Get-Content $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".swift") {
        $lines = Get-Content $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".kt") {
        $lines = Get-Content $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".lua") {
        $lines = Get-Content $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".sh") {
        $lines = Get-Content $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".bat") {
        $lines = Get-Content $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    elseif ($extension -eq ".ps1") {
        $lines = Get-Content $_.FullName | Measure-Object -Line | Select-Object -ExpandProperty Lines
    }
    else {
        Write-Warning "Unsupported file extension: $extension"
    }

    $totalLines += $lines
    [PSCustomObject]@{ Lines = $lines; Path = $_.FullName }
}

Write-Output "Total Lines: $totalLines"
