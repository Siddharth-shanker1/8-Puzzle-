# 🎮 Number Puzzle Game - Handbook

## Table of Contents
1. [Game Overview](#game-overview)
2. [How to Play](#how-to-play)
3. [Game Mechanics](#game-mechanics)
4. [Features](#features)
5. [Tips & Strategies](#tips--strategies)
6. [Best Score System](#best-score-system)
7. [Requirements](#requirements)
8. [Installation](#installation)
9. [Controls & Interface](#controls--interface)
10. [Troubleshooting](#troubleshooting)

---

## Game Overview

**Number Puzzle** is a classic 8-puzzle game, also known as the "sliding puzzle". The objective is to arrange numbered tiles (1-8) in the correct order with the blank space in the bottom-right corner.

This is a fun and engaging brain teaser that helps improve:
- Problem-solving skills
- Logical thinking
- Memory and focus
- Pattern recognition

---

## How to Play

### Objective
Arrange the tiles in numerical order (1-8) from left to right, top to bottom, with the blank space in the bottom-right corner.

### Goal Layout
```
1 2 3
4 5 6
7 8 
```

### Basic Steps
1. **Start the Game**: Tap the "New Game" button to begin with a shuffled puzzle
2. **Move Tiles**: Tap any tile adjacent to the blank space to slide it
3. **Solve the Puzzle**: Continue moving tiles until you reach the goal layout
4. **Win**: When the puzzle is solved, you'll see the "✓ SOLVED!" message and a congratulations dialog

---

## Game Mechanics

### Tile Movement
- Only tiles **adjacent to the blank space** can be moved
- You can move tiles in four directions: Up, Down, Left, Right
- Each tile movement counts as **one move**

### Scoring System
The game tracks two metrics:
1. **Total Moves**: Number of tile moves you've made
2. **Total Time**: Duration (in MM:SS format) taken to solve the puzzle

### Timer
- The timer starts automatically when a new game begins
- It pauses when the puzzle is solved
- Shows elapsed time in minutes and seconds format

---

## Features

### 🏆 Best Score Tracking
- Your best score (least time) is **automatically saved**
- The best score persists across all game sessions
- First time: Shows "No record" (to be decided)
- On first solve: Your time becomes the best score
- On future solves: If your time is better than the best score, it updates

### 📊 Real-Time Statistics
- **Moves Counter**: Shows current move count
- **Time Display**: Shows elapsed time during gameplay
- **Best Score Display**: Shows your personal best time record

### 🎨 Clean User Interface
- Material Design 3 styling
- Responsive layout that works on all screen sizes
- Clear visual feedback for solved state
- Professional color scheme with blue accent colors

### ⚡ Smooth Animations
- Tile movements are animated for better UX
- Smooth transitions when solving the puzzle

---

## Tips & Strategies

### Basic Tips
1. **Take your time**: There's no rushing. Think about your moves strategically
2. **Look for patterns**: Try to group tiles that need to go together
3. **Work in layers**: Solve the top row first, then the second row
4. **Bottom-right strategy**: Leave the blank space for the bottom-right corner movements

### Solving Strategies

#### Top Row First
- Arrange tiles 1, 2, 3 in the top row
- Once set, avoid moving them

#### Middle Row
- Next, arrange tiles 4, 5, 6
- Be careful not to disturb the top row

#### Remaining Tiles
- Place 7 and 8 in their correct positions
- The blank space will automatically be in the correct position

### Advanced Techniques
- **Corner First**: Place corner tiles (1, 3, 7) first
- **Segmental Solving**: Solve one section at a time
- **Cycle Analysis**: Understand tile cycling patterns
- **Reverse Engineering**: Sometimes moving tiles backward helps reach the solution

### Common Mistakes to Avoid
1. ❌ Random tile movement (will waste moves)
2. ❌ Disrupting already-solved sections
3. ❌ Trying to rush (increases mistakes)
4. ❌ Not planning ahead (leads to unnecessary moves)

---

## Best Score System

### How It Works
- **Initial State**: First time playing shows "No record" or "to be decided"
- **First Win**: Your completion time becomes the best score
- **Subsequent Wins**: 
  - If time < best score → Best score updates ✅
  - If time > best score → Best score remains unchanged
- **Persistence**: Best score is saved locally on your device

### Viewing Your Best Score
The best score is displayed in the **"Best Score"** section at the bottom of the screen:
```
🏆 Best Score: X:XX
```
- Where X:XX is the time in minutes:seconds format
- "No record" if you haven't solved a puzzle yet

### Improving Your Score
1. Replay the game multiple times
2. Apply the strategies mentioned above
3. Aim to reduce both moves and time
4. Track your progress over sessions

---

## Requirements

### System Requirements
- **OS**: Android 5.0+ or iOS 11.0+
- **RAM**: Minimum 2GB
- **Storage**: ~50MB free space
- **Display**: Any screen size (optimized for phones and tablets)

### Device Compatibility
- ✅ Android phones and tablets
- ✅ iOS phones and tablets
- ✅ Landscape and portrait orientations

---

## Installation

### From Source
1. Clone the repository:
   ```
   git clone https://github.com/Siddharth-shanker1/8-Puzzle-.git
   ```

2. Navigate to project directory:
   ```
   cd Number\ Puzzle
   ```

3. Get dependencies:
   ```
   flutter pub get
   ```

4. Run the app:
   ```
   flutter run
   ```

### From APK (Android)
1. Download the APK file from releases
2. Enable "Unknown Sources" in Settings
3. Tap the APK file to install
4. Launch "Number Puzzle" from your app drawer

---

## Controls & Interface

### Main Screen Elements

#### Top Bar (AppBar)
- **Title**: "8 Puzzle Game"
- **Color**: Blue accent theme

#### Stats Row
- **Moves**: Current number of moves
- **Time**: Elapsed time in MM:SS format

#### Puzzle Board
- **3x3 Grid**: Shows 8 numbered tiles and 1 blank space
- **Tap Tiles**: To move adjacent tiles to blank space
- **Animated Tiles**: Smooth sliding animation

#### Game Status
- **SOLVED! Button**: Appears when puzzle is completed (green indicator)

#### New Game Button
- **Function**: Starts a fresh puzzle
- **Location**: Below the puzzle board
- **Appearance**: Blue button with white text

#### Best Score Section
- **Best Score Display**: Shows personal best time
- **Goal Layout**: Visual representation of the winning position

### Interaction Flow
```
Start App
   ↓
Tap "New Game"
   ↓
Tap adjacent tiles to move them
   ↓
Timer counts up
   ↓
Solve the puzzle
   ↓
See "SOLVED!" message
   ↓
Congratulations dialog appears
   ↓
Choose "Play Again" or exit
```

---

## Troubleshooting

### Game Issues

#### **Puzzle won't move**
- **Cause**: Only tiles adjacent to the blank space can move
- **Solution**: Try tapping tiles next to the blank space

#### **Best score not saving**
- **Cause**: App permissions or storage issues
- **Solution**: 
  - Check storage permissions in app settings
  - Reinstall the app
  - Clear app cache and data

#### **Timer is not counting**
- **Cause**: Game is already solved
- **Solution**: Tap "New Game" to start fresh

#### **App crashes on startup**
- **Cause**: Missing dependencies or corrupt installation
- **Solution**:
  - Uninstall the app completely
  - Reinstall from source or APK
  - Ensure device has sufficient storage

#### **Tiles not animating smoothly**
- **Cause**: Low device performance or animation settings
- **Solution**:
  - Close other apps
  - Restart the device
  - Check for pending updates

### Performance Issues

#### **Slow response to taps**
- Close background apps
- Clear device cache
- Ensure sufficient RAM available

#### **High battery usage**
- Close other applications
- Disable other animations on the device
- Exit the game when not playing

---

## Frequently Asked Questions (FAQ)

### Q1: What's the optimal number of moves?
**A**: The 8-puzzle can be solved in a minimum of 1 move (if already near-solved) to a maximum of 31 moves from any random state. Most people solve it in 50-150 moves.

### Q2: Is there a time limit?
**A**: No! You can take as long as you want. The timer is just for tracking, not for pressure.

### Q3: Can I pause the game?
**A**: Not directly, but you can exit the app and resume later. Your progress resets when you start a new game.

### Q4: How many times can I play?
**A**: Unlimited! Start a new game anytime.

### Q5: Can I reset my best score?
**A**: Currently, the best score is persistent. To reset, uninstall and reinstall the app, or clear app data.

### Q6: Is there a multiplayer mode?
**A**: No, this is a single-player puzzle game.

### Q7: What happens if I close the app mid-game?
**A**: The game restarts. Your best score is saved and will be visible when you reopen.

---

## Tips for Getting the Best Score

1. **Practice**: Play multiple times to improve your solving speed
2. **Learn Patterns**: Memorize common sequences
3. **Minimize Moves**: Think 3-4 moves ahead
4. **Focus**: Eliminate distractions for better concentration
5. **Track Progress**: Note your improvement over time

---

## Game Version & Updates

**Current Version**: 1.0.0  
**Platform**: Flutter (Cross-platform)  
**Last Updated**: March 2026  

For updates and new features, check the GitHub repository:  
👉 [Siddharth-shanker1/8-Puzzle-](https://github.com/Siddharth-shanker1/8-Puzzle-)

---

## Credits & Support

**Developer**: Siddharth Shanker  
**Built With**: Flutter & Dart  
**License**: MIT

For issues, suggestions, or contributions:
- Report bugs on GitHub issues
- Submit pull requests for improvements
- Star the repository if you enjoy the game! ⭐

---

## Enjoy the Game! 🎮

Thank you for playing **Number Puzzle**. We hope you have fun solving the puzzle and improving your best score. Challenge yourself and become a puzzle master! 🏆

---

**Happy Puzzling!** 🧩
