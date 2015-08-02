#PowerShell script to disable User Account Control
#Tested with PowerShell version 2 and Windows Server 2008 R2.
#Source: http://boxstarter.codeplex.com/SourceControl/latest#Boxstarter.WinConfig/Disable-UAC.ps1

function Disable-UAC {
<#
.SYNOPSIS
Turns off Windows User Access Control

.LINK
http://boxstarter.codeplex.com
Enable-UAC

#>
    Write-BoxstarterMessage "Disabling UAC"
    Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name EnableLUA  -Value 0
}