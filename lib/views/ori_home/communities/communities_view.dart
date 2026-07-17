import 'package:brandie/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommunitiesView extends StatelessWidget {
  const CommunitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(TranslationUtils.communities.tr));
  }
}
