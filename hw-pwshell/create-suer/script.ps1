function New-User {
    [CmdletBinding()]
    param (
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]$Name=$(throw "Name is mandatory, please provide a value."),

        [Parameter()]
        [string]$Directory,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]$Password=$(throw "Password is mandatory, please provide a value."),

        [Parameter()]
        [switch]$SshAccess,

        [Parameter()]
        [switch]$Enable
    )

    Write-Host "Username: $Name"
    Write-Host "Password: $Password"

    Write-Host "SshAccess: $SshAccess"
    Write-Host "Enable: $Enable"

    if ($PSBoundParameters.ContainsKey('Directory')) {
      Write-Host "Directory: $Directory"
      /usr/sbin/useradd --directory $Directory --password $Password $Name
    } else {
      Write-Host "Directory is not set, use default"
      /usr/sbin/useradd --password $Password $Name
    }
}