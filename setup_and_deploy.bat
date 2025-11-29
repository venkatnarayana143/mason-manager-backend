@echo off
echo ==========================================
echo   Setting up Railway Environment Variables
echo ==========================================
echo.

echo Linking to proactive-clarity service...
echo Please press DOWN ARROW once, then press ENTER
pause

railway service

echo.
echo Setting environment variables...
echo.

railway variables set DD_API_KEY=18ccc2a978ad181de5193a50e41aaecc
railway variables set DD_APP_KEY=057988ba935a6fd1dcac285a44bb1a1ead4c4a8a
railway variables set DD_SITE=datadoghq.com
railway variables set DD_SERVICE=mason-manager
railway variables set DD_ENV=production
railway variables set DD_VERSION=1.0.0

echo.
echo Environment variables set!
echo.
echo Now deploying...
railway up --detach

echo.
echo ==========================================
echo Setup complete!
echo Check Railway dashboard for deployment status
echo ==========================================
pause
