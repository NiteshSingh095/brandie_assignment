import 'package:brandie/controller/smart_post/smart_post.dart';
import 'package:brandie/models/smart_post/smart_post.dart';
import 'package:brandie/res/res.dart';
import 'package:brandie/views/ori_home/smart_post/smart_post.dart';
import 'package:flutter/material.dart';

class SmartPostPage extends StatelessWidget {
  const SmartPostPage({
    super.key,
    required this.post,
    required this.index,
    required this.total,
    required this.isActive,
    required this.controller,
  });

  final SmartPostModel post;
  final int index;
  final int total;
  final bool isActive;
  final SmartPostController controller;

  @override
  Widget build(BuildContext context) {
    final topChromeHeight = MediaQuery.paddingOf(context).top + Dimens.eighty + kTextTabBarHeight;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => controller.onPostTap(post),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            post.backgroundImage,
            fit: BoxFit.cover,
            errorBuilder: (_, error, stackTrace) => Container(color: Colors.black87),
          ),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black26, Colors.transparent, Colors.transparent, Colors.black54],
                stops: [0, 0.25, 0.55, 1],
              ),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Dimens.boxHeight(Dimens.twelve),
                SmartPostHeader(post: post, index: index, total: total),
                const Spacer(),
                if (post.product != null) ...[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SmartPostProductCard(
                      product: post.product!,
                      isActive: isActive,
                      onTap: () => controller.onPostTap(post),
                    ),
                  ),
                  Dimens.boxHeight(Dimens.twelve),
                ],
                if (post.music != null) ...[
                  SmartPostMusicRow(music: post.music!),
                  Dimens.boxHeight(Dimens.ten),
                ],
                SmartPostCaption(
                  post: post,
                  isExpanded: controller.isCaptionExpanded(post.id),
                  onToggle: () => controller.toggleCaption(post.id),
                  onEdit: () => controller.onEditCaption(post),
                ),
                Dimens.boxHeight(Dimens.fourteen),
                SmartPostShareRow(platforms: post.sharePlatforms, onShare: controller.onShare),
                Dimens.boxHeight(Dimens.twenty),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(0, -topChromeHeight / 2),
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: Dimens.edgeInsets(right: Dimens.eight),
                child: PostIndicator(itemCount: total, currentIndex: index),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
