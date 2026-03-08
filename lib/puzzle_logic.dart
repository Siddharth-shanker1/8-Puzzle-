import 'dart:math';

/// Contains all the game logic for the 8 Puzzle Game
class PuzzleLogic {
  /// The board represented as a list of 9 integers
  /// Numbers 1-8 represent tiles, 0 represents the empty space
  late List<int> board;

  /// Current position of the empty tile (0)
  late int emptyPosition;

  PuzzleLogic() {
    board = List<int>.from([1, 2, 3, 4, 5, 6, 7, 8, 0]);
    emptyPosition = 8;
  }

  /// Creates a new shuffled puzzle that is always solvable
  void shufflePuzzle() {
    // Generate a random solvable configuration
    // Start from solved state and make random valid moves
    board = List<int>.from([1, 2, 3, 4, 5, 6, 7, 8, 0]);
    emptyPosition = 8;

    final random = Random();
    const numberOfShuffles = 100;

    // Make random valid moves to shuffle the puzzle
    for (int i = 0; i < numberOfShuffles; i++) {
      final validMoves = _getValidMoves();
      if (validMoves.isNotEmpty) {
        final randomMove = validMoves[random.nextInt(validMoves.length)];
        _swapTiles(randomMove, emptyPosition);
        emptyPosition = randomMove;
      }
    }
  }

  /// Checks if the puzzle is in the solved state
  bool checkWin() {
    // Check if board matches the goal state
    for (int i = 0; i < 9; i++) {
      if (i < 8 && board[i] != i + 1) {
        return false;
      }
      if (i == 8 && board[i] != 0) {
        return false;
      }
    }
    return true;
  }

  /// Attempts to move a tile at the given index
  /// Returns true if the move was valid and executed
  bool moveTile(int index) {
    if (_isAdjacentToEmpty(index)) {
      _swapTiles(index, emptyPosition);
      emptyPosition = index;
      return true;
    }
    return false;
  }

  /// Checks if the puzzle configuration is solvable
  /// For 3x3 puzzles (odd size), solvable if inversion count is even
  bool isSolvable() {
    // Count inversions in the puzzle
    int inversions = 0;
    for (int i = 0; i < 9; i++) {
      if (board[i] == 0) continue;
      for (int j = i + 1; j < 9; j++) {
        if (board[j] == 0) continue;
        if (board[i] > board[j]) {
          inversions++;
        }
      }
    }
    // For odd-width puzzles, solvable if inversions are even
    return inversions % 2 == 0;
  }

  /// Gets the current board state
  List<int> getBoard() => List<int>.from(board);

  /// Gets the position of the empty tile (0)
  int getEmptyPosition() => emptyPosition;

  /// Private helper: checks if a tile at index is adjacent to empty space
  bool _isAdjacentToEmpty(int index) {
    final row = index ~/ 3;
    final col = index % 3;
    final emptyRow = emptyPosition ~/ 3;
    final emptyCol = emptyPosition % 3;

    // Check if tiles are adjacent (not diagonal)
    return (row == emptyRow && (col - emptyCol).abs() == 1) ||
        (col == emptyCol && (row - emptyRow).abs() == 1);
  }

  /// Private helper: swaps two tiles on the board
  void _swapTiles(int index1, int index2) {
    final temp = board[index1];
    board[index1] = board[index2];
    board[index2] = temp;
  }

  /// Private helper: gets all valid moves (tiles adjacent to empty space)
  List<int> _getValidMoves() {
    final moves = <int>[];
    final emptyRow = emptyPosition ~/ 3;
    final emptyCol = emptyPosition % 3;

    // Check all four directions
    // Up
    if (emptyRow > 0) {
      moves.add((emptyRow - 1) * 3 + emptyCol);
    }
    // Down
    if (emptyRow < 2) {
      moves.add((emptyRow + 1) * 3 + emptyCol);
    }
    // Left
    if (emptyCol > 0) {
      moves.add(emptyRow * 3 + (emptyCol - 1));
    }
    // Right
    if (emptyCol < 2) {
      moves.add(emptyRow * 3 + (emptyCol + 1));
    }

    return moves;
  }
}
