$packageName = 'golang'
$version = '1.3.3'
$url = 'https://storage.googleapis.com/golang/go' + $version + '.windows-386.zip'
$url64 = 'https://storage.googleapis.com/golang/go' + $version + '.windows-amd64.zip'
$validExitCodes = @(0)

try {
    $binRoot = Get-BinRoot
    $goLangRoot = join-path $binRoot "go"
    
    if (Get-ProcessorBits 64) {
        $curentUrl = $url64
    } else {
        $curentUrl = $url
    }

    Install-ChocolateyZipPackage "$packageName" "$curentUrl" "$binRoot"
    
    Install-ChocolateyEnvironmentVariable 'GOROOT' "$goLangRoot" Machine
    # Add bin path to system PATH variable.
    Install-ChocolateyPath "$goLangRoot\bin" Machine
    # Add bin path to user PATH variable.
    #Install-ChocolateyPath "$goLangRoot\bin" User
}
catch {
    Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
    throw
}