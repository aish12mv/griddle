# Griddle - Wireframes

---

## 1. Home / Landing Page

```
┌─────────────────────────────────────────┐
│                                         │
│            🎮 GRIDDLE 🎯                │
│                                         │
│      Find words, compete, win!          │
│                                         │
│  ┌───────────────────────────────────┐  │
│  │     🎮 SINGLE PLAYER              │  │
│  │     Practice Mode                 │  │
│  └───────────────────────────────────┘  │
│                                         │
│  ┌───────────────────────────────────┐  │
│  │     🎯 CREATE ROOM                │  │
│  │     Host a multiplayer game       │  │
│  └───────────────────────────────────┘  │
│                                         │
│  ┌───────────────────────────────────┐  │
│  │     🚪 JOIN ROOM                  │  │
│  │     Enter PIN or scan QR          │  │
│  └───────────────────────────────────┘  │
│                                         │
│  ┌───────────────────────────────────┐  │
│  │     📋 PUBLIC ROOMS               │  │
│  │     Browse available games        │  │
│  └───────────────────────────────────┘  │
│                                         │
└─────────────────────────────────────────┘
```

**Interactions:**
- Single Player → Navigate to Practice Mode
- Create Room → Navigate to Room Setup
- Join Room → Navigate to PIN Entry
- Public Rooms → Navigate to Room List

---

## 2. Single Player - Practice Mode

```
┌─────────────────────────────────────────┐
│  ← Back          PRACTICE MODE    ⚙️    │
├─────────────────────────────────────────┤
│                                         │
│  Timer: [02:45]    Score: 23    🔥 8    │
│                                         │
│  Current Word: CASTLE                   │
│  ┌─────────────────────────────────┐    │
│  │  C   A   T   S   L   E   R  │    │
│  │                                 │    │
│  │  A   S   T   L   E   P   O  │    │
│  │                                 │    │
│  │  S   T   L   E   A   R   N  │    │
│  │                                 │    │
│  │  T   E   R   I   N   G   S  │    │
│  │                                 │    │
│  │  L   A   M   N   O   P   E  │    │
│  │                                 │    │
│  │  E   R   I   G   H   T   R  │    │
│  │                                 │    │
│  │  R   S   O   U   N   D   S  │    │
│  └─────────────────────────────────┘    │
│                                         │
│  ✅ Found Words (8):                    │
│  ┌─────────────────────────────────┐    │
│  │ CASTLE (6) - 3pts               │    │
│  │ TEAR (4) - 1pt                  │    │
│  │ MASTER (6) - 3pts               │    │
│  │ RING (4) - 1pt                  │    │
│  │ ...                             │    │
│  └─────────────────────────────────┘    │
│                                         │
│  [Give Up] [Hint]                       │
│                                         │
└─────────────────────────────────────────┘
```

**Interactions:**
- Drag/swipe across cells to form words
- Selected cells highlight in blue
- Current word shows above board
- Release to submit word
- Green flash for valid word + score animation
- Red flash for invalid word
- Timer counts down
- Settings: Pause, change timer duration

---

## 3. Create Room - Setup

```
┌─────────────────────────────────────────┐
│  ← Back          CREATE ROOM             │
├─────────────────────────────────────────┤
│                                         │
│  Your Name:                             │
│  ┌─────────────────────────────────┐    │
│  │ Enter your display name...      │    │
│  └─────────────────────────────────┘    │
│                                         │
│  Room Settings:                         │
│                                         │
│  Room Type:                             │
│  ( ) Public  (•) Private                │
│                                         │
│  Game Duration:                         │
│  ┌─────────────────────────────────┐    │
│  │  [  - ]  3 minutes  [ + ]       │    │
│  └─────────────────────────────────┘    │
│                                         │
│  Max Players:                           │
│  ┌─────────────────────────────────┐    │
│  │  [  - ]    8    [ + ]           │    │
│  └─────────────────────────────────┘    │
│  (2-8 players)                          │
│                                         │
│  ┌───────────────────────────────────┐  │
│  │     CREATE ROOM & CONTINUE        │  │
│  └───────────────────────────────────┘  │
│                                         │
└─────────────────────────────────────────┘
```

**Interactions:**
- Input display name (required)
- Toggle room type (public/private)
- Adjust timer with +/- buttons (1-10 min)
- Adjust max players (2-8)
- Create button → Navigate to Lobby

