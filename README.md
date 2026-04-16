# Griddle - Multiplayer Word Puzzle Game

**Griddle** is a real-time multiplayer word puzzle game where players find words in a 7×7 letter grid. Compete with up to 8 players, trace words by swiping through adjacent letters, and climb the leaderboard!

## 🎮 Features

### Single Player Mode
- **Practice Mode**: Play solo to hone your word-finding skills
- **7×7 Letter Grid**: Larger grid = more word possibilities
- **Timed Gameplay**: Configurable game duration
- **Score Tracking**: Standard Boggle scoring system

### Multiplayer Mode
- **Room System**: Create private or public game rooms
- **QR Code Joining**: Easy mobile joining via QR code or 6-digit PIN
- **Real-time Gameplay**: Socket.io powered synchronization
- **Live Leaderboard**: See scores update in real-time
- **Up to 8 Players**: Competitive multiplayer support
- **Duplicate Words Allowed**: All players score for found words

### Interactive Gameplay
- **Swipe/Drag Interface**: Touch-friendly word selection
- **Path Validation**: Real-time feedback on word paths
- **Dictionary Validation**: Words checked against English dictionary API
- **Visual Feedback**: Animated cell selection, score pop-ups
- **Mobile Optimized**: Responsive design with haptic feedback

### Scoring System (Standard Boggle Rules)
- 3-4 letters: **1 point**
- 5 letters: **2 points**
- 6 letters: **3 points**
- 7 letters: **5 points**
- 8+ letters: **11 points**

---

## 📁 Project Structure

```
griddle/
├── server/                     # Backend (Node.js + Express + Socket.io)
│   ├── models/
│   │   └── Room.js            # MongoDB room schema
│   ├── controllers/
│   │   └── roomController.js  # Room CRUD operations
│   ├── services/
│   │   ├── boardGenerator.js  # 7×7 grid generation
│   │   ├── wordValidator.js   # Dictionary API + path validation
│   │   └── gameEngine.js      # Scoring and rankings
│   ├── sockets/
│   │   └── gameHandlers.js    # Socket.io multiplayer events
│   ├── index.js               # Server entry point
│   ├── package.json
│   ├── .env                   # Environment variables
│   └── .env.example
│
├── client/                     # Frontend (React)
│   ├── public/
│   │   └── index.html
│   ├── src/
│   │   ├── components/        # React components
│   │   │   ├── Home.jsx       # Landing page
│   │   │   ├── GameBoard.jsx  # 7×7 interactive grid
│   │   │   ├── SinglePlayer.jsx
│   │   │   ├── CreateRoom.jsx
│   │   │   ├── JoinRoom.jsx
│   │   │   ├── Lobby.jsx
│   │   │   ├── MultiplayerGame.jsx
│   │   │   └── Results.jsx
│   │   ├── hooks/
│   │   │   ├── useSocket.js   # Socket.io connection hook
│   │   │   └── useWordSelection.js  # Drag/swipe gesture handling
│   │   ├── context/
│   │   │   └── GameContext.js # Global game state
│   │   ├── utils/
│   │   │   ├── boardHelpers.js
│   │   │   └── pathValidator.js
│   │   ├── styles/
│   │   │   ├── GameBoard.css
│   │   │   ├── Home.css
│   │   │   └── App.css
│   │   ├── App.js
│   │   ├── index.js
│   │   └── index.css
│   └── package.json
│
├── .gitignore
├── README.md
├── plan-griddle.prompt.md     # Development plan
└── wireframes.md              # UI wireframes

```

---

## 🚀 Getting Started

### Prerequisites
- **Node.js** (v16 or higher)
- **MongoDB** (local or MongoDB Atlas)
- **npm** or **yarn**

### Installation

#### 1. Clone/Navigate to the project
```bash
cd /Users/aishwaryamv/Desktop/Explore/griddle
```

#### 2. Install server dependencies
```bash
cd server
npm install
```

#### 3. Install client dependencies
```bash
cd ../client
npm install
```

#### 4. Configure environment variables
```bash
cd ../server
cp .env.example .env
```

Edit `server/.env` and configure:
```env
PORT=5000
MONGODB_URI=mongodb://localhost:27017/griddle
NODE_ENV=development
CLIENT_URL=http://localhost:3000
```

