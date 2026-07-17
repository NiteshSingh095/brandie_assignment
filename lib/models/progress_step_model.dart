import 'package:brandie/shared/enums.dart';

class ProgressStepModel {
  final String label;
  StepStatus status;

  ProgressStepModel({
    required this.label,
    this.status = StepStatus.pending,
  });
}
