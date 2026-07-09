@echo off
REM ============================================================
REM  mvn-mule.bat  -  Maven 3.8.6 wrapper for Mule Apps projects
REM  Uses dedicated local repo: C:\Users\avatansh.sharma\.m2-mule-apps\repository
REM  Usage: mvn-mule.bat [maven-goals-and-flags...]
REM  Example: mvn-mule.bat -f apps-commons\pom.xml install
REM ============================================================
set "SCRIPT_DIR=%~dp0"
set "MULE_MVN=C:\Maven\apache-maven-3.8.6\bin\mvn.cmd"
set "MULE_SETTINGS=%SCRIPT_DIR%mule-settings.xml"

if not exist "%MULE_MVN%" (
    echo [ERROR] Maven 3.8.6 not found at: %MULE_MVN%
    echo         Please install Maven 3.8.6 to C:\Maven\apache-maven-3.8.6
    exit /b 1
)

if not exist "%MULE_SETTINGS%" (
    echo [ERROR] mule-settings.xml not found at: %MULE_SETTINGS%
    exit /b 1
)

"%MULE_MVN%" -s "%MULE_SETTINGS%" %*