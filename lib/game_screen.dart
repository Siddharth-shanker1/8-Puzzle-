import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'puzzle_logic.dart';
import 'puzzle_board.dart';

/// Main game screen for the 8 Puzzle Game
class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late PuzzleLogic _puzzleLogic;
  int _moveCount = 0;
  int _secondsElapsed = 0;
  Timer? _timer;
  bool _gameWon = false;
  final Set<int> _animatingTiles = {};
  int _bestTime = 0; // Best score: least time taken to solve

  @override
  void initState() {
    super.initState();
    _loadBestScore().then((_) {
      _initializeGame();
    });
  }

  /// Load the best score from local storage
  Future<void> _loadBestScore() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _bestTime = prefs.getInt('bestScore') ?? 0;
    });
  }

  /// Save the best score to local storage
  Future<void> _saveBestScore() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('bestScore', _bestTime);
  }

  /// Initialize the game with a new shuffled puzzle
  void _initializeGame() {
    _puzzleLogic = PuzzleLogic();
    _puzzleLogic.shufflePuzzle();
    _moveCount = 0;
    _secondsElapsed = 0;
    _gameWon = false;
    _animatingTiles.clear();

    // Start the timer
    _startTimer();
    setState(() {});
  }

  /// Starts the game timer
  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!_gameWon) {
        setState(() {
          _secondsElapsed++;
        });
      }
    });
  }

  /// Handles tile tap event
  void _onTileTapped(int index) {
    if (_gameWon) return;

    if (_puzzleLogic.moveTile(index)) {
      setState(() {
        _moveCount++;
        _animatingTiles.clear();
        _animatingTiles.add(index);
      });

      // Clear animation after it completes
      Future.delayed(const Duration(milliseconds: 300), () {
        setState(() {
          _animatingTiles.clear();
        });

        // Check if puzzle is solved after animation
        if (_puzzleLogic.checkWin()) {
          _timer?.cancel();
          setState(() {
            _gameWon = true;
          });
          _showWinDialog();
        }
      });
    }
  }

  /// Resets the game with a new puzzle
  void _resetGame() {
    _initializeGame();
  }

  /// Shows the win dialog with game statistics
  void _showWinDialog() {
    // Update best time if this is a new record
    if (_bestTime == 0 || _secondsElapsed < _bestTime) {
      _bestTime = _secondsElapsed;
      _saveBestScore();
    }

    // Force UI update to show SOLVED text
    setState(() {});

    // Show dialog after a short delay to let the SOLVED text appear first
    if (mounted) {
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text(
                  '🎉 Congratulations!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'You solved the puzzle!',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Total Moves:',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                _moveCount.toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Total Time:',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                _formatTime(_secondsElapsed),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _resetGame();
                    },
                    child: const Text(
                      'Play Again',
                      style: TextStyle(fontSize: 16, color: Colors.blueAccent),
                    ),
                  ),
                ],
              );
            },
          );
        }
      });
    }
  }

  /// Formats seconds into MM:SS format
  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '$minutes:${secs.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '8 Puzzle Game',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Stats Row
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Moves',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _moveCount.toString(),
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          'Time',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _formatTime(_secondsElapsed),
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Puzzle Board
              PuzzleBoard(
                board: _puzzleLogic.getBoard(),
                onTileTapped: _onTileTapped,
                animatingTiles: _animatingTiles,
              ),
              const SizedBox(height: 24),

              // Solved Indicator
              if (_gameWon)
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 24,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withValues(alpha: 0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Text(
                    '✓ SOLVED!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                ),

              const SizedBox(height: 32),

              // New Game Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _resetGame,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                  ),
                  child: const Text(
                    'New Game',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              // Best Score and Goal Section
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[300]!, width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Best Score
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            '🏆 Best Score: ',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            _bestTime == 0
                                ? 'No record'
                                : _formatTime(_bestTime),
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Goal Layout
                    const Text(
                      'Goal:',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Goal grid display with squares - smaller size
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 2,
                                crossAxisSpacing: 2,
                                childAspectRatio: 1,
                              ),
                          itemCount: 9,
                          itemBuilder: (context, index) {
                            final number = index < 8 ? index + 1 : 0;
                            return Container(
                              decoration: BoxDecoration(
                                color: number == 0
                                    ? Colors.grey[300]
                                    : Colors.blueAccent,
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: number == 0
                                  ? const SizedBox()
                                  : Center(
                                      child: Text(
                                        number.toString(),
                                        style: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
