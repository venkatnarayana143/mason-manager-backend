@echo off
echo ==========================================
echo   Deploying to Railway - proactive-clarity
echo ==========================================
echo.

echo Step 1: Linking to proactive-clarity service...
echo Please select "proactive-clarity" (use DOWN arrow, then press ENTER)
echo.
railway service

echo.
echo Step 2: Deploying code...
railway up --detach

echo.
echo Step 3: Checking status...
railway status

echo.
echo ==========================================
echo Deployment initiated!
echo.
echo Next steps:
echo 1. Go to Railway dashboard
echo 2. Click on "proactive-clarity" service
echo 3. Go to "Deployments" tab
echo 4. Watch the build logs
echo ==========================================
pause
