# 🚀 Griddle Deployment Checklist

Use this checklist to ensure a smooth deployment.

## ✅ Pre-Deployment Tasks

### 1. Code Preparation
- [ ] All features tested locally
- [ ] No console errors in browser
- [ ] Backend runs without errors
- [ ] Environment variables documented

### 2. Database Setup (Optional but Recommended)
- [ ] Create MongoDB Atlas account at https://www.mongodb.com/cloud/atlas
- [ ] Create free cluster
- [ ] Create database user
- [ ] Get connection string (format: `mongodb+srv://...`)
- [ ] Test connection locally by updating `.env`

### 3. Git Repository
- [ ] Initialize Git: `git init`
- [ ] Create `.gitignore` (ensure `.env` files are ignored)
- [ ] Initial commit: `git add . && git commit -m "Initial commit"`
- [ ] Create GitHub repository
- [ ] Push code: `git remote add origin <url> && git push -u origin main`

---

## 🌐 Deployment Steps (Render - Recommended)

### Backend Deployment
- [ ] Go to https://dashboard.render.com/
- [ ] Click "New +" → "Web Service"
- [ ] Connect GitHub repository
- [ ] Configure:
  - [ ] **Name**: griddle-backend (or your choice)
  - [ ] **Root Directory**: `server`
  - [ ] **Environment**: Node
  - [ ] **Build Command**: `npm install`
  - [ ] **Start Command**: `npm start`
- [ ] Add Environment Variables:
  - [ ] `NODE_ENV` = `production`
  - [ ] `PORT` = `5000`
  - [ ] `MONGODB_URI` = `<your-mongodb-connection-string>` (optional)
  - [ ] `CLIENT_URL` = `https://your-frontend-url.onrender.com` (add after frontend deployed)
- [ ] Click "Create Web Service"
- [ ] Wait for deployment (3-5 minutes)
- [ ] **Copy backend URL**: `https://griddle-backend.onrender.com`

### Frontend Deployment
- [ ] On Render Dashboard, click "New +" → "Static Site"
- [ ] Connect same GitHub repository
- [ ] Configure:
  - [ ] **Name**: griddle-frontend (or your choice)
  - [ ] **Root Directory**: `client`
  - [ ] **Build Command**: `npm install && npm run build`
  - [ ] **Publish Directory**: `build`
- [ ] Add Environment Variable:
  - [ ] `REACT_APP_SOCKET_URL` = `<your-backend-url>` (from above)
- [ ] Click "Create Static Site"
- [ ] Wait for deployment (3-5 minutes)
- [ ] **Copy frontend URL**: `https://griddle-frontend.onrender.com`

### Update Backend CORS
- [ ] Go back to your backend service on Render
- [ ] Go to "Environment" tab
- [ ] Update `CLIENT_URL` variable with your frontend URL
- [ ] Click "Save Changes"
- [ ] Service will automatically redeploy

---

## 🧪 Post-Deployment Testing

### Basic Tests
- [ ] Frontend loads without errors
- [ ] Can navigate to all pages
- [ ] No console errors in browser

### Single Player Tests
- [ ] Can start single player game
- [ ] Board generates correctly
- [ ] Can submit words
- [ ] Timer works
- [ ] Score updates

### Multiplayer Tests
- [ ] Can create room
- [ ] Room PIN displays
- [ ] QR code generates
- [ ] Can join room with PIN
- [ ] Players appear in lobby
- [ ] Host can start game
- [ ] All players receive same board
- [ ] Word submission works
- [ ] Leaderboard updates in real-time
- [ ] Timer syncs across players
- [ ] Game ends for all players
- [ ] Results page shows correctly
- [ ] Rematch works

### Mobile Tests
- [ ] Touch/swipe works for word selection
- [ ] Layout is responsive
- [ ] QR code scannable
- [ ] All features work on mobile

---

## 🔧 Troubleshooting

### Backend Not Starting
- [ ] Check Render logs for errors
- [ ] Verify all environment variables are set
- [ ] Ensure `npm start` script exists in server/package.json

### Frontend Build Errors
- [ ] Check build logs on Render
- [ ] Verify `REACT_APP_SOCKET_URL` is set correctly
- [ ] Test build locally: `cd client && npm run build`

### WebSocket Connection Errors
- [ ] Ensure backend URL uses `https://` (not `http://`)
- [ ] Verify `CLIENT_URL` matches frontend URL exactly
- [ ] Check browser console for CORS errors
- [ ] Test WebSocket endpoint: `wss://your-backend.onrender.com`

### MongoDB Connection Issues
- [ ] Verify connection string format
- [ ] Check MongoDB Atlas network access (allow all IPs: 0.0.0.0/0)
- [ ] Confirm database user credentials
- [ ] App works with in-memory storage if MongoDB fails

### CORS Errors
- [ ] `CLIENT_URL` in backend must match frontend URL exactly
- [ ] Include protocol: `https://`
- [ ] No trailing slash
- [ ] Redeploy backend after changing environment variables

---

## 🎯 Optional Enhancements

### Custom Domain
- [ ] Purchase domain (Namecheap, Google Domains, etc.)
- [ ] Add custom domain in Render settings
- [ ] Update DNS records
- [ ] Update environment variables with new domain

### Monitoring
- [ ] Set up Render alerts for service downtime
- [ ] Monitor MongoDB Atlas metrics
- [ ] Set up error tracking (Sentry, LogRocket, etc.)

### Performance
- [ ] Enable CDN for static assets
- [ ] Optimize images/assets
- [ ] Add loading states for better UX
- [ ] Consider Redis for session storage (if scaling)

---

## 📊 Cost Estimates

### Free Tier (Recommended for Testing)
- **Render**: Free for both services (spins down after 15 min inactivity)
- **MongoDB Atlas**: Free tier (512MB storage)
- **Total**: $0/month

### Production Tier
- **Render**: $7/month per service = $14/month
- **MongoDB Atlas**: Free tier sufficient or $9/month (2GB)
- **Domain**: $10-15/year
- **Total**: ~$14-25/month

---

## ✅ Launch Checklist

Before sharing with users:
- [ ] All tests passing
- [ ] No console errors
- [ ] Mobile responsive
- [ ] Performance acceptable
- [ ] Game rules explained on site
- [ ] Contact/support info added
- [ ] Analytics set up (optional)
- [ ] Backup/monitoring configured

---

## 🎉 You're Done!

Share your game:
- [ ] Share frontend URL with friends
- [ ] Post on social media
- [ ] Add to portfolio
- [ ] Consider submitting to game directories

**Your Griddle app is live! 🎮**

Need help? Check:
- [DEPLOYMENT.md](DEPLOYMENT.md) - Detailed deployment guide
- [README.md](README.md) - Full project documentation
- Render Docs: https://render.com/docs
