# Authentication System Documentation

Complete end-to-end authentication system for Griddle with user registration, login, and stats tracking.

## 🔑 Features Implemented

### Backend
- ✅ User model with MongoDB schema
- ✅ Password hashing with bcrypt
- ✅ JWT token authentication
- ✅ Protected API routes
- ✅ User stats tracking (games played, wins, best score, etc.)
- ✅ Authentication middleware
- ✅ Secure password storage

### Frontend
- ✅ Login page
- ✅ Signup/Registration page
- ✅ Auth context for global state
- ✅ User profile display on home page
- ✅ Automatic stats updates after games
- ✅ Guest mode (play without account)
- ✅ Protected routes support

## 📋 API Endpoints

### Public Routes

#### POST /api/auth/register
Register a new user account.

**Request Body:**
```json
{
  "username": "johndoe",
  "email": "john@example.com",
  "password": "securepass123",
  "displayName": "John Doe"
}
```

**Response:**
```json
{
  "message": "User registered successfully",
  "token": "eyJhbGciOiJIUzI1NiIs...",
  "user": {
    "id": "507f1f77bcf86cd799439011",
    "username": "johndoe",
    "email": "john@example.com",
    "displayName": "John Doe",
    "stats": {
      "gamesPlayed": 0,
      "gamesWon": 0,
      "totalScore": 0,
      "bestScore": 0,
      "totalWords": 0
    }
  }
}
```

#### POST /api/auth/login
Login with existing account.

**Request Body:**
```json
{
  "emailOrUsername": "johndoe",  // Can be email OR username
  "password": "securepass123"
}
```

**Response:**
```json
{
  "message": "Login successful",
  "token": "eyJhbGciOiJIUzI1NiIs...",
  "user": {
    "id": "507f1f77bcf86cd799439011",
    "username": "johndoe",
    "email": "john@example.com",
    "displayName": "John Doe",
    "stats": {
      "gamesPlayed": 15,
      "gamesWon": 3,
      "totalScore": 450,
      "bestScore": 87,
      "totalWords": 234
    }
  }
}
```

#### GET /api/auth/leaderboard
Get top players (public endpoint).

**Query Parameters:**
- `sortBy` - Field to sort by (default: "bestScore")
  - Options: `bestScore`, `gamesWon`, `totalScore`, `gamesPlayed`
- `limit` - Number of results (default: 10, max: 100)

**Response:**
```json
{
  "leaderboard": [
    {
      "username": "player1",
      "displayName": "Top Player",
      "stats": {
        "bestScore": 150,
        "gamesWon": 50,
        "totalScore": 5000
      }
    }
  ]
}
```

### Protected Routes (Require Authentication)

**Authentication Header:**
```
Authorization: Bearer <your-jwt-token>
```

#### GET /api/auth/profile
Get current user's profile.

**Response:**
```json
{
  "user": {
    "id": "507f1f77bcf86cd799439011",
    "username": "johndoe",
    "email": "john@example.com",
    "displayName": "John Doe",
    "stats": { ... },
    "createdAt": "2024-01-15T10:30:00.000Z",
    "lastLogin": "2024-01-20T14:25:00.000Z"
  }
}
```

#### POST /api/auth/stats
Update user stats after game.

**Request Body:**
```json
{
  "score": 75,
  "wordsCount": 22,
  "isWinner": true
}
```

**Response:**
```json
{
  "message": "Stats updated successfully",
  "stats": {
    "gamesPlayed": 16,
    "gamesWon": 4,
    "totalScore": 525,
    "bestScore": 87,
    "totalWords": 256
  }
}
```

## 🎮 User Experience Flow

### New User Journey
1. User visits homepage
2. Clicks "Sign Up" button
3. Fills registration form:
   - Display Name (how they appear in games)
   - Username (unique identifier)
   - Email
   - Password (min 6 characters)
4. System creates account and logs them in automatically
5. Redirected to homepage with welcome message
6. Can now play and track stats

### Returning User Journey
1. User visits homepage
2. Clicks "Log In" button
3. Enters email/username and password
4. System validates credentials
5. Redirected to homepage with profile displayed
6. Stats automatically saved after each game

### Guest User Journey
1. User visits homepage
2. Clicks "Continue as Guest" on login/signup pages
3. Can play all game modes
4. Stats are NOT saved (no account)

## 🔒 Security Features

### Password Security
- Passwords hashed with bcrypt (10 salt rounds)
- Never stored or transmitted in plain text
- Never returned in API responses

### Token Security
- JWT tokens with 7-day expiration
- Stored in localStorage on client
- Required for protected routes
- Automatically refreshed on profile load

### Validation
- Email format validation
- Username length (3-20 chars)
- Password minimum length (6 chars)
- Duplicate email/username detection
- Input sanitization

## 📊 Stats Tracking

### Automatically Tracked Metrics
- **Games Played**: Total games completed
- **Games Won**: Times user placed 1st
- **Total Score**: Cumulative points across all games
- **Best Score**: Highest single-game score
- **Total Words**: All words found across all games

