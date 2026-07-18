import 'package:brandie/core/constants/translation_utils.dart';
import 'package:brandie/models/smart_post/smart_post.dart';
import 'package:brandie/res/res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SmartPostCaption extends StatelessWidget {
  const SmartPostCaption({
    super.key,
    required this.post,
    required this.isExpanded,
    required this.onToggle,
    required this.onEdit,
  });

  final SmartPostModel post;
  final bool isExpanded;
  final VoidCallback onToggle;
  final VoidCallback onEdit;

  static const int _collapsedMaxLines = 3;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Dimens.edgeInsetsSymmetric(horizontal: Dimens.sixteen),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.caption,
            maxLines: isExpanded ? null : _collapsedMaxLines,
            overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontSize: Dimens.fourteen,
              height: 1.35,
              shadows: const [Shadow(blurRadius: 4, color: Colors.black54)],
            ),
          ),
          Dimens.boxHeight(Dimens.six),
          Row(
            children: [
              GestureDetector(
                onTap: onToggle,
                child: Text(
                  isExpanded
                      ? TranslationUtils.seeLess.tr
                      : '...${TranslationUtils.seeMore.tr}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Dimens.thirteen,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white,
                  ),
                ),
              ),
              const Spacer(),
              TextButton.icon(
                onPressed: onEdit,
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  padding: Dimens.edgeInsetsSymmetric(horizontal: Dimens.eight),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                icon: Icon(Icons.edit, size: Dimens.sixteen),
                label: Text(
                  TranslationUtils.editCaption.tr,
                  style: TextStyle(
                    fontSize: Dimens.twelve,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
