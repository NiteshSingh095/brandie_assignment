import 'package:brandie/shared/widgets/sequential_loader/sequential_loader.dart';
import 'package:flutter/material.dart';

class SmartPostView extends StatelessWidget {
  const SmartPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SequentialLoader(
      title: 'Building personalised Smart Posts for you!',
      steps: [
        'Preparing popular content for you',
        'Crafting a caption to boost engagement',
        'Adding your personal referral link and code',
        'Finding trending songs on other social media',
      ],
      completionMessage: 'All set! Get ready to share...',
    );
  }
}
