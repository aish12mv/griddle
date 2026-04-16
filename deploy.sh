#!/bin/bash

# Griddle Quick Deployment Script for Render
# This script helps you prepare your app for deployment

echo "🎮 Griddle Deployment Helper"
echo "=============================="
echo ""

# Check if Git is initialized
if [ ! -d .git ]; then
    echo "📦 Initializing Git repository..."
    git init
    git add .
    git commit -m "Initial commit - Ready for deployment"
    echo "✅ Git repository initialized"
else
    echo "✅ Git repository already exists"
fi

echo ""
echo "📋 Pre-Deployment Checklist:"
echo ""
echo "1. Create MongoDB Atlas account (optional but recommended)"
echo "   → https://www.mongodb.com/cloud/atlas"
echo ""
echo "2. Push code to GitHub:"
echo "   → Create repo: https://github.com/new"
echo "   → Run: git remote add origin <your-repo-url>"
echo "   → Run: git push -u origin main"
echo ""
echo "3. Deploy Backend on Render:"
echo "   → https://dashboard.render.com/create?type=web"
echo "   → Root Directory: server"
echo "   → Build Command: npm install"
echo "   → Start Command: npm start"
echo "   → Add environment variables (see server/.env.example)"
echo ""
echo "4. Deploy Frontend on Render:"
echo "   → https://dashboard.render.com/create?type=static"
echo "   → Root Directory: client"
echo "   → Build Command: npm install && npm run build"
echo "   → Publish Directory: build"
echo "   → Environment Variable: REACT_APP_SOCKET_URL=<your-backend-url>"
echo ""
echo "5. Update CORS:"
echo "   → In backend service, add CLIENT_URL=<your-frontend-url>"
echo "   → Redeploy backend"
echo ""
echo "📖 For detailed instructions, see DEPLOYMENT.md"
echo ""
echo "Need help? Check out:"
echo "  - Render Docs: https://render.com/docs"
echo "  - MongoDB Atlas: https://docs.atlas.mongodb.com/"
echo ""
