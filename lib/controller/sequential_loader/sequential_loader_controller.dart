import 'package:brandie/main.dart';
import 'package:brandie/shared/enums.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class SequentialLoaderController extends GetxController {
  SequentialLoaderController({
    required List<String> stepLabels,
    this.stepDuration = const Duration(milliseconds: 1200),
    this.onStep,
    this.onCompleted,
  }) : steps = stepLabels.map((label) => ProgressStepModel(label: label)).toList();


  final Duration stepDuration;
  final Future<void> Function(int index)? onStep;
  final VoidCallback? onCompleted;

  final List<ProgressStepModel> steps;
  bool isAllCompleted = false;

  bool _isRunning = false;
  bool _isDisposed = false;

  @override
  void onInit() {
    super.onInit();
    start();
  }

  @override
  void onClose() {
    _isDisposed = true;
    _isRunning = false;
    super.onClose();
  }

  /// Start the sequential loader
  Future<void> start() async {
    if (_isRunning || steps.isEmpty) return;
    _isRunning = true;
    isAllCompleted = false;

    for (var i = 0; i < steps.length; i++) {
      if (_isDisposed) return;

      steps[i].status = StepStatus.inProgress;
      update([SequentialLoader.updateId]);

      if (onStep != null) {
        await onStep!(i);
      } else {
        await Future<void>.delayed(stepDuration);
      }

      if (_isDisposed) return;

      steps[i].status = StepStatus.completed;
      update([SequentialLoader.updateId]);
    }

    if (_isDisposed) return;

    isAllCompleted = true;
    _isRunning = false;
    update([SequentialLoader.updateId]);
    onCompleted?.call();
  }

  /// Reset the sequential loader
  Future<void> reset() async {
    _isRunning = false;
    isAllCompleted = false;
    for (final step in steps) {
      step.status = StepStatus.pending;
    }
    update([SequentialLoader.updateId]);
    await start();
  }
}
