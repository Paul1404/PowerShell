﻿<#
.SYNOPSIS
	Executes scripts on desktop login
.DESCRIPTION
	This PowerShell script executes welcome scripts on every desktop user login.
	Just put a symbolic link to this script into the Autostart folder (usually at: C:\Users\<USERNAME>\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup).
.EXAMPLE
	PS> ./on-desktop-login.ps1
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz | License: CC0
#>

try {
	& "$PSScriptRoot/write-quote.ps1"
	" "
	& "$PSScriptRoot/open-dashboards.ps1"
	& "$PSScriptRoot/list-news.ps1"
	& "$PSScriptRoot/write-clock.ps1"
	exit 0 # success
} catch {
        "⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
        exit 1
}
