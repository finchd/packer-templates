###################################################
# Things for vagrant-windows: https://github.com/WinRb/vagrant-windows
# vagrant-windows is a Vagrant plugin that provides hooks for
# Vagrant to set things up on Windows VMs when they boot. You have
# to set up several things in the base box, though, in order for the
# plugin to work correctly. These things are done via this PowerShell script.
################################################### 

#WinRM setup
# According to: http://blucorenetizen.blogspot.com/2011/09/invalid-use-of-command-line-winrmerror.html
# ...you have to single-quote the '@{}' arguments in order for the commands to work in PowerShell:

winrm quickconfig -q
winrm set winrm/config/winrs '@{MaxMemoryPerShellMB="512"}'
winrm set winrm/config '@{MaxTimeoutms="1800000"}'
winrm set winrm/config/service '@{AllowUnencrypted="true"}'
winrm set winrm/config/service/auth '@{Basic="true"}'

#Turn off UAC
#See scripts/uac_disable.ps1

#Disable complex passwords
#Source: http://vlasenko.org/2011/04/27/removing-password-complexity-requirements-from-windows-server-2008-core/

secedit /export /cfg c:\new.cfg
${c:new.cfg}=${c:new.cfg} | % {$_.Replace('PasswordComplexity=1', 'PasswordComplexity=0')}
secedit /configure /db $env:windir\security\new.sdb /cfg c:\new.cfg /areas SECURITYPOLICY
del c:\new.cfg

#Disable shutdown tracker
#Source: http://blogs.neudesic.com/post/2012/03/14/PowerShell-commands-to-help-configure-a-development-environment.aspx

#Create the registry key:
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT" -Name "Reliability" -Type "RegistryKey"
#Set its value:
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Reliability" -Name "ShutdownReasonOn" -Value "0" -PropertyType dword

#Disable "Server Manager" from appearing when you log in
#Source: 