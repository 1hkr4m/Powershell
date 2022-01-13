# Install Network Load Balancing feature and Web server roles on NLB nodes
Invoke-Command server2016, server2016-2 { install-windowsfeature NLB, Rsat-NLB, web-server }

# NLB cmdlets from Rsat-NLB feature
get-command -module NetworkLoadBalancingClusters

# Modify default IIS webpage to reflect hostname
Invoke-Command server2016, server2016-2 { "Salam! Bu <b>$env:computername</b> xostudur." > c:\inetpub\wwwroot\iisstart.htm }
