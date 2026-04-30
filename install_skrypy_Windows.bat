@echo off
setlocal enabledelayedexpansion

echo === Searching for Python >= 3.10 ===

set PYTHON=

:: 1. Test python (launcher Windows)
where py >nul 2>nul
if %errorlevel%==0 (
    py -3.10 -c "exit()" >nul 2>nul
    if %errorlevel%==0 set PYTHON=py -3.10
)

:: 2. Test python
if not defined PYTHON (
    where python >nul 2>nul
    if %errorlevel%==0 (
        python -c "import sys; exit(0 if sys.version_info >= (3,10) else 1)" >nul 2>nul
        if %errorlevel%==0 set PYTHON=python
    )
)

:: 3. Test python3
if not defined PYTHON (
    where python3 >nul 2>nul
    if %errorlevel%==0 (
        python3 -c "import sys; exit(0 if sys.version_info >= (3,10) else 1)" >nul 2>nul
        if %errorlevel%==0 set PYTHON=python3
    )
)

if not defined PYTHON (
    echo Python >= 3.10 not found.
    echo Please install it manually or via:
    echo winget install Python.Python.3
    pause
    exit /b 1
)

echo Using: %PYTHON%
%PYTHON% --version

echo.
echo === Pip verification ===
%PYTHON% -m pip --version >nul 2>nul || %PYTHON% -m ensurepip --upgrade

echo.
echo === tkinter verification ===
%PYTHON% -c "import tkinter" >nul 2>nul
if %errorlevel% neq 0 (
    echo tkinter missing. Please reinstall Python with Tk support.
)

echo.
echo === venv verification ===
%PYTHON% -m venv --help >nul 2>nul
if %errorlevel% neq 0 (
    echo venv missing. Please reinstall Python.
)

:: Paths
set BASE=%USERPROFILE%\Applications\skrypy_venv
set SOURCE=%~dp0skrypy-pyqt5
set DEST=%BASE%\skrypy-pyqt5

echo.
echo === Creating virtual environment ===
if not exist "%BASE%" (
    %PYTHON% -m venv "%BASE%"
    echo Virtual environment created.
)

echo.
echo === Copy files ===
if not exist "%DEST%" mkdir "%DEST%"
xcopy "%SOURCE%\*" "%DEST%\" /E /I /Y >nul

echo Copy finished.

echo.
echo === Installing Python modules ===
call "%BASE%\Scripts\activate.bat"
python "%DEST%\install_modules.py"

echo.
echo === Creating shortcut ===

set SHORTCUT=%USERPROFILE%\Desktop\Skrypy.lnk
set TARGET=%BASE%\Scripts\python.exe
set SCRIPT=%DEST%\main.py

:: Création du raccourci via PowerShell
powershell -command ^
"$s=(New-Object -COM WScript.Shell).CreateShortcut('%SHORTCUT%'); ^
$s.TargetPath='%TARGET%'; ^
$s.Arguments='%SCRIPT%'; ^
$s.WorkingDirectory='%DEST%'; ^
$s.Save()"

echo Shortcut created on Desktop.

echo.
echo === Installation finished ===
pause
