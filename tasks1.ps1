# tasks.ps1 - Project task runner
# Usage:
#   .\tasks.ps1 build
#   .\tasks.ps1 test
#   .\tasks.ps1 lint

param(
    [ValidateSet("build", "test", "lint", "all")]
    [string]$Task = "all"
)

$ErrorActionPreference = "Stop"

function Write-Task {
    param([string]$Name)
    Write-Host "`n>> Running: $Name" -ForegroundColor Cyan
}

function Invoke-Build {
    Write-Task "build"
    go build ./cmd/...
}

function Invoke-Test {
    Write-Task "test"
    go test -race ./...
}

function Invoke-Lint {
    Write-Task "lint"
    golangci-lint run ./...
}

switch ($Task) {
    "build" { Invoke-Build }
    "test"  { Invoke-Test }
    "lint"  { Invoke-Lint }
    "all"   {
        Invoke-Build
        Invoke-Test
        Invoke-Lint
        Write-Host "`nAll tasks passed." -ForegroundColor Green
    }
}