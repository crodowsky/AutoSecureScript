@echo off

cls title Installing N-able Remote Monitoring Software


SET "server=manage.itsaboutaction.com" 
SET "customerID=101" 
SET "installerLocation=DC01\it_installs" 
SET "AgentAlreadyInstalled=The N-able Agent is already installed" 
SET "notInstalled=The N-able Agent is not yet installed, installing it now..." 
SET "programFiles=c:\program files" 

REM Check to see if its x86 or x64 IF %PROCESSOR_ARCHITECTURE% EQU AMD64 ( SET "programFiles=%programFiles% (x86)" ) 

REM Debug Information echo %server% echo %customerID% echo %installerLocation% echo %programFiles% 

IF NOT EXIST "%programFiles%\N-Able Technologies\Windows Agent\bin\agent.exe" ( GOTO AGENTINSTALL ) else ( GOTO AgentAlreadyInstalled ) 

GOTO: OpenInstall


:AGENTINSTALL


echo %notInstalled% 

\\%installerLocation%\101WindowsAgentSetup.exe /s /v" /qn CUSTOMERID=%customerID% CUSTOMERSPECIFIC=1 SERVERPROTOCOL=HTTPS SERVERADDRESS=%server% SERVERPORT=443 "


GOTO  OpenInstall


:AgentAlreadyInstalled

echo %AgentAlreadyInstalled%



GOTO  OpenInstall

:OpenInstall
PAUSE

title Intalling OpenDNS software

SET "installerLocation=DC01\it_installs\OpenDNS"

SET	"OpenDNSAlreadyInstalled=OpenDNS is already installed"

SET	"OpenDNSNotInstalled=OpenDNS is not yet installed, installing it now..."

SET	"programFiles=c:\program files"



REM       Check to see if its x86 or x64

IF %PROCESSOR_ARCHITECTURE% EQU  AMD64 ( SET "programFiles=%programFiles% (x86)" )


echo %installerLocation%

echo %programFiles%


IF NOT EXIST "%programFiles%\OpenDNS " ( GOTO OPENDNSINSTALL ) else ( GOTO OpenDNSAlreadyInstalled )


:OPENDNSINSTALL

echo %OpenDNSNotInstalled%

msiexec /i %installerLocation%\OpenDNS\Setup.msi /qn ORG_ID=129091 ORG_FINGERPRINT=404746c5b87e8eba254db21511f5c3f7 USER_ID=5239367



GOTO  AVInstall



:OPENDNSAlreadyInstalled

echo %OpenDNSAlreadyInstalled%



GOTO  AVInstall

:AVInstall
PAUSE
title Intalling Sophos Anti-virus software

SET	"\\DC01\it_Installs\=%3"

SET	"AVAlreadyInstalled=Sophos anti-virus is already installed"

SET	"AVNotInstalled=Sophos anti-virus software is not yet installed, installing it now..."

SET	"programFiles=c:\program files"



REM       Check to see if its x86 or x64

IF %PROCESSOR_ARCHITECTURE% EQU  AMD64 ( SET "programFiles=%programFiles% (x86)" )

echo \\DC01\it_Installs\

echo %programFiles%


IF NOT EXIST "%programFiles%\Sophos " ( GOTO ANTIVIRUSINSTALL ) else ( GOTO AVAlreadyInstalled )

;GOTO: OPENDNSInstall



:ANTIVIRUSINSTALL

echo %AVNotInstalled%

\\DC01\it_Installs\Sophos\SophosInstall.exe /s /v" /quiet /qn 


GOTO  END



:AVAlreadyInstalled

echo %AVAlreadyInstalled%



GOTO END

:END