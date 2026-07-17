import 'package:brandie/controller/sequential_loader/sequential_loader.dart';
import 'package:brandie/res/res.dart';
import 'package:brandie/shared/widgets/sequential_loader/step_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SequentialLoader extends StatelessWidget {
  const SequentialLoader({
    super.key,
    required this.title,
    required this.steps,
    this.completionMessage = '',
    this.stepDuration = const Duration(milliseconds: 1200),
    this.onStep,
    this.onCompleted,
    this.accentColor = const Color(0xFF4CAF50),
  });

  static const String updateId = 'sequential_loader';

  final String title;
  final List<String> steps;
  final String completionMessage;
  final Duration stepDuration;
  final Future<void> Function(int index)? onStep;
  final VoidCallback? onCompleted;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SequentialLoaderController>(
      init: SequentialLoaderController(
        stepLabels: steps,
        stepDuration: stepDuration,
        onStep: onStep,
        onCompleted: onCompleted,
      ),
      global: false,
      id: updateId,
      builder: (controller) {
        return Padding(
          padding: Dimens.edgeInsetsSymmetric(horizontal: Dimens.twentyFour),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Dimens.boxHeight(Dimens.forty),
              Text(
                title,
                style: TextStyle(
                  fontSize: Dimens.twentyTwo,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  height: 1.3,
                ),
              ),
              Dimens.boxHeight(Dimens.thirtyTwo),
              ...List.generate(controller.steps.length, (index) {
                final step = controller.steps[index];
                return Padding(
                  padding: Dimens.edgeInsets(bottom: Dimens.twenty),
                  child: StepRow(label: step.label, status: step.status, accentColor: accentColor),
                );
              }),
              if (controller.isAllCompleted && completionMessage.isNotEmpty) ...[
                Dimens.boxHeight(Dimens.eight),
                Text(
                  completionMessage,
                  style: TextStyle(
                    fontSize: Dimens.sixteen,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
