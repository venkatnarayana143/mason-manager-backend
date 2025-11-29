@echo off
setlocal

echo ==========================================
echo      Starting Mason Manager Backend
echo ==========================================
echo.

REM Get the directory where this script is located
set "SCRIPT_DIR=%~dp0"
cd /d "%SCRIPT_DIR%"

REM Set up Java and Maven paths
set "JAVA_HOME=%SCRIPT_DIR%..\tools\jdk-17.0.2"
set "MAVEN_HOME=%SCRIPT_DIR%..\tools\apache-maven-3.9.6"
set "PATH=%JAVA_HOME%\bin;%MAVEN_HOME%\bin;%PATH%"

echo Using Java: %JAVA_HOME%
echo Using Maven: %MAVEN_HOME%
echo.

REM Clean and compile first to download dependencies
echo [1/2] Downloading dependencies and compiling...
call "%MAVEN_HOME%\bin\mvn.cmd" clean compile
if errorlevel 1 (
    echo.
    echo ERROR: Failed to compile the project
    echo Check the error messages above
    pause
    exit /b 1
)

echo.
echo [2/2] Starting Spring Boot application...
echo.

REM Run the application
call "%MAVEN_HOME%\bin\mvn.cmd" spring-boot:run

pause
endlocal
