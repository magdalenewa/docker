Write-Host "Congratulations! Your first script executed successfully"
Start-Process "C:\Program Files (x86)\TRICENTIS\Tosca Testsuite\ToscaCommander\ToscaCI\ToscaCIRemoteExecutionService.exe" -ArgumentList "pause"
Start-Process "C:\Program Files (x86)\TRICENTIS\Tosca Testsuite\ToscaCommander\ToscaCI\Client\ToscaCIClient.exe" -Wait -ArgumentList "-m", "distributed"
