$ErrorActionPreference = 'Stop'

$packageName = 'virtualdesktop'
$version = 'V1.21'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$files = @(
    @{
        Name = 'VirtualDesktop.exe'
        Url  = "https://github.com/MScholtes/VirtualDesktop/releases/download/$version/VirtualDesktop.exe"
        Sha256 = '1b05d47c393bfed4453112672cbaf852f803bfedfb9bba2840d2abada1995c7e'
    },
    @{
        Name = 'VirtualDesktop11.exe'
        Url  = "https://github.com/MScholtes/VirtualDesktop/releases/download/$version/VirtualDesktop11.exe"
        Sha256 = 'f6532db79f6f0e4018ce77f08805d3fd3f7bb076cbfbac0ac8189fe5376d9e82'
    },
    @{
        Name = 'VirtualDesktop11-24H2.exe'
        Url  = "https://github.com/MScholtes/VirtualDesktop/releases/download/$version/VirtualDesktop11-24H2.exe"
        Sha256 = '8334b529d19e71662950821c91ed996a0e92df41c8d0a077e95151aa7041cb35'
    },
    @{
        Name = 'VirtualDesktopServer2016.exe'
        Url  = "https://github.com/MScholtes/VirtualDesktop/releases/download/$version/VirtualDesktopServer2016.exe"
        Sha256 = '09ca692671bd37a9eb3b62452d7f7afe0f7c3ed9f6e3927f6c6bffb0f892c617'
    },
    @{
        Name = 'VirtualDesktopServer2022.exe'
        Url  = "https://github.com/MScholtes/VirtualDesktop/releases/download/$version/VirtualDesktopServer2022.exe"
        Sha256 = 'd7d0d508b0e049dc0b08191ad50bf876b71724df57ecbf5575675bf6e7b04747'
    }
)

foreach ($file in $files) {
    $filePath = Join-Path $toolsDir $file.Name
    Get-ChocolateyWebFile -PackageName $packageName `
        -FileFullPath $filePath `
        -Url $file.Url `
        -Checksum $file.Sha256 `
        -ChecksumType 'sha256'
}