### When Stats Are Updated
- **Single Player**: When game ends (timer reaches 0)
- **Multiplayer**: When game ends and results are shown
- **Saved To**: MongoDB (persistent across sessions)

### Viewing Stats
- Mini stats on homepage (when logged in)
- Full profile page (coming soon)
- Leaderboard (public view of top players)

## 🚀 How to Use

### 1. Setup Environment Variables

**Backend (.env):**
```env
JWT_SECRET=your-secret-key-change-in-production
MONGODB_URI=mongodb://localhost:27017/griddle
```

Generate secure JWT_SECRET:
```bash
node -e "console.log(require('crypto').randomBytes(32).toString('hex'))"
```

### 2. Start Backend
```bash
cd server
npm install  # Installs bcrypt and jsonwebtoken
npm run dev
```

### 3. Start Frontend
```bash
cd client
npm start
```

### 4. Test the Flow

**Register:**
```bash
curl -X POST http://localhost:5000/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "username": "testuser",
    "email": "test@example.com",
    "password": "password123",
    "displayName": "Test User"
  }'
```

**Login:**
```bash
curl -X POST http://localhost:5000/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "emailOrUsername": "testuser",
    "password": "password123"
  }'
```

**Get Profile (use token from login):**
```bash
curl http://localhost:5000/api/auth/profile \
  -H "Authorization: Bearer YOUR_TOKEN_HERE"
```

## 💡 Frontend Usage

### Using Auth Context

```javascript
import { useAuth } from '../context/AuthContext';

function MyComponent() {
  const { 
    user,           // Current user object (null if not logged in)
    isAuthenticated, // Boolean: true if user is logged in
    token,          // JWT token
    loading,        // Boolean: true while loading profile
    error,          // Error message if login/signup fails
    register,       // Function: (username, email, password, displayName)
    login,          // Function: (emailOrUsername, password)
    logout,         // Function: () => void
    updateStats     // Function: (score, wordsCount, isWinner)
  } = useAuth();

  return (
    <>
      {isAuthenticated ? (
        <p>Welcome,{user.displayName}!</p>
      ) : (
        <button onClick={() => navigate('/login')}>Login</button>
      )}
    </>
  );
}
```

### Example: Manual Stats Update

```javascript
const { updateStats, isAuthenticated } = useAuth();

// After game ends
if (isAuthenticated) {
  await updateStats(
    85,      // Final score
    28,      // Words found
    true     // Is winner (1st place)
  );
}
```

## 🎨 Customization

### Adding More User Fields

Edit `server/models/User.js`:
```javascript
const userSchema = new mongoose.Schema({
  // ... existing fields ...
  avatar: String,
  country: String,
  favoriteWords: [String]
});
```

### Adding More Stats

Edit user stats in `server/models/User.js`:
```javascript
stats: {
  // ... existing stats ...
  longestWord: String,
  averageScore: Number,
  winRate: Number
}
```

### Custom Validation

Edit `server/controllers/authController.js`:
```javascript
// Add custom validation in register function
if (password.includes('123')) {
  return res.status(400).json({ 
    error: 'Password too simple' 
  });
}
```

## 🐛 Troubleshooting

### "Invalid credentials" on login
- Check username/email is correct
- Verify password matches
- Ensure MongoDB is running
- Check server logs for errors

### Token expiration
- Tokens expire after 7 days
- User must log in again
- Can customize expiration in `middleware/auth.js`

### Stats not saving
- Ensure MongoDB is connected
- Check user is authenticated
- Verify `updateStats` is called after game
- Check server logs for errors

### "User already exists"
- Email or username already registered
- Try different username/email
- Can't recover password yet (feature coming soon)

## 🔮 Future Enhancements

Possible additions to the auth system:
- [ ] Password reset via email
- [ ] Email verification
- [ ] OAuth (Google, GitHub login)
- [ ] User avatar upload
- [ ] Friend system
- [ ] Private messages
- [ ] Achievement badges
- [ ] User profile page
- [ ] Account settings
- [ ] Delete account option

## 📝 Database Schema

### User Collection

```javascript
{
  _id: ObjectId,
  username: String (unique, 3-20 chars),
  email: String (unique, valid format),
  password: String (hashed),
  displayName: String (max 30 chars),
  stats: {
    gamesPlayed: Number,
    gamesWon: Number,
    totalScore: Number,
    bestScore: Number,
    totalWords: Number
  },
  createdAt: Date,
  lastLogin: Date
}
```

## 🎯 Best Practices

1. **Never expose JWT_SECRET** - Keep it in .env file
2. **Use HTTPS in production** - Protect tokens in transit
3. **Validate all inputs** - Both client and server side
4. **Hash passwords properly** - Use bcrypt, never plain text
5. **Set appropriate token expiration** - Balance security and UX
6. **Log authentication events** - Monitor for suspicious activity
7. **Rate limit login attempts** - Prevent brute force attacks

---

**Authentication system is complete and ready to use!** 🎉

Users can now:
- Create accounts
- Log in securely
- Track their game stats
- View leaderboards
- Play as guests (without account)
