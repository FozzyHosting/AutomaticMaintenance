function Resolve-ComputerMaintenanceConfigurationTemplate {
    #Requires -Version 3.0

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory)]
        [string]$Name
    )

    $ErrorActionPreference = 'Stop'

    Write-Debug -Message ('ENTER {0}' -f $MyInvocation.MyCommand.Name)

    try {
        Write-Debug -Message ('ENTER TRY {0}' -f $MyInvocation.MyCommand.Name)

        Write-Debug -Message ('$Name = ''{0}''' -f $Name)

        Write-Debug -Message ('$Template = Get-ComputerMaintenanceConfigurationTemplate -Name ''{0}''' -f $Name)
        $Template = Get-ComputerMaintenanceConfigurationTemplate -Name $Name
        Write-Debug -Message ('$Template: ''{0}''' -f [string]$Template)
        Write-Debug -Message '$IncludedTemplates = $Template.Include'
        $IncludedTemplates = $Template.Include
        Write-Debug -Message ('$IncludedTemplates: ''{0}''' -f [string]$IncludedTemplates)
        Write-Debug -Message '$IncludedTemplates = $IncludedTemplates | Sort-Object -Property ''Priority'''
        $IncludedTemplates = $IncludedTemplates | Sort-Object -Property 'Priority'
        Write-Debug -Message ('$IncludedTemplates: ''{0}''' -f [string]$IncludedTemplates)
        foreach ($TemplateDefinition in $IncludedTemplates) {
            Write-Debug -Message ('Resolve-ComputerMaintenanceConfigurationTemplate -Name ''{0}''' -f $TemplateDefinition.Name)
            Resolve-ComputerMaintenanceConfigurationTemplate -Name $TemplateDefinition.Name
        }

        Write-Debug -Message ('$Template: ''{0}''' -f [string]$Template)
        Write-Debug -Message '$Template'
        $Template

        Write-Debug -Message ('EXIT TRY {0}' -f $MyInvocation.MyCommand.Name)
    }
    catch {
        Write-Debug -Message ('ENTER CATCH {0}' -f $MyInvocation.MyCommand.Name)

        Write-Debug -Message ('{0}: $PSCmdlet.ThrowTerminatingError($_)' -f $MyInvocation.MyCommand.Name)
        $PSCmdlet.ThrowTerminatingError($_)

        Write-Debug -Message ('EXIT CATCH {0}' -f $MyInvocation.MyCommand.Name)
    }

    Write-Debug -Message ('EXIT {0}' -f $MyInvocation.MyCommand.Name)
}