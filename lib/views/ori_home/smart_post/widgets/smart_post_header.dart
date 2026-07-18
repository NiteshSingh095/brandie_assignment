import 'package:brandie/core/constants/translation_utils.dart';
import 'package:brandie/models/smart_post/smart_post.dart';
import 'package:brandie/res/res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SmartPostHeader extends StatelessWidget {
  const SmartPostHeader({
    super.key,
    required this.post,
    required this.index,
    required this.total,
  });

  final SmartPostModel post;
  final int index;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Dimens.edgeInsetsSymmetric(horizontal: Dimens.sixteen),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: Image.asset(
              post.profileImage,
              width: Dimens.fortyFour,
              height: Dimens.fortyFour,
              fit: BoxFit.cover,
              errorBuilder: (_, error, stackTrace) => Container(
                width: Dimens.fortyFour,
                height: Dimens.fortyFour,
                color: Colors.white24,
                child: Icon(Icons.person, color: Colors.white, size: Dimens.twentyFour),
              ),
            ),
          ),
          Dimens.boxWidth(Dimens.ten),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: Dimens.edgeInsetsSymmetric(
                    horizontal: Dimens.ten,
                    vertical: Dimens.four,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF4CAF50),
                    borderRadius: BorderRadius.circular(Dimens.twenty),
                  ),
                  child: Text(
                    post.statusBadge,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Dimens.twelve,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Dimens.boxHeight(Dimens.four),
                Text(
                  post.communityLine,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Dimens.twelve,
                    fontWeight: FontWeight.w500,
                    shadows: const [
                      Shadow(blurRadius: 4, color: Colors.black54),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Text(
            '${index + 1} ${TranslationUtils.ofLabel.tr} $total',
            style: TextStyle(
              color: Colors.white,
              fontSize: Dimens.twelve,
              fontWeight: FontWeight.w600,
              shadows: const [Shadow(blurRadius: 4, color: Colors.black54)],
            ),
          ),
        ],
      ),
    );
  }
}
