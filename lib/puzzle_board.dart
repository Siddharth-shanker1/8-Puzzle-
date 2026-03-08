import 'package:flutter/material.dart';
import 'puzzle_tile.dart';

/// Displays the 3x3 puzzle grid
class PuzzleBoard extends StatelessWidget {
  final List<int> board;
  final Function(int) onTileTapped;
  final Set<int> animatingTiles;

  const PuzzleBoard({
    super.key,
    required this.board,
    required this.onTileTapped,
    this.animatingTiles = const {},
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
          childAspectRatio: 1,
        ),
        itemCount: 9,
        itemBuilder: (context, index) {
          return PuzzleTile(
            number: board[index] == 0 ? null : board[index],
            index: index,
            onTap: () => onTileTapped(index),
            isAnimating: animatingTiles.contains(index),
          );
        },
      ),
    );
  }
}
