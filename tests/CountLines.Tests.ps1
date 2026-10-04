$ErrorActionPreference = 'Stop'
$counter = Join-Path (Split-Path $PSScriptRoot -Parent) 'CountLines.ps1'
$tempRoot = [System.IO.Path]::GetFullPath([System.IO.Path]::GetTempPath())
$fixture = Join-Path $tempRoot ('count-lines-test-' + [guid]::NewGuid().ToString('N'))

function Assert-Count {
    param ($result, [int]$expectedTotal, [int]$expectedFiles)

    $files = @($result | Where-Object { $null -ne $_.PSObject.Properties['Path'] })
    if ($result[-1] -ne "Total Lines: $expectedTotal" -or $files.Count -ne $expectedFiles) {
        throw "Expected $expectedFiles files and $expectedTotal lines; got $($files.Count) files and $($result[-1])"
    }
}

try {
    New-Item -ItemType Directory -Path $fixture | Out-Null
    $sources = @('main.py', 'src/app.js', 'src/build-tools/task.ts', 'src/cache_helper.py', 'src/[example]/literal.py')
    $excluded = @(
        '__pycache__/cached.py', 'src/__pycache__/nested.py', 'src/NODE_MODULES/dependency.js',
        '.venv/Lib/library.py', 'venv/Lib/library.py', 'env/Lib/library.py',
        'vendor/library.php', 'build/generated.cs', 'dist/bundle.js', 'out/result.ts',
        'bin/generated.cs', 'obj/generated.cs', 'target/generated.rs', 'coverage/report.js',
        '.git/hook.sh', '.pytest_cache/cache.py', '.next/server.js'
    )
    foreach ($relative in ($sources + $excluded + @('src/compiled.pyc', 'notes.txt'))) {
        $file = Join-Path $fixture $relative
        [System.IO.Directory]::CreateDirectory([System.IO.Path]::GetDirectoryName($file)) | Out-Null
        [System.IO.File]::WriteAllText($file, "first line`nsecond line`n")
    }
    # A directory with a supported extension must not be treated as a file.
    New-Item -ItemType Directory -Path (Join-Path $fixture 'empty.py') | Out-Null

    $result = @(& $counter -path $fixture)
    Assert-Count $result 10 5
    $actualPaths = @($result | Where-Object { $null -ne $_.PSObject.Properties['Path'] } | ForEach-Object { $_.Path })
    foreach ($relative in $sources) {
        if ($actualPaths -notcontains (Join-Path $fixture $relative)) {
            throw "Missing source file: $relative"
        }
    }

    # Explicit exclusions replace the defaults and apply at every depth.
    Assert-Count @(& $counter -path $fixture -excludeDirectories @('src')) 32 16
    Assert-Count @(& $counter -path (Join-Path $fixture 'empty.py')) 0 0
    Write-Output 'All CountLines regression checks passed.'
}
finally {
    $resolvedFixture = [System.IO.Path]::GetFullPath($fixture)
    if (-not $resolvedFixture.StartsWith($tempRoot, [System.StringComparison]::OrdinalIgnoreCase) -or
        [System.IO.Path]::GetFileName($resolvedFixture) -notlike 'count-lines-test-*') {
        throw "Refusing to remove unexpected fixture path: $resolvedFixture"
    }
    if (Test-Path -LiteralPath $resolvedFixture) {
        Remove-Item -LiteralPath $resolvedFixture -Recurse -Force
    }
}
