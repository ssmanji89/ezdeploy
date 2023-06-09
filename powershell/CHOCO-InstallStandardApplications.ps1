param(
    $ErrorActionPreference = "Continue",
    $SkipRestart = 'False',
    $VerbosePreference = "Continue"
)

# https://github.com/microsoft/winget-cli/releases/download/v1.4.11071/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
$localPackage = "C:\Windows\Temp\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle";
Invoke-WebRequest ("https://github.com/microsoft/winget-cli/releases/download/v1.4.11071/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle") -OutFile $localPackage;

# https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx
$vcLibs = "C:\Windows\Temp\Microsoft.VCLibs.x64.14.00.Desktop.appx";
Invoke-WebRequest ("https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx") -OutFile $vcLibs;

# https://github.com/microsoft/winget-cli/releases/download/v1.4.11071/5d9d44b170c146e1a3085c2c75fcc2c1_License1.xml
$license = "C:\Windows\Temp\3463fe9ad25e44f28630526aa9ad5648_License1.xml";
Invoke-WebRequest ("https://github.com/microsoft/winget-cli/releases/download/v1.4.10173/3463fe9ad25e44f28630526aa9ad5648_License1.xml") -OutFile $license;

Add-AppxProvisionedPackage -online -PackagePath $localPackage -LicensePath $license -DependencyPackagePath $vclibs;

if ($SkipRestart -ne 'True') { Restart-Computer -Verbose -Force; }
