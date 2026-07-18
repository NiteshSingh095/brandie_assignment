import 'package:brandie/shared/widgets/share_loader/share_loader_view.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ShareLoaderController extends GetxController {
  ShareLoaderController({
    required this.steps,
    this.stepDuration = const Duration(milliseconds: 900),
    this.onStep,
    this.onCompleted,
  });

  final List<String> steps;
  final Duration stepDuration;
  final Future<void> Function(int index)? onStep;
  final VoidCallback? onCompleted;

  int currentIndex = 0;
  bool _isDisposed = false;

  double get progress =>
      steps.isEmpty ? 0 : (currentIndex + 1) / steps.length;

  String get currentLabel =>
      steps.isEmpty ? '' : steps[currentIndex.clamp(0, steps.length - 1)];

  @override
  void onInit() {
    super.onInit();
    _start();
  }

  Future<void> _start() async {
    for (var index = 0; index < steps.length; index++) {
      if (_isDisposed) return;

      currentIndex = index;
      update([ShareLoader.updateId]);

      if (onStep != null) {
        try {
          await onStep!(index);
        } catch (error, stackTrace) {
          debugPrint('Share preparation step $index failed: $error');
          debugPrintStack(stackTrace: stackTrace);
        }
      }
      await Future<void>.delayed(stepDuration);
    }

    if (!_isDisposed) onCompleted?.call();
  }

  @override
  void onClose() {
    _isDisposed = true;
    super.onClose();
  }
}
