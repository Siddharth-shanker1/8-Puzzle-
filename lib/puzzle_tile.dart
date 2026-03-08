import 'package:flutter/material.dart';

/// A single puzzle tile with animation
class PuzzleTile extends StatefulWidget {
  final int? number;
  final int index;
  final VoidCallback onTap;
  final bool isAnimating;

  const PuzzleTile({
    super.key,
    required this.number,
    required this.index,
    required this.onTap,
    this.isAnimating = false,
  });

  @override
  State<PuzzleTile> createState() => _PuzzleTileState();
}

class _PuzzleTileState extends State<PuzzleTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void didUpdateWidget(PuzzleTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isAnimating != widget.isAnimating && widget.isAnimating) {
      _controller.forward().then((_) {
        _controller.reset();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // If number is null (0), this is the empty space
    if (widget.number == null || widget.number == 0) {
      return Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
      );
    }

    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 4,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onTap,
            borderRadius: BorderRadius.circular(8),
            child: Center(
              child: Text(
                widget.number.toString(),
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