### Running the Application

#### Option 1: Run both servers separately

**Terminal 1 - Start MongoDB (if running locally)**
```bash
mongod
```

**Terminal 2 - Start backend server**
```bash
cd server
npm run dev
```

**Terminal 3 - Start frontend client**
```bash
cd client
npm start
```

#### Option 2: Use a process manager (recommended)

Install `concurrently`:
```bash
npm install -g concurrently
```

Create a root package.json (or run from root):
```bash
concurrently "cd server && npm run dev" "cd client && npm start"
```

The application will be available at:
- Frontend: **http://localhost:3000**
- Backend: **http://localhost:5000**

---

## 🎯 How to Play

### Single Player
1. Click **"SINGLE PLAYER"** from home screen
2. Wait for board to generate
3. **Drag or swipe** across adjacent letters to form words (minimum 3 letters)
4. Release to submit word
5. Green checkmark = valid word, Red X = invalid
6. Game ends when timer reaches zero

### Multiplayer
1. **Create a Room:**
   - Click **"CREATE ROOM"**
   - Enter your name
   - Choose settings (duration, max players, public/private)
   - Share the **6-digit PIN** or **QR code** with friends

2. **Join a Room:**
   - Click **"JOIN ROOM"**
   - Enter your name
   - Enter PIN or scan QR code
   - Wait in lobby for host to start game

3. **Play:**
   - Host clicks **"START GAME"**
   - All players get the same 7×7 grid
   - Find words by dragging/swiping through adjacent cells
   - Watch the **leaderboard** update in real-time
   - Duplicate words count for all players

4. **Finish:**
   - Game ends when timer runs out
   - See rankings with **1st** and **2nd** place winners
   - View detailed results showing all words found
   - Option to **rematch** or return to lobby

---

## 🛠️ Tech Stack

### Backend
- **Node.js** - Runtime environment
- **Express** - Web framework
- **Socket.io** - Real-time bidirectional communication
- **MongoDB + Mongoose** - Database and ODM
- **QRCode** - QR code generation
- **Axios** - HTTP client for dictionary API

### Frontend
- **React** - UI library
- **React Router** - Client-side routing
- **Socket.io Client** - Real-time client
- **Context API** - Global state management

### APIs
- **Free Dictionary API** - Word validation
  - Endpoint: `https://api.dictionaryapi.dev/api/v2/entries/en/{word}`

---

## 📱 Mobile Support

- **Responsive Design**: Works on all screen sizes
- **Touch Gestures**: Optimized swipe/drag for mobile
- **Haptic Feedback**: Vibration on cell selection (where supported)
- **QR Code Scanning**: Easy room joining on mobile devices

---

## 🧪 Testing

### Manual Testing Checklist

#### Single Player
- [ ] Board generates correctly (7×7 grid)
- [ ] Can select words by dragging/swiping
- [ ] Path validation works (adjacency, no cell reuse)
- [ ] Dictionary validation accepts valid words
- [ ] Dictionary validation rejects invalid words
- [ ] Scoring matches Boggle rules
- [ ] Timer counts down correctly
- [ ] Game ends at timer=0

#### Multiplayer - Room Creation
- [ ] Room creates with unique PIN
- [ ] QR code generates correctly
- [ ] Public/private settings work
- [ ] Host controls available

#### Multiplayer - Room Joining
- [ ] Can join with correct PIN
- [ ] Cannot join with wrong PIN
- [ ] Cannot join full room
- [ ] Players list updates in real-time

#### Multiplayer - Gameplay
- [ ] All players receive same board
- [ ] Word submission works for all players
- [ ] Leaderboard updates in real-time
- [ ] Duplicate words count for all players
- [ ] Timer syncs across all clients
- [ ] Game ends simultaneously for all players

#### Results
- [ ] Rankings calculate correctly
- [ ] Winner and 2nd place identified
- [ ] All words displayed per player
- [ ] Duplicate words marked

---

## 🔧 Configuration Options

### Game Settings (Customizable by Host)
- **Game Duration**: 1-10 minutes (default: 3 minutes)
- **Max Players**: 2-8 players (default: 8)
- **Room Type**: Public or Private

