# 🚨 FIX: Health Check Failing - Complete Setup Guide

## ✅ CURRENT SITUATION:
- Project: "abundant-dedication" ✅
- Postgres service: Working ✅
- Backend service: "proactive-clarity" ✅ (but not configured)
- **PROBLEM**: No deployments, not linked to code, missing config

---

## 🛠️ STEP-BY-STEP FIX

### Step 1: Open Your Backend Service
1. Go to: https://railway.com/project/85afacb6-3cac-4afd-a204-0c98a7919cf6
2. Click on the **"proactive-clarity"** box/card (NOT Postgres)

### Step 2: Add Environment Variables
1. Click the **"Variables"** tab
2. Click **"+ New Variable"** or **"Raw Editor"**
3. Add these 6 variables:

```
DD_API_KEY=18ccc2a978ad181de5193a50e41aaecc
DD_APP_KEY=057988ba935a6fd1dcac285a44bb1a1ead4c4a8a
DD_SITE=datadoghq.com
DD_SERVICE=mason-manager
DD_ENV=production
DD_VERSION=1.0.0
```

4. **IMPORTANT**: Also add DATABASE_URL reference:
   - Click **"+ New Variable"**
   - Select **"Add Reference"** or **"Reference"**
   - Choose **"Postgres"** → **"DATABASE_URL"**
   - This connects your backend to the database

### Step 3: Configure Source/Deployment
1. Still in "proactive-clarity" service
2. Go to **"Settings"** tab
3. Look for **"Source"** or **"Deploy"** section

**You have 3 options:**

**Option A - Link Uploaded Code:**
- If you see your uploaded code listed, click "Connect" or "Link"
- Then click "Deploy"

**Option B - Deploy from Local (Recommended):**
- Open a new terminal/command prompt
- Navigate to your backend folder
- Run these commands:

```bash
cd c:\Users\pokal\.gemini\antigravity\scratch\mason_manager\backend

# First, switch to proactive-clarity service
railway service
# Use arrow keys to select "proactive-clarity", press Enter

# Then deploy
railway up --detach
```

**Option C - Connect GitHub:**
- If you have your code on GitHub:
  - Click "Connect to GitHub"
  - Select your repository
  - Select the branch (usually "main" or "master")
  - Click "Deploy"

### Step 4: Configure Health Check
1. In "proactive-clarity" service, go to **"Settings"** tab
2. Scroll to **"Health Check"** or **"Healthcheck"** section
3. Set these values:
   - **Path**: `/actuator/health`
   - **Timeout**: `100` (seconds)
   - **Interval**: `30` (seconds, optional)
4. Click **"Save"** or it auto-saves

### Step 5: Generate Public Domain
1. Still in **"Settings"** tab
2. Scroll to **"Networking"** or **"Public Networking"**
3. Click **"Generate Domain"**
4. You'll get a URL like: `https://proactive-clarity-production.up.railway.app`
5. **SAVE THIS URL!**

### Step 6: Trigger Deployment
1. Go to **"Deployments"** tab
2. If no deployment started automatically, click **"Deploy"** or **"New Deployment"**
3. Wait for the build to start

### Step 7: Monitor the Build
1. In **"Deployments"** tab, click on the active deployment
2. Watch the **"Build Logs"** tab
3. You should see:
   - Maven downloading dependencies
   - Compiling Java code
   - Building JAR file
   - Downloading Datadog agent
   - Starting Spring Boot

**Build takes 3-5 minutes**

### Step 8: Monitor the Deploy
1. After build completes, switch to **"Deploy Logs"** tab
2. Watch for:
   - Spring Boot banner
   - "Started MasonManagerApplication in X seconds"
   - "Tomcat started on port(s): 8080"
   - Health check passing

### Step 9: Verify Health Check
Once deployment shows **"Active"** or **"Healthy"**:

1. Open your generated domain + `/actuator/health`:
   ```
   https://your-domain.up.railway.app/actuator/health
   ```

2. Should return:
   ```json
   {"status":"UP"}
   ```

---

## 🔍 TROUBLESHOOTING HEALTH CHECK FAILURES

### Issue 1: "Application not starting"

**Check Deploy Logs for:**
- Database connection errors
- Missing environment variables
- Port binding issues

**Fix:**
- Verify all 6 Datadog variables are set
- Verify DATABASE_URL reference exists
- Check if PORT variable is set (Railway auto-sets this)

### Issue 2: "Health check timeout"

**Symptoms:**
- Build succeeds
- App starts
- But health check fails

**Fix:**
1. Increase health check timeout to **100 seconds**
2. Verify health check path is `/actuator/health` (not `/health`)
3. Check if app is listening on correct port (should be 8080)

### Issue 3: "Build fails"

**Common errors:**
- Maven dependency download fails
- Compilation errors
- Out of memory

**Fix:**
- Check build logs for specific error
- Ensure `pom.xml` is correct
- Verify Java version is 17

### Issue 4: "Database connection fails"

**Error in logs:**
```
Could not open JPA EntityManager for transaction
```

**Fix:**
- Verify DATABASE_URL is set in Variables tab
- It should start with: `postgresql://`
- Make sure you added it as a **Reference** to Postgres service

---

## ✅ SUCCESS CHECKLIST

After completing all steps, verify:

- [ ] "proactive-clarity" service has 6 Datadog variables
- [ ] DATABASE_URL reference is added
- [ ] Source/code is linked
- [ ] Health check path is `/actuator/health`
- [ ] Health check timeout is 100 seconds
- [ ] Public domain is generated
- [ ] Deployment shows "Active" or "Healthy"
- [ ] Health endpoint returns {"status":"UP"}
- [ ] Deploy logs show "Started MasonManagerApplication"

---

## 📊 EXPECTED DEPLOY LOGS

When successful, you should see logs like this:

```
  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/
 :: Spring Boot ::                (v3.x.x)

2025-11-29 07:50:00.000  INFO --- [main] c.m.m.MasonManagerApplication
: Starting MasonManagerApplication...
2025-11-29 07:50:05.000  INFO --- [main] o.s.b.w.embedded.tomcat.TomcatWebServer
: Tomcat started on port(s): 8080 (http)
2025-11-29 07:50:05.500  INFO --- [main] c.m.m.MasonManagerApplication
: Started MasonManagerApplication in 5.234 seconds
```

---

## 🎯 QUICK FIX COMMANDS (If using CLI)

If you want to use the Railway CLI instead:

```bash
# Navigate to backend folder
cd c:\Users\pokal\.gemini\antigravity\scratch\mason_manager\backend

# Link to proactive-clarity service (use arrow keys to select it)
railway service

# Set environment variables
# (Do this in Railway web dashboard - easier than CLI)

# Deploy
railway up --detach

# Check logs
railway logs

# Check status
railway status
```

---

## 📱 FINAL TEST

Once health check passes, test all endpoints:

```
# Health
https://your-domain.up.railway.app/actuator/health

# Employees API
https://your-domain.up.railway.app/api/employees

# Attendance API
https://your-domain.up.railway.app/api/attendance

# Payments API
https://your-domain.up.railway.app/api/payments

# H2 Console (if needed)
https://your-domain.up.railway.app/h2-console
```

---

## 🎉 SUCCESS!

Once all checks pass:
1. Your backend is live and accessible worldwide
2. Datadog is receiving metrics
3. Your father can access it from his mobile
4. You can update your frontend to use the Railway URL

---

**Need help? Tell me:**
1. Which step you're on
2. What error you're seeing in the logs
3. Screenshot of the issue

I'll help you debug it! 🚀
