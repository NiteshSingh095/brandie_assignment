import 'package:brandie/res/dimens.dart';
import 'package:brandie/shared/enums.dart';
import 'package:flutter/material.dart';

/// Status icon widget
class StatusIcon extends StatelessWidget {
  const StatusIcon({super.key, required this.status, required this.accentColor});

  final StepStatus status;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    final size = Dimens.twentyFour;

    return switch (status) {
      StepStatus.pending => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFFC0C0C0), width: Dimens.one),
        ),
      ),
      StepStatus.inProgress => SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeWidth: Dimens.two,
          valueColor: AlwaysStoppedAnimation<Color>(accentColor),
        ),
      ),
      StepStatus.completed => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(shape: BoxShape.circle, color: accentColor),
        child: Icon(Icons.check, size: Dimens.sixteen, color: Colors.white),
      ),
    };
  }
}
