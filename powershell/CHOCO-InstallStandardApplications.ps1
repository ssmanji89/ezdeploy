function Install-RequiredPackages {
    # Check if Chocolatey is installed
    try {
        choco -v | Out-Null
    }
    catch {
        # Install Chocolatey
        Write-Host "Installing Chocolatey..."
        Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    }

    # Install Visual Studio 2019 Community Edition
    Write-Host "Installing Visual Studio 2019..."
    choco install visualstudio2019community -y

    # Install .NET Framework 4.7 SDK
    Write-Host "Installing .NET Framework 4.7 SDK..."
    choco install netfx-4.7-devpack -y

    # Install .NET Framework 4.8 SDK
    Write-Host "Installing .NET Framework 4.8 SDK..."
    choco install netfx-4.8-devpack -y

    # Install .NET Core 3.1 SDK
    Write-Host "Installing .NET Core 3.1 SDK..."
    choco install dotnetcore-sdk -y --version=3.1.403

    # Install PowerShell 7
    Write-Host "Installing PowerShell 7..."
    choco install powershell-core -y
}

# Run the function to install required packages
Install-RequiredPackages
