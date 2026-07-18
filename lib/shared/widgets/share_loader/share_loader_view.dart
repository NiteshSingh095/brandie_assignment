import 'package:brandie/controller/share_loader/share_loader.dart';
import 'package:brandie/res/res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShareLoader extends StatelessWidget {
  const ShareLoader({
    super.key,
    required this.steps,
    this.stepDuration = const Duration(milliseconds: 900),
    this.onStep,
    this.onCompleted,
  });

  static const String updateId = 'share_loader';

  final List<String> steps;
  final Duration stepDuration;
  final Future<void> Function(int index)? onStep;
  final VoidCallback? onCompleted;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: Dimens.edgeInsetsSymmetric(horizontal: Dimens.forty),
      child: GetBuilder<ShareLoaderController>(
        init: ShareLoaderController(
          steps: steps,
          stepDuration: stepDuration,
          onStep: onStep,
          onCompleted: onCompleted,
        ),
        global: false,
        id: updateId,
        builder: (controller) {
          final previousProgress = controller.currentIndex / steps.length;

          return Container(
            width: double.infinity,
            padding: Dimens.edgeInsetsSymmetric(
              horizontal: Dimens.thirtyTwo,
              vertical: Dimens.thirtyTwo,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Dimens.ten),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: Dimens.forty,
                  height: Dimens.forty,
                  child: const CircularProgressIndicator(
                    strokeWidth: 6,
                    color: Color(0xFF91DCBA),
                    backgroundColor: Color(0xFFE5F2EC),
                  ),
                ),
                Dimens.boxHeight(Dimens.sixteen),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: Text(
                    controller.currentLabel,
                    key: ValueKey(controller.currentIndex),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF999999),
                      fontSize: Dimens.fourteen,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Dimens.boxHeight(Dimens.sixteen),
                ClipRRect(
                  borderRadius: BorderRadius.circular(Dimens.ten),
                  child: TweenAnimationBuilder<double>(
                    key: ValueKey(controller.currentIndex),
                    tween: Tween(
                      begin: previousProgress,
                      end: controller.progress,
                    ),
                    duration: stepDuration,
                    builder: (context, value, child) {
                      return LinearProgressIndicator(
                        value: value,
                        minHeight: Dimens.eight,
                        color: const Color(0xFF91DCBA),
                        backgroundColor: const Color(0xFFE5F2EC),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
