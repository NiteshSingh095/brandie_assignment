import 'package:brandie/core/constants/translation_utils.dart';
import 'package:brandie/models/smart_post/smart_post.dart';
import 'package:brandie/res/res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SmartPostMusicRow extends StatelessWidget {
  const SmartPostMusicRow({super.key, required this.music});

  final MusicInfoModel music;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Dimens.edgeInsetsSymmetric(horizontal: Dimens.sixteen),
      child: Row(
        children: [
          Icon(Icons.music_note, color: Colors.white, size: Dimens.eighteen),
          Dimens.boxWidth(Dimens.six),
          Expanded(
            child: Text(
              '${TranslationUtils.recommendedPrefix.tr} ${music.label}',
              style: TextStyle(
                color: Colors.white,
                fontSize: Dimens.thirteen,
                fontWeight: FontWeight.w600,
                shadows: const [Shadow(blurRadius: 4, color: Colors.black54)],
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
