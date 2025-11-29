# 🚀 RAILWAY DEPLOYMENT - SIMPLIFIED GUIDE

## ✅ What You've Done So Far:
- Created Railway project: "abundant-dedication"
- Added Postgres database
- Uploaded code to Railway

## 🎯 NEXT STEPS - Complete the Deployment

### Step 1: Go to Your Project
Visit: https://railway.com/project/85afacb6-3cac-4afd-a204-0c98a7919cf6

You should see a canvas with a **Postgres** box.

### Step 2: Add a New Service/Deployment

**Method 1 - Use Keyboard Shortcut (EASIEST):**
1. Press `Ctrl + K` (Windows) or `Cmd + K` (Mac)
2. Type: `new`
3. Look for an option that says:
   - "New Service"
   - "Create Service"  
   - "Empty Service"
   - "Deploy"
4. Select it and press Enter

**Method 2 - Use the Canvas:**
1. Look for a **"+ Create"** or **"+ New"** button on the canvas
2. Click it
3. Select "Empty Service" or "New Service"

**Method 3 - Right-click:**
1. Right-click on the empty space in the canvas (not on Postgres)
2. Look for "Add Service" or "New Service"

### Step 3: Configure the Service

Once you create the service, you'll see a new box appear. Click on it.

### Step 4: Add Environment Variables

1. Click on the new service box
2. Find and click the **"Variables"** tab
3. Click **"+ New Variable"** or **"Raw Editor"**
4. Add these variables ONE BY ONE or use Raw Editor:

```
DD_API_KEY=18ccc2a978ad181de5193a50e41aaecc
DD_APP_KEY=057988ba935a6fd1dcac285a44bb1a1ead4c4a8a
DD_SITE=datadoghq.com
DD_SERVICE=mason-manager
DD_ENV=production
DD_VERSION=1.0.0
```

### Step 5: Connect to PostgreSQL

1. Still in your new service, go to **"Variables"** tab
2. Look for **"+ New Variable"** → **"Add Reference"**
3. Select **"Postgres"** → **"DATABASE_URL"**
4. This connects your backend to the database

**Alternative:**
- The DATABASE_URL might be automatically available
- Check if it's already listed in the Variables tab

### Step 6: Deploy Your Code

**Option A - If you see "Deploy" button:**
1. Click **"Deploy"** or **"Deployments"** tab
2. Look for your uploaded code
3. Click "Deploy" to start the build

**Option B - If you see "Source":**
1. Go to **"Settings"** tab
2. Look for **"Source"** section
3. Connect to your uploaded code
4. Click "Deploy"

**Option C - Use Railway CLI:**
Run this command in your backend folder:
```bash
railway up --detach
```

### Step 7: Generate Public URL

1. Click on your backend service
2. Go to **"Settings"** tab
3. Scroll to **"Networking"** or **"Public Networking"**
4. Click **"Generate Domain"**
5. Railway will give you a URL like:
   `https://mason-manager-production.up.railway.app`
6. **SAVE THIS URL!**

### Step 8: Configure Health Check (IMPORTANT!)

Since you're looking at healthchecks documentation:

1. In your service, go to **"Settings"** tab
2. Look for **"Health Check"** or **"Healthcheck Path"**
3. Set it to: `/actuator/health`
4. Set timeout to: `100` seconds (for initial startup)
5. Save

This is already configured in your `railway.json` file, but verify it's set!

### Step 9: Wait for Deployment

1. Go to **"Deployments"** tab
2. Watch the build logs
3. Wait 3-5 minutes for:
   - Build to complete
   - Application to start
   - Health check to pass

### Step 10: Test Your Deployment

Once deployment shows **"Active"** or **"Healthy"**:

**Test Health:**
```
https://your-domain.up.railway.app/actuator/health
```
Should return: `{"status":"UP"}`

**Test API:**
```
https://your-domain.up.railway.app/api/employees
https://your-domain.up.railway.app/api/attendance
https://your-domain.up.railway.app/api/payments
```

**Check Datadog:**
1. Go to: https://app.datadoghq.com
2. Navigate to **APM** → **Services**
3. Look for **"mason-manager"**
4. You should see metrics appearing!

---

## 🆘 TROUBLESHOOTING

### "Can't find where to create new service"
- Press `Ctrl + K` and type "new"
- Or look for a "+" button anywhere on the page
- Or try the Railway CLI: `railway up --detach`

### "Build fails"
- Check build logs in Deployments tab
- Ensure all 6 environment variables are set
- Verify DATABASE_URL exists

### "Application won't start"
- Check deploy logs
- Verify health check path is `/actuator/health`
- Increase health check timeout to 100 seconds
- Check if port is set to 8080 (should be automatic)

### "Can't access the URL"
- Make sure you generated a public domain
- Wait for deployment to show "Active"
- Try health endpoint first before API endpoints

---

## ✅ FINAL CHECKLIST

- [ ] New service created (not Postgres)
- [ ] 6 Datadog environment variables added
- [ ] DATABASE_URL connected from Postgres
- [ ] Code deployed
- [ ] Public domain generated
- [ ] Health check configured: `/actuator/health`
- [ ] Deployment shows "Active" or "Healthy"
- [ ] Health endpoint returns {"status":"UP"}
- [ ] API endpoints work
- [ ] Datadog showing metrics

---

## 📱 SUCCESS!

Once complete, your backend will be live at:
**https://[your-domain].up.railway.app**

Accessible from anywhere - including your father's mobile phone!

---

**Stuck? Tell me:**
1. What step number you're on
2. What you see on the screen
3. What buttons/options are available

I'll guide you through it!
