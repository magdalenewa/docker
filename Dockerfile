FROM mcr.microsoft.com/windows/servercore:1803-amd64
WORKDIR "/Tosca/"
COPY ["Tricentis Tosca 13.0.0.exe", "C:/Tosca"]
RUN powershell.exe '.\Tricentis Tosca 13.0.0.exe /s INSTALLDIR=C:\Tosca MOBILE_TESTING=1 DIAGNOSTICS=1 ADDLOCAL DexAgent START_SERVICES=1 TOSCA_PROJECTS /qn'
RUN dir
