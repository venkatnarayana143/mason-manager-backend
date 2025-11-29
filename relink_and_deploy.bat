@echo off
echo ==========================================
echo   RELINKING RAILWAY PROJECT
echo ==========================================
echo.
echo Step 1: Link Project
echo Please select "abundant-dedication" from the list.
echo (Use Arrow Keys + Enter)
echo.
railway link

echo.
echo ==========================================
echo Step 2: Link Service
echo Please select "proactive-clarity" from the list.
echo (Use Arrow Keys + Enter)
echo.
railway service

echo.
echo ==========================================
echo Step 3: Deploying Code
echo.
railway up --detach

echo.
echo ==========================================
echo DONE! Check Railway Dashboard.
echo ==========================================
pause
