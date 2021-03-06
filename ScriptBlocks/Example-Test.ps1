#Requires -Version 3.0

[CmdletBinding()]
Param (
    [Parameter(Mandatory)]
    [string]$ComputerName,
    [System.Management.Automation.PSVariable[]]$Variables
)

$ErrorActionPreference = 'Stop'

Write-Debug -Message ('ENTER {0}' -f $MyInvocation.MyCommand.Name)

try {
    Write-Debug -Message ('ENTER TRY {0}' -f $MyInvocation.MyCommand.Name)

    # Put here code which you want to execute at the Test step.

    Write-Debug -Message '$true'
    $true # Really, you should put some commands here instead, which will test readiness of your node.

    Write-Debug -Message ('EXIT TRY {0}' -f $MyInvocation.MyCommand.Name)
}
catch {
    Write-Debug -Message ('ENTER CATCH {0}' -f $MyInvocation.MyCommand.Name)

    Write-Debug -Message ('{0}: $PSCmdlet.ThrowTerminatingError($_)' -f $MyInvocation.MyCommand.Name)
    $PSCmdlet.ThrowTerminatingError($_)

    Write-Debug -Message ('EXIT CATCH {0}' -f $MyInvocation.MyCommand.Name)
}

Write-Debug -Message ('EXIT {0}' -f $MyInvocation.MyCommand.Name)