@echo off
echo Setting environment variables for proactive-clarity...

call railway variables set DD_API_KEY=18ccc2a978ad181de5193a50e41aaecc
call railway variables set DD_APP_KEY=057988ba935a6fd1dcac285a44bb1a1ead4c4a8a
call railway variables set DD_SITE=datadoghq.com
call railway variables set DD_SERVICE=mason-manager
call railway variables set DD_ENV=production
call railway variables set DD_VERSION=1.0.0

echo.
echo Variables set. Now deploying...
call railway up --detach

echo.
echo Deployment triggered!
