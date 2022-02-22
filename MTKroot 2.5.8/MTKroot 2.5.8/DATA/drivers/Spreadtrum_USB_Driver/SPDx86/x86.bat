@echo off&color a && Title [ Instalador drivers SPD ]
:: lee e instala los archivos desde directorio o subdirectorio
cd %~dp0

:: busca todos los archivos drivers
for /f "tokens=* delims=" %%a in ('dir /b /s /o:gen *.inf') do (
echo == Instalando controladores SPD x86 == "%%a"
:: Delay
ping -n 4 localhost 1>nul

:: Windows Plug-n-Play Installer
::pnputil /enum-drivers
::pnputil /add-driver %%a
pnputil /add-driver SciU2S.inf
)
echo * FIN *
Echo.&Echo.&Echo.
echo ====&pause>nul
exit