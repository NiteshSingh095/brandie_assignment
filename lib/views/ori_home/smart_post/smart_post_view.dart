import 'package:brandie/main.dart';
import 'package:brandie/shared/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SmartPostView extends StatelessWidget {
  const SmartPostView({super.key});

  static const String updateId = SmartPostController.updateId;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SmartPostController>(
      id: SmartPostController.updateId,
      initState: (_) {
        if (!Get.isRegistered<SmartPostController>()) {
          SmartPostBindings().dependencies();
        }
      },
      builder: (controller) {
        if (controller.phase == SmartPostPhase.loading) {
          return SequentialLoader(
            title: TranslationUtils.sequetialLoaderTitle.tr,
            steps: [
              TranslationUtils.sequentialLoaderStepPreparing.tr,
              TranslationUtils.sequentialLoaderStepCaption.tr,
              TranslationUtils.sequentialLoaderStepReferral.tr,
              TranslationUtils.sequentialLoaderStepSongs.tr,
            ],
            completionMessage: TranslationUtils.sequentialLoaderCompletion.tr,
            onCompleted: controller.onLoaderCompleted,
          );
        }

        if (controller.isLoadingPosts) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage != null) {
          return Center(child: Text(controller.errorMessage!));
        }

        return SmartPostFeed(controller: controller);
      },
    );
  }
}
