@echo off
REM ============================================================
REM  install-all.bat
REM  Bootstrap script: installs BOM, parent-pom, and apps-commons
REM  into the dedicated Mule Apps local repository in the correct
REM  dependency order before building/testing the API apps.
REM
REM  Run this ONCE (or after pom.xml changes) before building
REM  customer-accounts-papi, customer-sfdc-sapi, customer-web-eapi.
REM
REM  NOTE: Maven 3.8.6 at C:\Maven\apache-maven-3.8.6 is being used.
REM        Local repo: C:\Users\avatansh.sharma\.m2-mule-apps\repository
REM        Java runtime: Eclipse Adoptium JDK 17 (via VS Code extension)
REM
REM  Usage: install-all.bat
REM ============================================================

set "SCRIPT_DIR=%~dp0"
set "MULE_MVN=C:\Maven\apache-maven-3.8.6\bin\mvn.cmd"
set "MULE_SETTINGS=%SCRIPT_DIR%mule-settings.xml"
set "SKIP_TESTS=-Dmaven.test.skip=true"
set "QUIET=--no-transfer-progress"

echo.
echo ============================================================
echo  Mule Apps - Bootstrap Installer
echo  Maven   : %MULE_MVN%
echo  Settings: %MULE_SETTINGS%
echo  Repo    : C:\Users\avatansh.sharma\.m2-mule-apps\repository
echo ============================================================
echo.

if not exist "%MULE_MVN%" (
    echo [ERROR] Maven 3.8.6 not found at: %MULE_MVN%
    exit /b 1
)

REM --------------------------------------------------------
REM STEP 1 - Install BOM
REM   The BOM is the top-level parent; it must be in the
REM   local repo before any other module can resolve its parent.
REM --------------------------------------------------------
echo [1/3] Installing BOM (solutions-bom) ...
"%MULE_MVN%" -s "%MULE_SETTINGS%" -f "%SCRIPT_DIR%bom\pom.xml" install %SKIP_TESTS% %QUIET%
if %ERRORLEVEL% neq 0 (
    echo [ERROR] BOM install FAILED ^(exit code %ERRORLEVEL%^)
    exit /b %ERRORLEVEL%
)
echo [1/3] BOM installed OK
echo.

REM --------------------------------------------------------
REM STEP 2 - Install Parent POM
REM --------------------------------------------------------
echo [2/3] Installing Parent POM (solutions-parent-pom) ...
"%MULE_MVN%" -s "%MULE_SETTINGS%" -f "%SCRIPT_DIR%parent-pom\pom.xml" install %SKIP_TESTS% %QUIET%
if %ERRORLEVEL% neq 0 (
    echo [ERROR] Parent POM install FAILED ^(exit code %ERRORLEVEL%^)
    exit /b %ERRORLEVEL%
)
echo [2/3] Parent POM installed OK
echo.

REM --------------------------------------------------------
REM STEP 3 - Build and install apps-commons
REM   All API apps depend on this as a mule-plugin.
REM   First-time run downloads ~150MB of Mule runtime artifacts.
REM   This step can take 5-15 minutes on first run.
REM --------------------------------------------------------
echo [3/3] Building and installing apps-commons ...
echo        ^(First-time run may take 5-15 min while downloading Mule artifacts^)
"%MULE_MVN%" -s "%MULE_SETTINGS%" -f "%SCRIPT_DIR%apps-commons\pom.xml" install %SKIP_TESTS% %QUIET%
if %ERRORLEVEL% neq 0 (
    echo [ERROR] apps-commons install FAILED ^(exit code %ERRORLEVEL%^)
    exit /b %ERRORLEVEL%
)
echo [3/3] apps-commons installed OK
echo.

echo ============================================================
echo  Bootstrap complete! You can now build or run MUnit tests:
echo.
echo  Build only (skip tests):
echo    mvn-mule.bat -f customer-accounts-papi\pom.xml package -Dmaven.test.skip=true
echo    mvn-mule.bat -f customer-sfdc-sapi\pom.xml package -Dmaven.test.skip=true
echo    mvn-mule.bat -f customer-web-eapi\pom.xml package -Dmaven.test.skip=true
echo.
echo  Run MUnit tests:
echo    mvn-mule.bat -f customer-accounts-papi\pom.xml test
echo    mvn-mule.bat -f customer-sfdc-sapi\pom.xml test
echo    mvn-mule.bat -f customer-web-eapi\pom.xml test
echo.
echo  Resolve dependencies only (verify connectivity):
echo    mvn-mule.bat -f customer-web-eapi\pom.xml dependency:resolve -Dmaven.test.skip=true
echo ============================================================
echo.