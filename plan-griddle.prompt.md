## Plan: Griddle - Single & Multiplayer Word Game

Design and implement a full-stack word puzzle game with single-player practice mode and multiplayer rooms supporting up to 8 players. Players find words in a 7x7 letter matrix, score points using standard Boggle rules, and compete in real-time sessions via QR code or room PIN.

**Tech Stack**
- Frontend: React (web) with responsive design for mobile browsers
- Backend: Node.js + Express
- Real-time: Socket.io for multiplayer synchronization
- Database: MongoDB for rooms, game sessions, and statistics
- Dictionary: Free Dictionary API for word validation
- QR Code: qrcode library (npm)

**Steps**

*Phase 1: Project Setup & Core Infrastructure* (*parallel tasks*)
1. Initialize monorepo structure with separate client and server folders
2. Set up Node.js backend with Express, Socket.io, and MongoDB connection (*parallel with step 1*)
3. Set up React frontend with routing, state management (Context API or Redux), and Socket.io client (*parallel with step 1*)
4. Create environment configuration for API keys, database URLs, ports

*Phase 2: Game Engine & Logic* (*depends on Phase 1*)
5. Implement 7x7 Boggle board generator with random letter distribution (vowel/consonant balance)
6. Build word search algorithm (DFS/backtracking) to find valid paths in the matrix (adjacent cells including diagonals)
7. Create client-side path validator: check adjacency, no cell reuse, minimum 3 letters
8. Create server-side word validation service integrating Free Dictionary API with response caching
9. Implement scoring system using standard Boggle rules (3-4 letters=1pt, 5=2pts, 6=3pts, 7=5pts, 8+=11pts)

*Phase 3: Single Player Mode* (*depends on Phase 2*)
10. Build practice mode UI with 7x7 matrix display and timer
11. Implement interactive word selection: mouse drag (desktop) and touch slide (mobile) to trace words through adjacent cells
12. Add real-time visual feedback: highlight selected path, show current word being formed, invalid path indicators
13. Implement local game state management (found words, score, remaining time)
14. Create word submission flow: validate path locally, send to server for dictionary check, display result (valid/invalid)
15. Add word highlighting/path visualization when valid word is accepted
16. Create end-game summary showing score, all found words, and missed words

*Phase 4: Room Management System* (*depends on Phase 1*)
13. Create room creation API (POST /api/rooms) generating unique 6-digit PIN and room ID
14. Build room schema in MongoDB storing: roomId, PIN, hostId, players[], settings (timer, isPrivate), status, createdAt
15. Implement QR code generation for room sharing (encode room PIN and join URL)
16. Create room join API (POST /api/rooms/join) validating PIN and player capacity (max 8)
17. Add public room listing API (GET /api/rooms/public) for discoverable games

*Phase 5: Multiplayer Real-time Features* (*depends on Phases 2 & 4*)
18. Set up Socket.io event handlers: player-joined, player-left, game-started, word-submitted, game-ended
19. Implement room lobby UI showing connected players (up to 8), QR code, PIN display, and host controls
20. Build game synchronization: broadcast same 7x7 matrix to all players when host starts game
21. Create real-time word submission handling with duplicate tracking (all duplicates count)
22. Implement live leaderboard displaying player scores updating as words are found
23. Add configurable timer with synchronized countdown across all clients

*Phase 6: Game Completion & Results* (*depends on Phase 5*)
24. Build end-game calculation determining 1st and 2nd place based on final scores
25. Create results screen showing: final leaderboard, all words found per player, unique vs duplicate words
26. Add rematch functionality (same players, new board) and return to lobby option

*Phase 7: UI/UX Polish* (*parallel with implementation phases*)
31. Design responsive matrix grid component (clickable/draggable cells) working on mobile and desktop
32. Implement smooth touch slide gesture handling for mobile word tracing
33. Implement mouse drag gesture handling for desktop word tracing
34. Add haptic feedback (mobile vibration) when selecting cells
35. Add visual feedback for valid/invalid words: green checkmark for accepted words, red X for rejected, score pop-up animations, timer warnings
36. Create mobile-friendly QR code scanner integration or PIN entry modal
37. Polish cell selection animations: border highlight, color changes, connecting lines between selected cells

*Phase 8: Testing & Deployment* (*depends on all previous phases*)
31. Write unit tests for word search algorithm, scoring, and room management
32. Perform Socket.io stress testing with 8 concurrent players
33. Set up production environment (MongoDB Atlas, hosting on Render/Railway/Vercel)
34. Configure CORS, security headers, rate limiting for APIs

**Relevant Files to Create**

Backend:
- `griddle/server/index.js` — Express app initialization, Socket.io setup
- `griddle/server/models/Room.js` — Mongoose schema for rooms
- `griddle/server/controllers/roomController.js` — Room CRUD operations
- `griddle/server/services/boardGenerator.js` — 7x7 matrix generation logic
- `griddle/server/services/wordValidator.js` — Dictionary API integration
- `griddle/server/services/gameEngine.js` — Scoring, word search validation
- `griddle/server/sockets/gameHandlers.js` — Socket.io event handlers for multiplayer
- `griddle/server/package.json` — Backend dependencies
- `griddle/server/.env` — Environment variables (MongoDB URI, PORT, API keys)

