# Griddle Deployment Guide

This guide covers multiple deployment options for your Griddle multiplayer word game.

## Table of Contents
1. [Render (Recommended)](#option-1-render-recommended)
2. [Railway](#option-2-railway)
3. [Vercel + Render](#option-3-vercel-frontend--render-backend)
4. [Heroku](#option-4-heroku)
5. [Pre-deployment Checklist](#pre-deployment-checklist)

---

## Pre-deployment Checklist

### 1. Set up MongoDB (Optional but Recommended)
Currently, your app uses in-memory storage. For production:

**Option A: MongoDB Atlas (Free)**
- Go to [MongoDB Atlas](https://www.mongodb.com/cloud/atlas)
- Create free cluster
- Get connection string: `mongodb+srv://<user>:<password>@cluster.mongodb.net/griddle`

**Option B: Continue with in-memory** (data lost on restart)

### 2. Environment Variables Needed

**Backend (.env):**
```env
PORT=5000
MONGODB_URI=mongodb+srv://your-connection-string
NODE_ENV=production
CLIENT_URL=https://your-frontend-url.com
```

**Frontend (.env):**
```env
REACT_APP_SOCKET_URL=https://your-backend-url.com
```

---

## Option 1: Render (Recommended)

**Pros:** Free tier, automatic deployments, WebSocket support, easy setup
**Cost:** Free for both frontend and backend

### Backend Deployment

1. **Create render.yaml** (already included in project)

2. **Push to GitHub:**
   ```bash
   cd /Users/aishwaryamv/Desktop/Explore/griddle
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin https://github.com/yourusername/griddle.git
   git push -u origin main
   ```

3. **Deploy on Render:**
   - Go to [Render Dashboard](https://dashboard.render.com/)
   - Click "New +" → "Web Service"
   - Connect your GitHub repo
   - Configure:
     - **Name:** griddle-backend
     - **Root Directory:** `server`
     - **Build Command:** `npm install`
     - **Start Command:** `npm start`
     - **Environment Variables:** Add MONGODB_URI, CLIENT_URL
   - Click "Create Web Service"

4. **Note your backend URL:** `https://griddle-backend.onrender.com`

### Frontend Deployment

1. **Deploy on Render:**
   - Click "New +" → "Static Site"
   - Select same GitHub repo
   - Configure:
     - **Name:** griddle-client
     - **Root Directory:** `client`
     - **Build Command:** `npm install && npm run build`
     - **Publish Directory:** `build`
     - **Environment Variables:** 
       - `REACT_APP_SOCKET_URL` = `https://griddle-backend.onrender.com`
   - Click "Create Static Site"

2. **Update backend CORS:**
   - Go to backend service on Render
   - Add environment variable:
     - `CLIENT_URL` = `https://griddle-client.onrender.com`
   - Redeploy backend

---

## Option 2: Railway

**Pros:** Generous free tier, automatic deployments, simple setup
**Cost:** Free $5/month credit

### Steps:

1. **Push to GitHub** (same as above)

2. **Deploy Backend:**
   - Go to [Railway](https://railway.app/)
   - "New Project" → "Deploy from GitHub repo"
   - Select your repo
   - Add service → Select `server` directory
   - Add environment variables
   - Deploy

3. **Deploy Frontend:**
   - Add another service → Select `client` directory
   - Add `REACT_APP_SOCKET_URL` variable
   - Deploy

---

## Option 3: Vercel (Frontend) + Render (Backend)

**Pros:** Best performance for React apps
**Cost:** Free

### Backend on Render:
(Follow Render backend steps above)

### Frontend on Vercel:

1. **Install Vercel CLI:**
   ```bash
   npm install -g vercel
   ```

2. **Deploy:**
   ```bash
   cd client
   vercel
   ```

3. **Set environment variable:**
   ```bash
   vercel env add REACT_APP_SOCKET_URL
   # Enter: https://your-backend-url.onrender.com
   ```

4. **Redeploy:**
   ```bash
   vercel --prod
   ```

---

## Option 4: Heroku

**Pros:** Traditional, well-documented
**Cost:** Free tier discontinued, paid plans from $5/month

### Combined Deployment:

1. **Create Procfile:**
   ```
   web: cd server && npm start
   ```

2. **Create package.json in root:**
   ```json
   {
     "name": "griddle",
     "scripts": {
       "heroku-postbuild": "cd client && npm install && npm run build"
     }
   }
   ```

3. **Configure server to serve React:**
   - Server needs to serve client/build folder in production

4. **Deploy:**
   ```bash
   heroku create griddle-app
   heroku config:set MONGODB_URI=your-connection-string
   git push heroku main
   ```

---

## Post-Deployment Checklist

### 1. Test Core Features:
- ✅ Room creation
- ✅ QR code generation
- ✅ Player joining
- ✅ Real-time word validation
- ✅ Timer synchronization
- ✅ Leaderboard updates
- ✅ Game completion
- ✅ Rematch functionality

### 2. Monitor Logs:
- **Render:** Dashboard → Service → Logs
- **Railway:** Project → Service → Logs
- **Vercel:** Project → Deployments → View Logs

### 3. Set up Custom Domain (Optional):
- Purchase domain from Namecheap, Google Domains, etc.
- Add to hosting platform's custom domain settings

---

## Troubleshooting

### WebSocket Connection Issues:
- Ensure backend URL uses `https://` not `http://`
- Check CORS is configured with frontend URL
- Verify WebSocket transport is enabled

### Build Failures:
- Check Node version compatibility (recommend 18.x)
- Verify all dependencies in package.json
- Check build logs for specific errors

### In-Memory Storage Limitations:
- Data lost on backend restart
- Room codes will reset
- Use MongoDB for persistence

---

## Quick Start (Render - Fastest Option)

1. **Push to GitHub:**
   ```bash
   git init
   git add .
   git commit -m "Deploy Griddle"
   gh repo create griddle --public --source=. --push
   ```

2. **Deploy Backend:**
   - Render Dashboard → New Web Service
   - Connect repo, root: `server`
   - Build: `npm install`, Start: `npm start`
   - Add env vars

3. **Deploy Frontend:**
   - Render Dashboard → New Static Site
   - Connect repo, root: `client`
   - Build: `npm install && npm run build`
   - Publish: `build`
   - Add `REACT_APP_SOCKET_URL`

4. **Test:** Visit your frontend URL and play!

---

## Need Help?

- Render Docs: https://render.com/docs
- Railway Docs: https://docs.railway.app
- Vercel Docs: https://vercel.com/docs

Good luck with your deployment! 🎮
