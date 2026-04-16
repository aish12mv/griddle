# 🚀 Quick Start Guide - Authentication System

## Setup Instructions (5 minutes)

### 1. Install Dependencies (if not already done)

Backend dependencies are already installed, but if needed:
```bash
cd server
npm install bcrypt jsonwebtoken
```

### 2. Configure Environment Variables

**Create or update `server/.env`:**
```bash
cd server
cp .env.example .env
```

**Edit `.env` and add:**
```env
# Generate a secure secret with:
# node -e "console.log(require('crypto').randomBytes(32).toString('hex'))"
JWT_SECRET=your-secure-random-secret-here

# MongoDB connection (required for auth)
MONGODB_URI=mongodb://localhost:27017/griddle

# Other settings
PORT=5000
CLIENT_URL=http://localhost:3000
NODE_ENV=development
```

### 3. Start MongoDB (Required for Authentication)

**Option A: Local MongoDB**
```bash
# macOS with Homebrew
brew services start mongodb-community

# Or check if it's running
ps aux | grep mongod
```

**Option B: MongoDB Atlas (Cloud)**
1. Create free account at https://www.mongodb.com/cloud/atlas
2. Create cluster
3. Get connection string
4. Update `MONGODB_URI` in `.env`

### 4. Start the Application

**Terminal 1 - Backend:**
```bash
cd server
npm run dev
```

**Terminal 2 - Frontend:**
```bash
cd client
npm start
```

### 5. Test the System

Open http://localhost:3000 in your browser.

**Create an Account:**
1. Click "Sign Up" button (top right)
2. Fill in the form:
   - Display Name: "Your Name"
   - Username: "yourusername"
   - Email: "you@example.com"
   - Password: "password123"
3. Click "Sign Up"
4. You'll be automatically logged in and redirected to homepage

**Log In:**
1. Click "Logout" if logged in
2. Click "Log In" button
3. Enter username/email and password
4. Click "Log In"

**Play and Track Stats:**
1. Play a single player or multiplayer game
2. After game ends, stats are automatically saved
3. View mini-stats on homepage (games played, best score)

## ✅ Quick Test Checklist

- [ ] Backend starts without errors
- [ ] Frontend starts and loads homepage
- [ ] Can click "Sign Up" and see signup form
- [ ] Can create account (MongoDB must be running)
- [ ] After signup, see welcome message on homepage
- [ ] Can logout and login again
- [ ] After playing game, stats update on homepage
- [ ] "Continue as Guest" works (no account needed)

## 🎮 How Users Will Experience It

### First Time User
1. Visits app → See "Log In" and "Sign Up" buttons
2. Clicks "Sign Up" → Fills form → Account created
3. Redirected to homepage with "Welcome back, [Name]!"
4. Plays games → Stats automatically tracked
5. Can logout and login anytime

### Returning User
1. Visits app → Clicks "Log In"
2. Enters credentials → Logs in
3. Sees profile with updated stats
4. Stats persist across sessions

### Guest User
1. Visits app → Clicks "Continue as Guest" on auth pages
2. Can play all games
3. Stats NOT saved (no account)

## 📊 Where to See User Data

### In MongoDB
```bash
# Connect to MongoDB
mongo

# Switch to griddle database
use griddle

# View all users
db.users.find().pretty()

# Find specific user
db.users.findOne({ username: "yourusername" })
```

### Via API
```bash
# Login to get token
curl -X POST http://localhost:5000/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"emailOrUsername":"yourusername","password":"password123"}'

# Get profile (use token from above)
curl http://localhost:5000/api/auth/profile \
  -H "Authorization: Bearer YOUR_TOKEN_HERE"

# View leaderboard
curl http://localhost:5000/api/auth/leaderboard
```

## 🐛 Common Issues

### "Cannot connect to MongoDB"
**Solution:** Start MongoDB locally or use MongoDB Atlas
```bash
brew services start mongodb-community
```

### "User already exists"
**Solution:** Username or email already registered. Try different credentials.

### Token expired
**Solution:** Tokens last 7 days. After expiration, user must login again.

### Stats not saving
**Solution:** 
1. Ensure MongoDB is running
2. Check user is logged in (not guest)
3. Verify backend shows no errors

### "JWT_SECRET not set" warning
**Solution:** Add `JWT_SECRET` to `server/.env`

## 🔒 Security Notes

### Development
- Using test JWT_SECRET is OK for development
- MongoDB without auth is OK for local testing

### Production
- **Must** generate secure JWT_SECRET
- **Must** use MongoDB with authentication
- **Must** use HTTPS for API
- **Must** set secure CORS policies

Generate production JWT_SECRET:
```bash
node -e "console.log(require('crypto').randomBytes(64).toString('hex'))"
```

## 📚 Next Steps

1. ✅ Test the authentication flow
2. ✅ Create a test account
3. ✅ Play games and verify stats save
4. 📖 Read [AUTHENTICATION.md](AUTHENTICATION.md) for full documentation
5. 🚀 Deploy (see [DEPLOYMENT.md](DEPLOYMENT.md))

## 💡 Tips

- **Guest Mode:** Users can play without account (stats not saved)
- **Stats Auto-Save:** Stats update automatically after each game
- **Persistent Login:** Users stay logged in until they logout or token expires (7 days)
- **Mobile Friendly:** Auth pages work on mobile devices

## 🎉 You're All Set!

Your Griddle app now has:
- ✅ User registration
- ✅ Secure login
- ✅ Stats tracking
- ✅ Leaderboards
- ✅ Guest mode option

Users can create accounts, login, and have their game stats automatically tracked!

---

**Need help?** Check [AUTHENTICATION.md](AUTHENTICATION.md) for detailed documentation.
