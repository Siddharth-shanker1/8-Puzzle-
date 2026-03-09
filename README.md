# Number Puzzle Game

A classic 8-puzzle sliding game built with **Flutter**. Solve the puzzle by arranging numbered tiles in the correct order and beat your best score!

[![Flutter](https://img.shields.io/badge/Flutter-3.35.4-blue?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.9.2-blue?logo=dart)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

---

## Features

- Classic 8-Puzzle Gameplay - Arrange tiles 1-8 in correct order
- Real-time Timer - Track how fast you can solve
- Move Counter - Monitor your efficiency
- Persistent Best Score - Your best time is saved locally across sessions
- Beautiful UI - Material Design 3 with smooth animations
- Cross-Platform - Works on Android & iOS
- Fast & Responsive - Smooth tile animations and instant feedback
- Unlimited Replays - Play as many times as you want

---

## How to Play

1. **Start**: Tap "New Game" to begin with a shuffled puzzle
2. **Move**: Tap any tile adjacent to the blank space to slide it
3. **Solve**: Arrange tiles in numerical order (1-8)
4. **Win**: Get the tiles in this order:
   ```
   1 2 3
   4 5 6
   7 8 ⬜
   ```
5. **Beat Your Score**: Solve it again faster to improve your best time!

**For detailed instructions and strategies**, see the [HANDBOOK.md](HANDBOOK.md)

---

## Quick Start

### Prerequisites
- Flutter 3.9.2 or higher
- Dart 3.9.2 or higher

### Installation

**1. Clone the repository:**
```bash
git clone https://github.com/Siddharth-shanker1/8-Puzzle-.git
cd "Number Puzzle"
```

**2. Get dependencies:**
```bash
flutter pub get
```

**3. Run the app:**
```bash
flutter run
```

### Build APK (Android)
```bash
flutter build apk --release
```
The APK will be generated at: `build/app/outputs/flutter-apk/app-release.apk`

---

## Documentation

- **[HANDBOOK.md](HANDBOOK.md)** - Complete guide including:
  - Detailed gameplay instructions
  - Solving strategies and tips
  - Best score system explanation
  - Troubleshooting guide
  - FAQ section

---

## Game Mechanics

### Scoring
- **Moves**: Number of tile movements
- **Time**: Duration to solve (tracked in MM:SS format)
- **Best Score**: Personal record (fastest time) - saved automatically

### Tile Movement
- Only tiles **adjacent to the blank space** can move
- Tiles slide smoothly with animation
- Each movement counts as 1 move

### Timer
- Starts when game begins
- Pauses when puzzle is solved
- Runs continuously until completion

---

## Built With

- **[Flutter](https://flutter.dev/)** - Cross-platform mobile framework
- **[Dart](https://dart.dev/)** - Programming language
- **[shared_preferences](https://pub.dev/packages/shared_preferences)** - Local data persistence for best score
- **Material Design 3** - Modern UI/UX design system

---

## Platform Support

| Platform | Status |
|----------|--------|
| Android  | Fully Supported |
| iOS      | Fully Supported |
| Web      | Partial Support |
| macOS    | Partial Support |
| Windows  | Partial Support |
| Linux    | Partial Support |

---

## Tips for Solving

1. **Take your time** - No time pressure, think strategically
2. **Solve in layers** - Top row first, then middle, then bottom
3. **Watch for patterns** - Learn common tile sequences
4. **Minimize moves** - Plan ahead to reduce move count
5. **Practice** - Play multiple times to improve your best score

For more detailed strategies, see the [HANDBOOK.md](HANDBOOK.md#tips--strategies)

---

## Troubleshooting

**Puzzle won't move?**
- Only tiles adjacent to the blank space can move

**Best score not saving?**
- Check app storage permissions
- Try reinstalling the app

**More issues?** Check the [HANDBOOK.md troubleshooting section](HANDBOOK.md#troubleshooting)

---

## Screenshots

Screenshots coming soon!

---

## License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---
