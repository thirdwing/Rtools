REM 'Functions' used by other scripts.
REM Call them with e.g.
REM
REM     call tools.cmd :<fn> <args>
REM 
REM Weird, but it works.
call %*
goto :EOF

REM Generic configuration -- set environment variables
REM to required programs.
:Configure
call :Define WGET wget
call :Define SVN svn
call :Define ROOT_DIR %USERPROFILE%\R-src
call :Define RTOOLS_ROOT_DIR C:\Rtools
call :Define RTOOLS_VERSION 33
call :Define RTOOLS_BIN_DIR %RTOOLS_ROOT_DIR%\bin
call :Define TMPDIR %USERPROFILE%\tmp
call :Define R_HOME %ROOT_DIR%\trunk
goto :EOF

REM Define an an environment variable (if it is not already set).
:Define
if not defined %1 set "%1=%2"
goto :EOF

REM Ensure a particular program is available on the PATH.
:EnsureProgram
where /Q %1 || (
    echo '%1' not found on PATH; exiting
    pause
    exit
)
goto :EOF

REM Ensure a particular directory exists
:EnsureDirectory
if not exist %1 (
    mkdir %1
)

if not exist %1 (
    echo Failed to create directory '%1'.
    pause
    exit
)
goto :EOF

REM Delete a directory.
:DeleteDirectory
if exist %1 (
    rmdir /s /q %1
)
goto :EOF

