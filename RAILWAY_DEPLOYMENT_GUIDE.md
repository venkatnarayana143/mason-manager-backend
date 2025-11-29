# 🚀 Railway Deployment Guide with Datadog Monitoring

## Current Status
✅ Railway CLI installed and authenticated
✅ Project created: `abundant-dedication`
✅ PostgreSQL database added
✅ Code uploaded to Railway

## Next Steps: Complete Deployment via Railway Dashboard

### Step 1: Access Your Railway Project
1. The Railway dashboard should already be open in your browser
2. If not, run: `railway open` or visit: https://railway.com/project/87919cf6

### Step 2: Create Backend Service
1. In the Railway dashboard, click **"+ New"** button
2. Select **"Empty Service"**
3. Name it: `backend` or `mason-manager-backend`

### Step 3: Link Your Uploaded Code to the Backend Service
1. Click on the newly created **backend** service
2. Go to **Settings** tab
3. Under **Source**, you should see your uploaded code
4. If not, click **"Deploy"** and select the uploaded source

### Step 4: Configure Environment Variables
Click on the **backend** service, then go to **Variables** tab and add these:

#### Required Variables:

```
DD_API_KEY=18ccc2a978ad181de5193a50e41aaecc
DD_APP_KEY=057988ba935a6fd1dcac285a44bb1a1ead4c4a8a
DD_SITE=datadoghq.com
DD_SERVICE=mason-manager
DD_ENV=production
DD_VERSION=1.0.0
```

#### Database Connection:
Railway automatically provides `DATABASE_URL` when you add PostgreSQL.
**Verify it exists** in the Variables tab. It should look like:
```
DATABASE_URL=postgresql://postgres:...@...railway.app:5432/railway
```

#### Optional (for later):
```
FRONTEND_URL=http://localhost:5173
```
(Update this after deploying your frontend)

### Step 5: Configure Build Settings
1. In the backend service, go to **Settings** tab
2. Scroll to **Build** section
3. Ensure **Builder** is set to: `NIXPACKS` (should be automatic)
4. **Start Command** should be:
   ```
   java -javaagent:dd-java-agent.jar -Dspring.profiles.active=prod -jar target/manager-0.0.1-SNAPSHOT.jar
   ```
   (This is already configured in `railway.json`)

### Step 6: Enable Public Access
1. In the backend service, go to **Settings** tab
2. Scroll to **Networking** section
3. Click **"Generate Domain"**
4. Railway will provide a public URL like: `https://your-app.up.railway.app`
5. **Save this URL** - you'll need it for your frontend!

### Step 7: Deploy!
1. Click **"Deploy"** button (or it may auto-deploy)
2. Watch the **Deployments** tab for build progress
3. Wait for the build to complete (usually 2-5 minutes)

### Step 8: Verify Deployment
Once deployed, check:

#### Health Check:
Visit: `https://your-app.up.railway.app/actuator/health`
Should return: `{"status":"UP"}`

#### API Endpoints:
- `https://your-app.up.railway.app/api/employees`
- `https://your-app.up.railway.app/api/attendance`
- `https://your-app.up.railway.app/api/payments`

### Step 9: Verify Datadog Monitoring
1. Go to https://app.datadoghq.com
2. Navigate to **APM** → **Services**
3. You should see `mason-manager` service appearing
4. Check **Metrics** → **Explorer** for application metrics

### Step 10: Update Frontend Configuration
Once you have the Railway URL, update your frontend to use it:
1. In your frontend project, update the API base URL
2. Replace `http://localhost:8080` with your Railway URL
3. Example: `https://your-app.up.railway.app`

---

## 🔧 Troubleshooting

### Build Fails
- Check **Logs** tab in Railway dashboard
- Ensure all environment variables are set correctly
- Verify PostgreSQL is running

### Application Won't Start
- Check if `DATABASE_URL` is set
- Verify Datadog API key is correct
- Check application logs for errors

### Can't Access Endpoints
- Ensure domain is generated in Networking settings
- Check if deployment is in "Active" state
- Verify health check endpoint works first

---

## 📊 Monitoring with Datadog

### What You'll See in Datadog:

1. **APM (Application Performance Monitoring)**
   - Request traces
   - Service map
   - Performance metrics

2. **Metrics**
   - JVM metrics (memory, CPU, threads)
   - HTTP request metrics
   - Database query performance
   - Custom business metrics

3. **Logs** (if configured)
   - Application logs
   - Error tracking

### Accessing Datadog:
- URL: https://app.datadoghq.com
- Service Name: `mason-manager`
- Environment: `production`

---

## 🎯 Quick Commands Reference

```bash
# Open Railway dashboard
railway open

# Check deployment status
railway status

# View logs
railway logs

# Link to different service
railway service

# Redeploy
railway up --detach
```

---

## ✅ Success Checklist

- [ ] Backend service created in Railway
- [ ] All environment variables configured
- [ ] PostgreSQL database connected
- [ ] Public domain generated
- [ ] Application deployed successfully
- [ ] Health check endpoint responding
- [ ] API endpoints accessible
- [ ] Datadog receiving metrics
- [ ] Frontend URL saved for later

---

## 📱 Next Steps

After successful deployment:

1. **Test all API endpoints** with the public URL
2. **Check Datadog dashboard** for incoming metrics
3. **Deploy your frontend** (if you have one)
4. **Update CORS settings** with frontend URL
5. **Share the URL** with your father for mobile access!

---

## 🆘 Need Help?

If you encounter issues:
1. Check Railway logs: `railway logs`
2. Check Datadog for errors
3. Verify all environment variables
4. Ensure PostgreSQL is running
5. Check the Railway community: https://help.railway.app

---

**Your Datadog Credentials:**
- API Key: `18ccc2a978ad181de5193a50e41aaecc`
- App Key: `057988ba935a6fd1dcac285a44bb1a1ead4c4a8a`
- Site: `datadoghq.com`

**Your Railway Project:**
- Project: `abundant-dedication`
- Dashboard: https://railway.com/project/87919cf6
