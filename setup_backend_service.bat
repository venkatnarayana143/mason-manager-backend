@echo off
echo ==========================================
echo   Setting up NEW 'backend' Service
echo ==========================================
echo.
echo Step 1: Link to 'backend' service
echo.
echo I will launch the selection menu.
echo Please use Arrow Keys to select "backend" and press ENTER.
echo.
pause
railway service

echo.
echo Step 2: Setting Environment Variables...
call railway variables set DD_API_KEY=18ccc2a978ad181de5193a50e41aaecc
call railway variables set DD_APP_KEY=057988ba935a6fd1dcac285a44bb1a1ead4c4a8a
call railway variables set DD_SITE=datadoghq.com
call railway variables set DD_SERVICE=mason-manager
call railway variables set DD_ENV=production
call railway variables set DD_VERSION=1.0.0
call railway variables set PORT=8080

echo.
echo Step 3: Deploying...
call railway up --detach

echo.
echo ==========================================
echo DONE!
echo.
echo IMPORTANT FINAL STEP:
echo Go to Railway Dashboard -> Variables
echo and add the DATABASE_URL reference manually!
echo (New Variable -> Add Reference -> Postgres -> DATABASE_URL)
echo ==========================================
pause
