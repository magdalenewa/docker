FROM mcr.microsoft.com/windows/servercore:1803
EXPOSE 443
WORKDIR "C:/Tosca"
COPY Tosca.exe "C:\Tosca"
RUN Tosca.exe /s /qn -Wait
COPY ["License.xml", "C:/ProgramData/TRICENTIS/Tosca Testsuite/7.0.0/License"]
COPY ["Draeger_shared_repository/", "C:/TOSCA_PROJECTS/TOSCA_WORKSPACES/Draeger_shared_repository"]
COPY ["ToscaCIRemoteExecutionService.exe.config", "C:/Program Files (x86)/TRICENTIS/Tosca Testsuite/ToscaCommander/ToscaCI"]
WORKDIR "C:/Program Files (x86)/TRICENTIS/Tosca Testsuite/ToscaCommander/ToscaCI"
COPY ["powershell.ps1", "C:/Program Files (x86)/TRICENTIS/Tosca Testsuite/ToscaCommander/ToscaCI"]
RUN powershell .\powershell.ps1
WORKDIR "C:/Program Files (x86)/TRICENTIS/Tosca Testsuite/Licensing"
RUN .\ToscaLicenseConfiguration connect-cloud ...
WORKDIR "C:/Program Files (x86)/TRICENTIS/Tosca Testsuite/ToscaCommander/ToscaCI/Client"
RUN ["ToscaCIClient.exe", "-m", "distributed"]
