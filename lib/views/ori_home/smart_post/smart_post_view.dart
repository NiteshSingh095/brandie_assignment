import 'package:brandie/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SmartPostView extends StatelessWidget {
  const SmartPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return SequentialLoader(
      title: TranslationUtils.sequetialLoaderTitle.tr,
      steps: [
        TranslationUtils.sequentialLoaderStepPreparing.tr,
        TranslationUtils.sequentialLoaderStepCaption.tr,
        TranslationUtils.sequentialLoaderStepReferral.tr,
        TranslationUtils.sequentialLoaderStepSongs.tr,
      ],
      completionMessage: TranslationUtils.sequentialLoaderCompletion.tr,
    );
  }
}