### Board Generation
- **Size**: 7×7 grid (49 cells)
- **Letter Distribution**: ~35% vowels, weighted by English frequency
- **Randomization**: New board each game

---

## 📝 API Endpoints

### REST API

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/health` | Health check |
| POST | `/api/rooms` | Create new room |
| POST | `/api/rooms/join` | Join existing room |
| GET | `/api/rooms/public` | List public rooms |
| GET | `/api/rooms/:roomId` | Get room details |

### Socket.io Events

**Client → Server:**
- `join-room` - Join a game room
- `leave-room` - Leave current room
- `start-game` - Host starts game
- `submit-word` - Submit a word

**Server → Client:**
- `room-joined` - Confirmation of room join
- `player-joined` - New player joined room
- `player-left` - Player left room
- `game-started` - Game has started
- `word-accepted` - Word validated and scored
- `word-rejected` - Word invalid
- `leaderboard-update` - Updated scores
- `game-ended` - Game finished with results
- `error` - Error message

---

## 🐛 Troubleshooting

### MongoDB Connection Issues
**Problem**: `MongoDB connection error`

**Solution**:
- Ensure MongoDB is running: `mongod`
- Check `MONGODB_URI` in `.env`
- For MongoDB Atlas, ensure IP whitelist is configured

### Socket.io Connection Failed
**Problem**: Frontend can't connect to backend

**Solution**:
- Verify backend is running on port 5000
- Check `REACT_APP_SOCKET_URL` environment variable
- Ensure CORS is configured (already set in code)

### Dictionary API Rate Limiting
**Problem**: Words not validating

**Solution**:
- API has rate limits; words are cached after first lookup
- Consider implementing local word list fallback

---

## 🚧 Remaining Implementation

The following components need to be created to complete the app:

### Required Components (Not Yet Created)
- ✅ `GameBoard.jsx` - CREATED
- ✅ `Home.jsx` - CREATED
- ⏳ `SinglePlayer.jsx` - **TODO**
- ⏳ `CreateRoom.jsx` - **TODO**
- ⏳ `JoinRoom.jsx` - **TODO**
- ⏳ `Lobby.jsx` - **TODO**
- ⏳ `MultiplayerGame.jsx` - **TODO**
- ⏳ `Results.jsx` - **TODO**

### Quick Implementation Guide:
These components can follow the wireframes in `wireframes.md` and use:
- `useGame()` hook for global state
- `useSocket()` hook for real-time communication
- `GameBoard` component for the grid
- Axios for REST API calls

---

## � Deployment

Ready to deploy Griddle to production? See the complete [**DEPLOYMENT.md**](DEPLOYMENT.md) guide for detailed instructions.

### Quick Deploy (Render - Recommended)

1. **Push to GitHub:**
   ```bash
   git init
   git add .
   git commit -m "Deploy Griddle"
   git push origin main
   ```

2. **Deploy Backend:**
   - Go to [Render Dashboard](https://dashboard.render.com/)
   - New Web Service → Connect repo
   - Root Directory: `server`
   - Build: `npm install`, Start: `npm start`
   - Add environment variables (see [.env.example](server/.env.example))

3. **Deploy Frontend:**
   - New Static Site → Connect same repo
   - Root Directory: `client`
   - Build: `npm install && npm run build`
   - Publish Directory: `build`
   - Add env: `REACT_APP_SOCKET_URL=<backend-url>`

4. **Update CORS:**
   - In backend service, add: `CLIENT_URL=<frontend-url>`

### Other Deployment Options:
- **Railway**: Automatic deployments, generous free tier
- **Vercel**: Best React performance (frontend only)
- **Heroku**: Traditional platform (paid plans)

For detailed step-by-step guides, see [**DEPLOYMENT.md**](DEPLOYMENT.md)

---

## �📄 License

MIT License - Feel free to use this project for learning or building your own word game!

---

## 👥 Contributing

This is a personal project, but suggestions and improvements are welcome!

---

## 🎉 Credits

- **Dictionary**: Free Dictionary API
- **Scoring**: Based on classic Boggle rules
- **Inspiration**: Classic word puzzle games

---

## 📧 Support

For issues or questions, please refer to the plan and wireframes documents included in this repository.

---

**Happy Word Hunting! 🎯**
