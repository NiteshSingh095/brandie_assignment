import 'package:brandie/core/constants/translation_utils.dart';
import 'package:brandie/res/res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SmartPostShareRow extends StatelessWidget {
  const SmartPostShareRow({
    super.key,
    required this.platforms,
    required this.onShare,
  });

  final List<String> platforms;
  final ValueChanged<String> onShare;

  IconData _iconFor(String platform) {
    return switch (platform.toLowerCase()) {
      'instagram' => Icons.camera_alt_outlined,
      'facebook' => Icons.facebook,
      'messenger' => Icons.chat_bubble_outline,
      'tiktok' => Icons.music_note,
      _ => Icons.share,
    };
  }

  Color _colorFor(String platform) {
    return switch (platform.toLowerCase()) {
      'instagram' => const Color(0xFFE1306C),
      'facebook' => const Color(0xFF1877F2),
      'messenger' => const Color(0xFF00B2FF),
      'tiktok' => Colors.black,
      _ => Colors.grey,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Dimens.edgeInsetsSymmetric(horizontal: Dimens.sixteen),
      child: Row(
        children: [
          Text(
            TranslationUtils.quickShareTo.tr,
            style: TextStyle(
              color: Colors.white,
              fontSize: Dimens.thirteen,
              fontWeight: FontWeight.w600,
              shadows: const [Shadow(blurRadius: 4, color: Colors.black54)],
            ),
          ),
          Dimens.boxWidth(Dimens.ten),
          ...platforms.map(
            (platform) => Padding(
              padding: Dimens.edgeInsets(right: Dimens.eight),
              child: GestureDetector(
                onTap: () => onShare(platform),
                child: CircleAvatar(
                  radius: Dimens.eighteen,
                  backgroundColor: Colors.white,
                  child: Icon(
                    _iconFor(platform),
                    size: Dimens.eighteen,
                    color: _colorFor(platform),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
