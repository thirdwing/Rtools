REM Install R from source.
echo "Sorry, not yet working."
exit

call tools.cmd :Configure

call tools.cmd :EnsureProgram %SVN%

REM Create and move to the 'root' directory.
if not exist "%ROOT_DIR%" (
	mkdir "%ROOT_DIR%"
)
cd "%ROOT_DIR%"
SET "OLDPATH=%PATH%"

REM Download the R sources. Get the latest R-devel sources using SVN.
pause
"%SVN%" checkout https://svn.r-project.org/R/trunk/
cd trunk
pause

REM Copy in the 'extras' for a 64bit build. This includes tcltk
REM plus some other libraries. Note that the R64 directory should
REM have been populated by the RTools installation.
REM xcopy /E /Y C:\R %R_HOME%\trunk\
rmdir /S /Q %R_HOME%\Tcl
xcopy /E /Y C:\R64 %R_HOME%\
pause

REM Ensure the temporary directory exists.
if not exist "%TMPDIR%" (
	mkdir "%TMPDIR%"
)
pause

REM Create the binary directories that will eventually
REM be populated ourselves, rather than letting the
REM bundled cygwin toolkit do it. The RTools 'mkdir'
REM apparently can build directories without read
REM permissions, which will cause any attempt to link
REM to DLLs within those folders to fail.
rmdir /S /Q bin
mkdir bin\i386
mkdir bin\x64
pause

REM Move into the root directory for 'Windows' builds.
cd src\gnuwin32
pause

REM Make it!
REM For this part, we ensure only Rtools is on the PATH. This
REM is important as if the wrong command line utilites are picked
REM up things can fail for strange reason. In particular, we
REM _must_ use the Rtools 'sort', _not_ the Windows 'sort', or
REM else we will get strange errors from 'comm' when attempting
REM to compare sorted files. Probably just placing Rtools first
REM on the PATH is sufficient, but this is fine too.
SET "PATH=C:\Rtools\bin;C:\Rtools\gcc492_64\bin"
make distclean


REM Since we're building from source, we need to get Recommended packages.
make rsync-recommended

pause

REM Download external software -- libpng, libgsl, and so on.
make rsync-extsoft

pause

REM Look at MkRules.dist and if settings need to be altered, copy it to
REM MkRules.local and edit the settings there.
if exist MkRules.local (
	rm MkRules.local
)
cp MkRules.dist MkRules.local

REM Don't use MIKTEX.
sed -i 's/^MIKTEX = TRUE//g' MkRules.local

REM Ensure that the make rules are properly set -- need to
REM point to 'extsoft'.
sed -i 's/^# LOCAL_SOFT/LOCAL_SOFT/g' MkRules.local
sed -i 's/^# EXT_LIBS/EXT_LIBS/g' MkRules.local
echo BINPREF = C:/Rtools/gcc492_32/bin/>> MkRules.local
echo BINPREF64 = C:/Rtools/gcc492_64/bin/>> MkRules.local
echo WIN = 64>> MkRules.local
echo MULTI =>> MkRules.local

pause


REM Now we should be able to build R + recommended packages.
make WIN=64 all recommended

REM Clean up.
SET "PATH=%OLDPATH%"
cd %OLDDIR%

pause

