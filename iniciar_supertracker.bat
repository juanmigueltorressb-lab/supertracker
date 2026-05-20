@echo off
title SuperTracker
color 0A

echo.
echo  =======================================
echo   SuperTracker v4 - Iniciando...
echo  =======================================
echo.

:: Verificar si Python esta instalado
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo  [ERROR] Python no esta instalado.
    echo.
    echo  Descargalo desde: https://www.python.org/downloads/
    echo  Marcá la opcion "Add Python to PATH" al instalar.
    echo.
    pause
    exit /b
)

:: Matar cualquier instancia previa en puerto 8080
for /f "tokens=5" %%a in ('netstat -aon ^| findstr ":8080" ^| findstr "LISTENING" 2^>nul') do (
    taskkill /PID %%a /F >nul 2>&1
)

:: Iniciar servidor en segundo plano
echo  Iniciando servidor local...
start /B python -m http.server 8080 2>nul

:: Esperar que levante
timeout /t 2 /nobreak >nul

:: Abrir en Chrome (buscar en ubicaciones comunes)
set CHROME=""
if exist "%ProgramFiles%\Google\Chrome\Application\chrome.exe" set CHROME="%ProgramFiles%\Google\Chrome\Application\chrome.exe"
if exist "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" set CHROME="%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe"
if exist "%LocalAppData%\Google\Chrome\Application\chrome.exe" set CHROME="%LocalAppData%\Google\Chrome\Application\chrome.exe"

if %CHROME%=="" (
    echo  Chrome no encontrado. Abriendo con el navegador predeterminado...
    start http://localhost:8080
) else (
    echo  Abriendo SuperTracker en Chrome...
    start "" %CHROME% --app=http://localhost:8080 --window-size=480,900
)

echo.
echo  SuperTracker corriendo en http://localhost:8080
echo.
echo  Cerrá esta ventana para apagar el servidor.
echo  (la app en Chrome se va a cerrar tambien)
echo.
pause

:: Al cerrar la ventana, matar el servidor
for /f "tokens=5" %%a in ('netstat -aon ^| findstr ":8080" ^| findstr "LISTENING" 2^>nul') do (
    taskkill /PID %%a /F >nul 2>&1
)