Frontend:
- `griddle/client/src/App.js` — Router setup (single-player, create-room, join-room, lobby, game)
- `griddle/client/src/components/GameBoard.jsx` — 7x7 matrix display with drag/swipe interaction
- `griddle/client/src/components/SinglePlayer.jsx` — Practice mode UI
- `griddle/client/src/components/CreateRoom.jsx` — Room creation with QR code display
- `griddle/client/src/components/JoinRoom.jsx` — PIN/QR entry interface
- `griddle/client/src/components/Lobby.jsx` — Waiting room showing players and settings
- `griddle/client/src/components/MultiplayerGame.jsx` — Real-time game UI with leaderboard
- `griddle/client/src/components/Results.jsx` — End-game summary and rankings
- `griddle/client/src/hooks/useSocket.js` — Custom hook for Socket.io connection
- `griddle/client/src/hooks/useWordSelection.js` — Custom hook for drag/swipe gesture handling
- `griddle/client/src/context/GameContext.js` — Global game state management
- `griddle/client/src/utils/pathValidator.js` — Client-side path validation (adjacency, no repeats)
- `griddle/client/src/utils/wordSearch.js` — Helper functions for word finding
- `griddle/client/src/utils/boardHelpers.js` — Get adjacent cells, calculate neighbors
- `griddle/client/package.json` — Frontend dependencies

Root:
- `griddle/README.md` — Project documentation and setup instructions
- `griddle/.gitignore` — Git ignore rules

**Verification**

1. Single Player: Start practice game, verify 7x7 matrix generates, find valid 3+ letter words, confirm scoring matches standard Boggle rules, complete game and see summary
2. Interactive Selection (Desktop): Drag mouse across cells to form words, verify path highlights in real-time, verify word displays as you drag, release to submit
3. Interactive Selection (Mobile): Swipe finger across cells, verify smooth touch tracking, verify haptic feedback on cell selection, verify diagonal adjacency works
4. Path Validation: Try selecting non-adjacent cells (should be rejected), try reusing same cell in one word (should be rejected), verify minimum 3 letters enforced
5. Word Validation: Submit valid dictionary words (expect green checkmark), submit invalid/nonsensical words (expect red X with reason)
6. Room Creation: Create private room, verify 6-digit PIN and QR code generated, copy PIN for testing
7. Room Joining: Join room using PIN from another browser/device, verify both players appear in lobby (test up to 8 players)
8. Multiplayer Game: Host starts game, confirm all players receive same 7x7 matrix, submit words via drag/swipe and verify real-time score updates on leaderboard
9. Duplicate Words: Have 2+ players submit same word, confirm all receive points (duplicates allowed mode)
10. Game Completion: Finish timed game, verify 1st and 2nd place correctly identified, check results screen shows all player words
11. Public Rooms: Create public room, verify it appears in public listing, test joining from list
12. Timer Configuration: Create room with custom timer (e.g., 2 min, 5 min), verify countdown works correctly

**Word Selection & Validation Flow**

1. **User Interaction**: Player slides/swipes finger (mobile) or drags mouse (desktop) across adjacent cells in the 7x7 matrix
2. **Visual Feedback**: Selected cells highlight in real-time, forming word displays above board
3. **Path Validation (Client)**: 
   - Check each cell is adjacent to previous (including diagonals: 8 possible neighbors)
   - Ensure no cell is used twice in same word
   - Minimum 3 letters required
   - If invalid path detected, show red indicator
4. **Submit Word**: Player releases touch/mouse when word complete
5. **Dictionary Validation (Server)**:
   - Client sends: word + path coordinates
   - Server re-validates path (security check)
   - Server checks word against Free Dictionary API
   - Server checks if player already submitted this word
   - Response: accepted (with points) or rejected (with reason)
6. **Update UI**: Show checkmark/X animation, update score, add word to player's list

**Decisions**

- Anonymous authentication: Players only need to enter a display name, no sign-up required (fast onboarding)
- All duplicates count: If multiple players find same word, all get points (encourages competitive speed)
- Dictionary API: Using external API means always up-to-date word list, requires internet connection
- Interactive word selection: Swipe/drag interaction (no typing) for intuitive mobile-first UX
- Two-layer validation: Client validates path instantly, server validates dictionary asynchronously
- QR Code for joining: Simplifies mobile joining, but PIN entry available as fallback
- Max 8 players: Balances game competitiveness with technical scalability
- Configurable timer: Host sets duration (2-10 minutes typical), stored in room settings
- 7x7 matrix: Larger than standard 4x4/5x5 Boggle for more word discovery opportunities
- Both public and private rooms: Public rooms discoverable in lobby, private rooms require PIN

**Further Considerations**

1. **Database Choice**: MongoDB (recommended for flexible schema, easy Room document updates) vs PostgreSQL (better for complex queries if adding analytics later). MongoDB preferred for faster development.

2. **Mobile App vs PWA**: Current plan uses responsive React web app. Consider converting to Progressive Web App (PWA) for install-on-home-screen capability, or build dedicated React Native app later for app store distribution.

3. **Dictionary API Rate Limiting**: Free Dictionary API has rate limits. Implement caching (Redis or in-memory) for validated words to minimize API calls. Consider bundled word list as fallback if API quota exceeded.

4. **Word Path Visualization**: Should the UI highlight the path through the matrix when a valid word is found? Enhances user experience but adds complexity to board component.

5. **Rematch vs New Game**: After game ends, should "Rematch" keep same players in room with new board, or always require creating new room? Rematch recommended for better UX.
