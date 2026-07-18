
import 'package:brandie/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditCaptionController extends GetxController {
  static const String updateId = 'edit_caption_view';

  late final TextEditingController textController;
  late final String postId;
  late final String originalCaption;

  bool hasChanges = false;

  bool get canSave {
    final text = textController.text.trim();
    return text.isNotEmpty && text != originalCaption.trim();
  }

  @override
  void onInit() {
    super.onInit();
    postId = Get.arguments as String? ?? '';
    final smartPostController = Get.find<SmartPostController>();
    final post = smartPostController.posts.firstWhereOrNull(
      (item) => item.id == postId,
    );
    originalCaption = post?.caption ?? '';
    textController = TextEditingController(text: originalCaption);
    textController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    final next = canSave;
    if (next == hasChanges) return;
    hasChanges = next;
    update([updateId]);
  }

  void onCloseTap() {
    RouteManagement.back();
  }

  void onSaveTap() {
    if (!canSave) return;
    Get.find<SmartPostController>().updateCaption(
      postId,
      textController.text.trim(),
    );
    RouteManagement.back();
  }

  @override
  void onClose() {
    textController
      ..removeListener(_onTextChanged)
      ..dispose();
    super.onClose();
  }
}