---

## 4. Join Room - PIN Entry

```
┌─────────────────────────────────────────┐
│  ← Back          JOIN ROOM               │
├─────────────────────────────────────────┤
│                                         │
│  Your Name:                             │
│  ┌─────────────────────────────────┐    │
│  │ Enter your display name...      │    │
│  └─────────────────────────────────┘    │
│                                         │
│  Enter Room PIN:                        │
│  ┌─────────────────────────────────┐    │
│  │         [  ][  ][  ][  ][  ][  ]│    │
│  │         6-digit code             │    │
│  └─────────────────────────────────┘    │
│                                         │
│  ┌───────────────────────────────────┐  │
│  │        JOIN ROOM                  │  │
│  └───────────────────────────────────┘  │
│                                         │
│              ─── OR ───                 │
│                                         │
│  ┌───────────────────────────────────┐  │
│  │     📷 SCAN QR CODE               │  │
│  └───────────────────────────────────┘  │
│                                         │
│                                         │
│  Error: Room not found / Room full      │
│  (shows if PIN invalid)                 │
│                                         │
└─────────────────────────────────────────┘
```

**Interactions:**
- Input display name
- Enter 6-digit PIN
- Join button → Navigate to Lobby
- Scan QR Code opens camera
- Error messages for invalid PIN or full room

---

## 5. Public Rooms - Browse

```
┌─────────────────────────────────────────┐
│  ← Back        PUBLIC ROOMS          🔄  │
├─────────────────────────────────────────┤
│                                         │
│  Available Rooms (12):                  │
│                                         │
│  ┌─────────────────────────────────┐    │
│  │ 🎮 Alex's Game Room             │    │
│  │ Players: 3/8   Timer: 3 min     │    │
│  │ Status: Waiting                 │    │
│  │                     [JOIN] →    │    │
│  └─────────────────────────────────┘    │
│                                         │
│  ┌─────────────────────────────────┐    │
│  │ 🎲 Word Warriors                │    │
│  │ Players: 5/6   Timer: 5 min     │    │
│  │ Status: Waiting                 │    │
│  │                     [JOIN] →    │    │
│  └─────────────────────────────────┘    │
│                                         │
│  ┌─────────────────────────────────┐    │
│  │ 🔥 Speed Round                  │    │
│  │ Players: 2/4   Timer: 2 min     │    │
│  │ Status: Waiting                 │    │
│  │                     [JOIN] →    │    │
│  └─────────────────────────────────┘    │
│                                         │
│  (scroll for more rooms)                │
│                                         │
└─────────────────────────────────────────┘
```

**Interactions:**
- List of public rooms (auto-refresh)
- Click JOIN → Enter name → Go to Lobby
- Refresh button to update list
- Shows only rooms in "Waiting" status
- Filter/sort options (optional)

---

## 6. Lobby - Waiting Room (Host View)

```
┌─────────────────────────────────────────┐
│  ← Leave         WAITING ROOM            │
├─────────────────────────────────────────┤
│                                         │
│  Room PIN: 582947    Share Room:        │
│                                         │
│     ┌─────────────┐                     │
│     │             │   [Copy PIN]        │
│     │  QR CODE    │   [Share Link]      │
│     │             │                     │
│     └─────────────┘                     │
│                                         │
│  Players (3/8):                         │
│  ┌─────────────────────────────────┐    │
│  │  👑 Alex (Host)                 │    │
│  │  👤 Sarah                       │    │
│  │  👤 Mike                        │    │
│  │  ⊕ Waiting for players...      │    │
│  │  ⊕ Waiting for players...      │    │
│  └─────────────────────────────────┘    │
│                                         │
│  Game Settings:                         │
│  • Duration: 3 minutes                  │
│  • Max Players: 8                       │
│  • Room Type: Private                   │
│                                         │
│  ┌───────────────────────────────────┐  │
│  │      🚀 START GAME                │  │
│  └───────────────────────────────────┘  │
│  (Min 2 players required)               │
│                                         │
└─────────────────────────────────────────┘
```

**Interactions:**
- QR code displays for easy mobile scanning
- Copy PIN button copies to clipboard
- Share link sends invitation
- Players list updates in real-time
- Host controls: Start game (when 2+ players)
- Leave room button

---

## 7. Lobby - Waiting Room (Player View)

