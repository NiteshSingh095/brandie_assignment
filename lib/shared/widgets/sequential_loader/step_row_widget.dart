import 'package:brandie/res/dimens.dart';
import 'package:brandie/shared/enums.dart';
import 'package:brandie/shared/widgets/sequential_loader/sequential_icon_widget.dart';
import 'package:flutter/material.dart';

/// Step row widget
class StepRow extends StatelessWidget {
  const StepRow({super.key, required this.label, required this.status, required this.accentColor});

  final String label;
  final StepStatus status;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    final isPending = status == StepStatus.pending;
    final textColor = isPending ? const Color(0xFFA0A0A0) : Colors.black;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        StatusIcon(status: status, accentColor: accentColor),
        Dimens.boxWidth(Dimens.twelve),
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: Dimens.fifteen,
              fontWeight: FontWeight.w400,
              color: textColor,
            ),
          ),
        ),
      ],
    );
  }
}
