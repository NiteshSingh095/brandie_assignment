import 'package:brandie/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShareAndWinView extends StatelessWidget {
  const ShareAndWinView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(TranslationUtils.shareAndWin.tr));
  }
}
