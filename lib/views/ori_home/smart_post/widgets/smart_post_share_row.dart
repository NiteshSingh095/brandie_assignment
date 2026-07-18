import 'package:brandie/core/constants/asset_constants.dart';
import 'package:brandie/core/constants/translation_utils.dart';
import 'package:brandie/res/res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SmartPostShareRow extends StatelessWidget {
  const SmartPostShareRow({super.key, required this.platforms, required this.onShare});

  final List<String> platforms;
  final ValueChanged<String> onShare;

  String? _assetFor(String platform) {
    return switch (platform.toLowerCase()) {
      'facebook' => AssetConstants.facebook,
      'whatsapp' => AssetConstants.whatsapp,
      'telegram' => AssetConstants.telegram,
      _ => null,
    };
  }

  IconData _iconFor(String platform) {
    return switch (platform.toLowerCase()) {
      'twitter' => Icons.alternate_email,
      'linkedin' => Icons.business_center,
      'reddit' => Icons.forum,
      _ => Icons.share,
    };
  }

  Color _colorFor(String platform) {
    return switch (platform.toLowerCase()) {
      'twitter' => const Color(0xFF1DA1F2),
      'linkedin' => const Color(0xFF0A66C2),
      'reddit' => const Color(0xFFFF4500),
      _ => Colors.white,
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
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: platforms.map((platform) {
                  final asset = _assetFor(platform);
                  return Padding(
                    padding: Dimens.edgeInsets(right: Dimens.eight),
                    child: GestureDetector(
                      onTap: () => onShare(platform),
                      child: Container(
                        width: Dimens.forty,
                        height: Dimens.forty,
                        padding: Dimens.edgeInsetsAll(Dimens.eight),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.25),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white),
                        ),
                        child: asset == null
                            ? Icon(
                                _iconFor(platform),
                                size: Dimens.twenty,
                                color: _colorFor(platform),
                              )
                            : Image.asset(asset, fit: BoxFit.contain),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