```
┌─────────────────────────────────────────┐
│  ← Leave         WAITING ROOM            │
├─────────────────────────────────────────┤
│                                         │
│  Room: Alex's Game                      │
│                                         │
│  Players (3/8):                         │
│  ┌─────────────────────────────────┐    │
│  │  👑 Alex (Host)                 │    │
│  │  👤 Sarah                       │    │
│  │  👤 Mike (You)                  │    │
│  │  ⊕ Waiting for players...      │    │
│  │  ⊕ Waiting for players...      │    │
│  └─────────────────────────────────┘    │
│                                         │
│  Game Settings:                         │
│  • Duration: 3 minutes                  │
│  • Max Players: 8                       │
│  • Room Type: Private                   │
│                                         │
│                                         │
│         Waiting for host                │
│         to start game...                │
│                                         │
│              ⏳ Loading...              │
│                                         │
│                                         │
└─────────────────────────────────────────┘
```

**Interactions:**
- Player view (no start button)
- Players list updates live
- Waiting indicator
- Leave room button
- Auto-navigate to game when host starts

---

## 8. Multiplayer Game - Active

```
┌─────────────────────────────────────────┐
│  🏆 Multiplayer          [02:34]    ⚙️   │
├─────────────────────────────────────────┤
│                                         │
│  Current Word: MASTER                   │
│  ┌─────────────────────────────────┐    │
│  │  M   A   S   T   E   R   L  │    │
│  │                                 │    │
│  │  A   S   T   L   E   P   O  │    │
│  │                                 │    │
│  │  S   T   L   E   A   R   N  │    │
│  │                                 │    │
│  │  T   E   R   I   N   G   S  │    │
│  │                                 │    │
│  │  L   A   M   N   O   P   E  │    │
│  │                                 │    │
│  │  E   R   I   G   H   T   R  │    │
│  │                                 │    │
│  │  R   S   O   U   N   D   S  │    │
│  └─────────────────────────────────┘    │
│                                         │
│  🏆 LEADERBOARD                         │
│  ┌─────────────────────────────────┐    │
│  │ 1. 👑 Alex       45 pts  🔥 12  │    │
│  │ 2. 👤 Sarah      38 pts  🔥 10  │    │
│  │ 3. 👤 Mike (You) 32 pts  🔥 9   │    │
│  │                                 │    │
│  │ (tap to expand full list)       │    │
│  └─────────────────────────────────┘    │
│                                         │
│  Your Words (9): MASTER +3pts ✅        │
│  TEAR, STAR, LAMP, RING...              │
│                                         │
└─────────────────────────────────────────┘
```

**Interactions:**
- Same drag/swipe word selection
- Real-time leaderboard updates
- Word submission shows animation
- Timer countdown (red warning < 30sec)
- Tap leaderboard to see full rankings
- Auto-navigate to results when timer ends

---

## 9. Results Screen

```
┌─────────────────────────────────────────┐
│              GAME OVER! 🎉               │
├─────────────────────────────────────────┤
│                                         │
│         🥇 WINNER: ALEX!                │
│                                         │
│  Final Rankings:                        │
│  ┌─────────────────────────────────┐    │
│  │                                 │    │
│  │  🥇 1st - Alex        45 pts    │    │
│  │       12 words found            │    │
│  │                                 │    │
│  │  🥈 2nd - Sarah       38 pts    │    │
│  │       10 words found            │    │
│  │                                 │    │
│  │  🥉 3rd - Mike        32 pts    │    │
│  │       9 words found             │    │
│  │                                 │    │
│  └─────────────────────────────────┘    │
│                                         │
│  ┌─────────────────────────────────┐    │
│  │ 📊 View Detailed Results        │    │
│  │    (All words by player)        │    │
│  └─────────────────────────────────┘    │
│                                         │
│  ┌───────────────────────────────────┐  │
│  │      🔄 PLAY AGAIN (REMATCH)      │  │
│  └───────────────────────────────────┘  │
│                                         │
│  [Return to Lobby]  [Exit to Home]      │
│                                         │
└─────────────────────────────────────────┘
```

**Interactions:**
- Shows top 3 with medals
- View detailed results → Expanded view
- Play Again (Rematch) → New game, same players
- Return to Lobby → Wait for more players
- Exit to Home → Back to main menu

---

## 10. Detailed Results View

