import 'package:brandie/models/smart_post/smart_post.dart';
import 'package:brandie/shared/enums.dart';
import 'package:brandie/view_model/smart_post/smart_post.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class SmartPostController extends GetxController {
  SmartPostController({SmartPostViewModel? viewModel})
      : _viewModel = viewModel ?? SmartPostViewModel();

  static const String updateId = 'smart_post_view';

  final SmartPostViewModel _viewModel;

  SmartPostPhase phase = SmartPostPhase.loading;
  List<SmartPostModel> posts = [];
  int currentIndex = 0;
  final Set<String> _expandedCaptionIds = {};
  bool isLoadingPosts = false;
  String? errorMessage;

  SmartPostModel? get currentPost =>
      posts.isEmpty ? null : posts[currentIndex.clamp(0, posts.length - 1)];

  bool isCaptionExpanded(String postId) => _expandedCaptionIds.contains(postId);

  Future<void> onLoaderCompleted() async {
    await loadPosts();
  }

  Future<void> loadPosts() async {
    isLoadingPosts = true;
    errorMessage = null;
    update([updateId]);

    try {
      posts = await _viewModel.fetchPosts();
      currentIndex = 0;
      phase = SmartPostPhase.ready;
    } catch (e) {
      errorMessage = e.toString();
      phase = SmartPostPhase.ready;
    } finally {
      isLoadingPosts = false;
      update([updateId]);
    }
  }

  void onPageChanged(int index) {
    currentIndex = index;
    update([updateId]);
  }

  void toggleCaption(String postId) {
    if (_expandedCaptionIds.contains(postId)) {
      _expandedCaptionIds.remove(postId);
    } else {
      _expandedCaptionIds.add(postId);
    }
    update([updateId]);
  }

  void onProductTap(SmartPostModel post) {
    final link = post.product?.storeLink;
    debugPrint('Product tapped: ${post.product?.name} → $link');
  }

  void onEditCaption(SmartPostModel post) {
    debugPrint('Edit caption for post ${post.id}');
  }

  void onShare(String platform) {
    debugPrint('Share to $platform');
  }
}
