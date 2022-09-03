@echo off
(
echo [FirefoxPortable]
echo FirefoxDirectory=App\Firefox
echo ProfileDirectory=Data\%~n0
echo SettingsDirectory=Data\settings
echo PluginsDirectory=Data\plugins
echo FirefoxExecutable=firefox.exe
echo AdditionalParameters=
echo LocalHomepage=
echo DisableSplashScreen=true
echo AllowMultipleInstances=true
echo DisableIntelligentStart=false
echo SkipCompregFix=false
echo RunLocally=false
) > %cd%/ff/FirefoxPortable.ini &
%cd%\ff\FirefoxPortable.exe