REM Install Rtools.
@echo off
call tools.cmd :Configure

REM Ensure we have required tools on PATH.
call tools.cmd :EnsureProgram %WGET%
call tools.cmd :EnsureProgram 7z

set "OLDDIR=%CD%"
set "CRAN=http://cran.r-project.org"
set "RTOOLS_ROOT_DIR=C:\Rtools"
set "RTOOLS_VERSION=33"
set "RTOOLS_URL=%CRAN%/bin/windows/Rtools/Rtools%RTOOLS_VERSION%.exe"

call tools.cmd :EnsureDirectory %RTOOLS_ROOT_DIR%
call tools.cmd :EnsureDirectory %RTOOLS_ROOT_DIR%\download
cd %RTOOLS_ROOT_DIR%\download

REM Download Rtools.
echo.
echo --- Downloading Rtools%RTOOLS_VERSION%.exe ...
echo.

"%WGET%" -c %RTOOLS_URL%

REM Install Rtools.
echo - Installing Rtools -- a prompt may display on your screen.
set "RTOOLS_INSTALLER=.\Rtools%RTOOLS_VERSION%.exe"
if not exist ..\bin (
    "%RTOOLS_INSTALLER%" /VERYSILENT
)

REM Download the updated toolchains.
set "TOOLCHAIN_URL=http://45.55.8.100/packages/x86_64-w64-mingw32"
set "TOOLCHAIN_32BIT_FILENAME=i686-w64-mingw32-gcc-4.9.2-win64.7z"
set "TOOLCHAIN_64BIT_FILENAME=x86_64-w64-mingw32-gcc-4.9.2-win64.7z"


echo.
echo --- Downloading and unpacking 32bit toolchain ...
echo.

if exist mingw32 rmdir /s /q mingw32
if exist ..\gcc492_32 rmdir /s /q ..\gcc492_32
"%WGET%" -c "%TOOLCHAIN_URL%/%TOOLCHAIN_32BIT_FILENAME%"
7z x -y %TOOLCHAIN_32BIT_FILENAME% > nul
timeout /t 1 /nobreak > nul
move mingw32 ..\gcc492_32

echo.
echo --- Downloading and unpacking 64bit toolchain ...
echo.

if exist mingw64 rmdir /s /q mingw64
if exist ..\gcc492_32 rmdir /s /q ..\gcc492_64
"%WGET%" -c "%TOOLCHAIN_URL%/%TOOLCHAIN_64BIT_FILENAME%"
7z x -y %TOOLCHAIN_64BIT_FILENAME% > nul
timeout /t 1 /nobreak > nul
move mingw64 ..\gcc492_64

cd %OLDDIR%
echo * RTools successfully unpacked and installed! *
pause

