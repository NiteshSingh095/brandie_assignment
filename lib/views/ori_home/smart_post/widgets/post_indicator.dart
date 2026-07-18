import 'package:brandie/main.dart';
import 'package:flutter/material.dart';

class PostIndicator extends StatelessWidget {
  const PostIndicator({super.key, required this.itemCount, required this.currentIndex});

  final int itemCount;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Dimens.edgeInsetsAll(Dimens.six),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(Dimens.ten),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          itemCount,
          (dotIndex) => AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: Dimens.ten,
            height: Dimens.ten,
            margin: Dimens.edgeInsetsSymmetric(vertical: Dimens.three),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: dotIndex == currentIndex ? const Color(0xFF72D6A5) : Colors.white,
              boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 3)],
            ),
          ),
        ),
      ),
    );
  }
}