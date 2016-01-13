@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

@echo off

:menu
cls
echo.
echo ********** Menu de lancement **********
echo ------------------------------------------
echo Installation de l'agent Windows 2.3.16 x64
echo ------------------------------------------
echo 1. Agent Fusion Inventory Serveur
echo 2. Agent Fusion Inventory Spare
echo 3. Agent Fusion Inventory Formateur
echo 4. Agent Fusion Inventory Visa portables
echo 5. Agent Fusion Inventory Test
echo 6. Agent Fusion Inventory Autre
echo.
echo Q. Quitter
echo.
set /p choix=Choisissez la salle.
if not %choix%=='' set choix=%choix:~0,1%
if %choix%==1 goto Install_Serveur
if %choix%==2 goto Install_Spare
if %choix%==3 goto Install_Formateur
if %choix%==4 goto Install_Portables_Visa
if %choix%==5 goto Install_Test
if %choix%==6 goto Install_Autre
if %choix%=q goto Quitter
goto fin

:erreur
echo Il y a eu une erreur.
goto fin

:Quitter
goto fin

:Install_Serveur
fusioninventory-agent_windows-x64_2.3.17.exe /S /acceptlicense /runnow /server='http://glpi.cefim.eu/plugins/fusioninventory/' /no-ssl-check /installtype=from-scratch /installtasks=Inventory /execmode=Service /no-category=Printer /no-start-menu /delaytime=16 /add-firewall-exception /tag=serveur
:fin
goto menu

:Install_Spare
fusioninventory-agent_windows-x64_2.3.17.exe /S /acceptlicense /runnow /server='http://glpi.cefim.eu/plugins/fusioninventory/' /no-ssl-check /installtype=from-scratch /installtasks=Inventory /execmode=Service /no-category=Printer /no-start-menu /delaytime=16 /add-firewall-exception /tag=spare
:fin
goto menu

:Install_formateur
fusioninventory-agent_windows-x64_2.3.17.exe /S /acceptlicense /runnow /server='http://glpi.cefim.eu/plugins/fusioninventory/' /no-ssl-check /installtype=from-scratch /installtasks=Inventory /execmode=Service /no-category=Printer /no-start-menu /delaytime=16 /add-firewall-exception /tag=formateur
:fin
goto menu

:Install_Portables_Visa
fusioninventory-agent_windows-x64_2.3.17.exe /S /acceptlicense /runnow /server='http://glpi.cefim.eu/plugins/fusioninventory/' /no-ssl-check /installtype=from-scratch /installtasks=Inventory /execmode=Service /no-category=Printer /no-start-menu /delaytime=16 /add-firewall-exception /tag=visa portable
:fin
goto menu

:Install_Test
fusioninventory-agent_windows-x64_2.3.17.exe /S /acceptlicense /runnow /server='http://glpi.cefim.eu/plugins/fusioninventory/' /no-ssl-check /installtype=from-scratch /installtasks=Inventory /execmode=Service /no-category=Printer /no-start-menu /delaytime=16 /add-firewall-exception /tag=Test
:fin
goto menu

:Install_Autre
fusioninventory-agent_windows-x64_2.3.17.exe /S /acceptlicense /runnow /server='http://glpi.cefim.eu/plugins/fusioninventory/' /no-ssl-check /installtype=from-scratch /installtasks=Inventory /execmode=Service /no-category=Printer /no-start-menu /delaytime=16 /add-firewall-exception /tag=
:fin
goto menu