```
┌─────────────────────────────────────────┐
│  ← Back         DETAILED RESULTS         │
├─────────────────────────────────────────┤
│                                         │
│  🥇 Alex - 45 points (12 words)         │
│  ┌─────────────────────────────────┐    │
│  │ CASTLE (6) - 3pts               │    │
│  │ MASTER (6) - 3pts  *            │    │
│  │ STREAM (6) - 3pts               │    │
│  │ TEAR (4) - 1pt  *               │    │
│  │ STAR (4) - 1pt                  │    │
│  │ ...8 more words                 │    │
│  └─────────────────────────────────┘    │
│  * = also found by other players        │
│                                         │
│  🥈 Sarah - 38 points (10 words)        │
│  ┌─────────────────────────────────┐    │
│  │ MASTER (6) - 3pts  *            │    │
│  │ LAMP (4) - 1pt                  │    │
│  │ TEAR (4) - 1pt  *               │    │
│  │ ...7 more words                 │    │
│  └─────────────────────────────────┘    │
│                                         │
│  (scroll for all players)               │
│                                         │
│  [Share Results] [Download]             │
│                                         │
└─────────────────────────────────────────┘
```

**Interactions:**
- Expandable word lists per player
- Asterisk shows duplicate words
- Share results (social media, screenshot)
- Download CSV/JSON option
- Back to main results

---

## 11. Settings / Pause Menu

```
┌─────────────────────────────────────────┐
│              ⚙️ SETTINGS                │
├─────────────────────────────────────────┤
│                                         │
│  Sound Effects:                         │
│  ────●────────────── 80%                │
│                                         │
│  Music:                                 │
│  ──────●──────────── 50%                │
│                                         │
│  Haptic Feedback:                       │
│  [ON]  OFF                              │
│                                         │
│  Word Highlight Duration:               │
│  Fast  [MEDIUM]  Slow                   │
│                                         │
│  Theme:                                 │
│  [LIGHT]  DARK  AUTO                    │
│                                         │
│  ┌───────────────────────────────────┐  │
│  │      RESUME GAME                  │  │
│  └───────────────────────────────────┘  │
│                                         │
│  [How to Play]  [About]  [Exit Game]    │
│                                         │
└─────────────────────────────────────────┘
```

**Interactions:**
- Volume sliders
- Toggle settings
- Resume returns to game
- How to Play shows tutorial
- Exit Game confirms then exits

---

## Mobile Responsive Notes

**Portrait Mode (Primary):**
- Stack all elements vertically
- Board takes 60-70% of screen height
- Leaderboard collapses to top 3
- Buttons full width

**Landscape Mode (Optional):**
- Board on left, leaderboard on right
- Better for tablets
- More compact layout

**Touch Interactions:**
- Minimum touch target: 44x44px
- Swipe gestures smooth, 60fps
- Haptic feedback on cell selection
- Double-tap for quick submit (optional)

---

## User Flow Diagram

```
[Home]
  ├─→ [Single Player] → [Practice Game] → [Results] → [Home]
  │
  ├─→ [Create Room] → [Room Setup] → [Lobby (Host)] → [Game] → [Results]
  │                                     ↑                           │
  │                                     └───[Rematch]───────────────┘
  │
  ├─→ [Join Room] → [PIN Entry] → [Lobby (Player)] → [Game] → [Results]
  │
  └─→ [Public Rooms] → [Room List] → [Lobby (Player)] → [Game] → [Results]
```

---

## Color Scheme Suggestions

**Primary Colors:**
- Background: #F5F7FA (light gray)
- Primary: #4A90E2 (blue)
- Secondary: #50C878 (emerald green)
- Accent: #FF6B6B (coral red)

**Game States:**
- Valid word: #4CAF50 (green)
- Invalid word: #F44336 (red)
- Selected cell: #2196F3 (bright blue)
- Timer warning: #FFA726 (orange)

**Text:**
- Primary text: #333333
- Secondary text: #666666
- Light text: #999999

---

## Animation Notes

1. **Word Formation:** Selected cells glow with blue border
2. **Valid Word:** Green checkmark animation + score pop-up (+3pts)
3. **Invalid Word:** Red X shake animation
4. **Score Update:** Number count-up animation
5. **Timer Warning:** Pulse animation when < 30 seconds
6. **Leaderboard Update:** Smooth position transitions
7. **Page Transitions:** Slide left/right, 300ms ease
