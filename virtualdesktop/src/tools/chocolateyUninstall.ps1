$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$exeFiles = @(
    'VirtualDesktop.exe',
    'VirtualDesktop11.exe',
    'VirtualDesktop11-24H2.exe',
    'VirtualDesktopServer2016.exe',
    'VirtualDesktopServer2022.exe'
)

foreach ($exe in $exeFiles) {
    $filePath = Join-Path $toolsDir $exe
    if (Test-Path $filePath) {
        Remove-Item $filePath -Force
    }
}
