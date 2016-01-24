[CmdletBinding()]
param(
	[string] $environmentConfigurationFilePath = (Join-Path (Split-Path -parent $MyInvocation.MyCommand.Definition) "deployment_configuration.json" ),
	[string] $productConfigurationFilePath = (Join-Path (Split-Path -parent $MyInvocation.MyCommand.Definition) "configuration.xml" )
)

$scriptPath = Split-Path -parent $MyInvocation.MyCommand.Definition
Import-Module $scriptPath\PowershellModules\CommonDeploy.psm1 -Force

$rootPath = Split-Path -parent $scriptPath

$e = $environmentConfiguration = Read-ConfigurationTokens $environmentConfigurationFilePath
$p = $productConfiguration = Get-Configuration $environmentConfigurationFilePath $productConfigurationFilePath

$confileFilePath = "$rootPath\bin\logstash.conf"

$config = @"
input { 
	#stdin { } 
	gelf {}
}
filter {
	mutate{
		convert => [ "timeTakenMs", "integer" ]
		convert => [ "level", "string" ]
	}
	if [level] == "" {
	}
	else if [level] == "7" {
		mutate { 
			replace => ["level", "DEBUG"] 
		}
	}
	else if [level] == "6" {
		mutate { 
			replace => ["level", "INFO"] 
		}
	}
	else if [level] == "5" {
		mutate { 
			replace => ["level", "INFO"] 
		}
	}
	else if [level] == "4" {
		mutate { 
			replace => ["level", "WARN"] 
		}
	}
	else if [level] == "3" {
		mutate { 
			replace => ["level", "ERROR"] 
		}
	}
	else if [level] == "2" {
		mutate { 
			replace => ["level", "ERROR"] 
		}
	}
	else if [level] == "1" {
		mutate { 
			replace => ["level", "ERROR"] 
		}
	}
	else if [level] == "0" {
		mutate { 
			replace => ["level", "FATAL"] 
		}
	}
}

output {
	stdout {
		codec => rubydebug 
	}	
	elasticsearch {
		host => "$($e.ElasticSearchHost)"
		protocol => "$($e.ElasticSearchProtocol)"
		cluster=> $($e.ElasticSearchCluster)
	}		
}	
"@

Set-Content -Path $confileFilePath -Value $config