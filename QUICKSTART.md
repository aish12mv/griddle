# Griddle - Quick Start Guide

## 🚀 Get Up and Running in 5 Minutes

### Step 1: Install Dependencies (First Time Only)

```bash
# Navigate to the project
cd /Users/aishwaryamv/Desktop/Explore/griddle

# Install backend dependencies
cd server
npm install

# Install frontend dependencies  
cd ../client
npm install
```

### Step 2: Start MongoDB

**If you have MongoDB installed locally:**
```bash
# In a new terminal
mongod
```

**If using MongoDB Atlas:**
1. Create a free cluster at [mongodb.com/cloud/atlas](https://www.mongodb.com/cloud/atlas)
2. Get your connection string
3. Update `server/.env`:
   ```
   MONGODB_URI=mongodb+srv://username:password@cluster.mongodb.net/griddle
   ```

### Step 3: Start the Backend

```bash
# Terminal 1 (from griddle/server)
cd server
npm run dev
```

You should see:
```
✅ MongoDB connected
🚀 Griddle server running on port 5000
```

### Step 4: Start the Frontend

```bash
# Terminal 2 (from griddle/client)
cd client
npm start
```

Browser will automatically open to `http://localhost:3000`

### Step 5: Test It Out

The app will open to the home page with three buttons:
- **SINGLE PLAYER** - Will work once SinglePlayer component is built
- **CREATE ROOM** - Will work once CreateRoom component is built  
- **JOIN ROOM** - Will work once JoinRoom component is built

### Current Working Features

✅ **Backend is fully functional:**
- REST API running on port 5000
- Socket.io server ready for real-time connections
- MongoDB connected and storing data
- Word validation working
- Board generation working
- QR code generation working

✅ **Frontend core is ready:**
- Home page with navigation
- GameBoard component with drag/swipe interaction
- Socket.io connection hooks
- Path validation utilities
- Game state management

## 🔍 Quick Test - Backend API

Test the backend with these curl commands:

```bash
# Health check
curl http://localhost:5000/api/health

# Create a room
curl -X POST http://localhost:5000/api/rooms \
  -H "Content-Type: application/json" \
  -d '{"hostName":"TestHost","isPrivate":false,"maxPlayers":8,"gameDuration":180}'

# Get public rooms
curl http://localhost:5000/api/rooms/public
```

## 📝 What's Next?

To complete the application, you need to implement the remaining React components:

### Required Components (in order of priority):

1. **SinglePlayer.jsx** - Practice mode
2. **CreateRoom.jsx** - Room creation interface
3. **JoinRoom.jsx** - Room joining interface
4. **Lobby.jsx** - Waiting room
5. **MultiplayerGame.jsx** - Active game view
6. **Results.jsx** - Game results screen

See `IMPLEMENTATION_STATUS.md` for detailed implementation guide.

## 🐛 Troubleshooting

### "MongoServerError: connect ECONNREFUSED"
**Problem**: MongoDB is not running

**Solution**: Start MongoDB with `mongod` or use MongoDB Atlas

### "Cannot GET /"
**Problem**: Frontend not started correctly

**Solution**: Make sure you're running `npm start` from the `client` folder

### "Socket connection failed"
**Problem**: Backend not running

**Solution**: Make sure backend is running on port 5000

### Port already in use
**Problem**: Port 5000 or 3000 already taken

**Solution**: 
- Kill the process: `lsof -ti:5000 | xargs kill` (Mac/Linux)
- Or change ports in `.env` and `package.json`

## 🎯 Development Workflow

1. **Always run backend first** (Terminal 1)
2. **Then start frontend** (Terminal 2)
3. **Keep MongoDB running** (Terminal 3 if local)

### Hot Reload

Both servers support hot reload:
- **Backend**: Nodemon restarts on file changes
- **Frontend**: React auto-reloads on save

## 📚 Useful Commands

```bash
# Install new backend package
cd server
npm install package-name

# Install new frontend package
cd client
npm install package-name

# Check logs
# Backend logs appear in Terminal 1
# Frontend logs appear in Terminal 2 and browser console

# Stop servers
# Press Ctrl+C in each terminal
```

## 🎨 Folder Navigation

```
griddle/
├── server/          # Backend code - edit here for API changes
├── client/src/      # Frontend code - edit here for UI changes
├── README.md        # Full documentation
├── IMPLEMENTATION_STATUS.md  # What's done and what's left
└── wireframes.md    # UI designs for all screens
```

## ✅ Verification Checklist

After starting everything:

- [ ] Backend terminal shows "✅ MongoDB connected"
- [ ] Backend terminal shows "🚀 Griddle server running on port 5000"
- [ ] Frontend opens browser to http://localhost:3000
- [ ] Home page shows "GRIDDLE" title and three menu buttons
- [ ] No error messages in either terminal
- [ ] Browser console has no critical errors

## 🎉 You're Ready!

The foundation is complete and working. Build the remaining components using:
- **Wireframes** in `wireframes.md` for UI design
- **GameContext** for state management
- **useSocket** hook for real-time features
- **GameBoard** component for word grid

Happy coding! 🚀
