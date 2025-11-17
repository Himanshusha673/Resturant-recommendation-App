import 'package:flutter/material.dart';

class CuisineCard extends StatelessWidget {
  final String name;
  final String emoji;
  final List<Color> gradientColors;
  final bool isSelected;
  final VoidCallback onTap;
  final int index;

  const CuisineCard({
    super.key,
    required this.name,
    required this.emoji,
    required this.gradientColors,
    required this.isSelected,
    required this.onTap,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final bool isOdd = index % 2 == 1; // odd → image left, even → right

    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          if (isOdd) _buildCircleImage(),

          // TEXT CARD WITH FADE EFFECT
          Expanded(
            child: Stack(
              children: [
                _buildTextContainer(isOdd),

                // FADE OVERLAY
                _fadeOverlay(isOdd),
              ],
            ),
          ),

          if (!isOdd) _buildCircleImage(),
          const SizedBox(width: 16),
        ],
      ),
    );
  }

  // ---------- TEXT CONTAINER ----------
  Widget _buildTextContainer(bool isOdd) {
    return Container(
      height: 70,
      alignment: isOdd ? Alignment.centerRight : Alignment.centerLeft,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors:
              !isOdd
                  ? isSelected
                      ? gradientColors
                      : [
                        Colors.white.withOpacity(0.2),
                        Colors.white.withValues(alpha: 0.001),
                      ]
                  : isSelected
                  ? gradientColors.reversed.toList()
                  : [
                    Colors.white.withValues(alpha: 0.001),
                    Colors.white.withOpacity(0.2),
                  ],
          stops: !isOdd ? const [0.6, 1.0] : [-1, 0.6],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(24),
        // border: Border.all(
        //   color: isSelected ? const Color(0xFFD4AF37) : Colors.transparent,
        //   width: 2,
        // ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Text(
          name,
          textAlign: isOdd ? TextAlign.right : TextAlign.left,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }

  // ---------- CIRCULAR IMAGE ----------
  Widget _buildCircleImage() {
    return ClipOval(
      child: Container(
        width: 100,
        height: 100,
        color: Colors.white.withOpacity(0.1),
        child: Image.asset(
          emoji,
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      ),
    );
  }

  // ---------- FADE GRADIENT ----------
  Widget _fadeOverlay(bool isOdd) {
    return Positioned.fill(
      child: Align(
        alignment: isOdd ? Alignment.centerLeft : Alignment.centerRight,
        child: Container(
          width: 40,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: isOdd ? Alignment.centerLeft : Alignment.centerRight,
              end: isOdd ? Alignment.centerRight : Alignment.centerLeft,
              colors: [Colors.black.withOpacity(0.4), Colors.transparent],
            ),
          ),
        ),
      ),
    );
  }
}
