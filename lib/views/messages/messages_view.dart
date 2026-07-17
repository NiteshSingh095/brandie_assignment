import 'package:brandie/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(TranslationUtils.messages.tr));
  }
}
