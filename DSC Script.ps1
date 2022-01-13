
# create a DSC configuration to install IIS and support remote management.
configuration IISConfig {

    # define input parameter
    param(
    [string[]] $computername = 'localhost'
    )

    # target machine(s) based on input param
    node $computername {

        # configure the LCM
        LocalConfigurationManager {
        ConfigurationMode = "ApplyAndAutoCorrect"
        ConfigurationModeFrequencyMins = 15
        RefreshMode = "Push"
        }

        # install the IIS server role
        windowsfeature IIS {
        ensure = "Present"
        name = "web-server"
        }

        #install the IIS remote management service
        windowsfeature IISManagement {
        name = 'Web-Mgmt-Service'
        Ensure = 'Present'
        DependsOn = @('[WindowsFeature]IIS')
        }

        # enable IIS remote management
        Registry RemoteManagement {
        key = 'HKLM:\SOFTWARE\Microsoft\WebManagement\Server'
        valuename = 'EnableRemoteManagement'
        valuetype = 'Dword'
        valuedata = '1'
        DependsOn = @('[WindowsFeature]IIS','[WindowsFeature]IISManagement')
        }

        # configure remote management service
        service WMSVC {
        name = 'WMSVC'
        startuptype = 'Automatic'
        state = 'Running'
        DependsOn = '[Registry]RemoteManagement'
        }
    }
}



# create the configuration (.mof)
IISConfig -computername server2016core -outputpath C:\ITBilik

# push the configuration to server2016core
start-DscConfiguration -path C:\ITBilik -wait -verbose



# enter powershell remote session
enter-pssession -computername server2016core

# view installed features
get-windowsfeature | where-object installed -eq True

# view LCM properties
get-DscLocalConfigurationManager

# view configuration state
get-DscConfigurationStatus

# test configuration drift
test-DscConfiguration

# exit powershell remote session
exit-pssession
