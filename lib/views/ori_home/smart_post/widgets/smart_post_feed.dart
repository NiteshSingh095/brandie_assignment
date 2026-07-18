import 'package:brandie/controller/smart_post/smart_post.dart';
import 'package:brandie/views/ori_home/smart_post/widgets/smart_post_page.dart';
import 'package:flutter/material.dart';

class SmartPostFeed extends StatelessWidget {
  const SmartPostFeed({super.key, required this.controller});

  final SmartPostController controller;

  @override
  Widget build(BuildContext context) {
    final posts = controller.posts;

    if (posts.isEmpty) {
      return const Center(child: Text('No posts available'));
    }

    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: posts.length,
      onPageChanged: controller.onPageChanged,
      itemBuilder: (context, index) {
        return SmartPostPage(
          post: posts[index],
          index: index,
          total: posts.length,
          isActive: index == controller.currentIndex,
          controller: controller,
        );
      },
    );
  }
}
