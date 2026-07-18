import 'package:brandie/controller/edit_caption/edit_caption.dart';
import 'package:brandie/core/constants/translation_utils.dart';
import 'package:brandie/res/res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditCaptionView extends StatelessWidget {
  const EditCaptionView({super.key});

  static const String updateId = EditCaptionController.updateId;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditCaptionController>(
      id: EditCaptionController.updateId,
      builder: (controller) {
        final canSave = controller.canSave;

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: editCaptionAppBar(controller, canSave),
          body: Padding(
            padding: Dimens.edgeInsetsSymmetric(horizontal: Dimens.twenty, vertical: Dimens.twelve),
            child: TextField(
              controller: controller.textController,
              autofocus: false,
              maxLines: null,
              expands: true,
              textAlignVertical: TextAlignVertical.top,
              style: TextStyle(
                color: Colors.black,
                fontSize: Dimens.sixteen,
                fontWeight: FontWeight.w400,
                height: 1.4,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        );
      },
    );
  }

  /// edit caption app bar
  PreferredSizeWidget editCaptionAppBar(EditCaptionController controller, bool canSave) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      leading: IconButton(
        onPressed: controller.onCloseTap,
        icon: Icon(Icons.close, size: Dimens.twentyFour, color: Colors.black),
      ),
      title: Text(
        TranslationUtils.editCaption.tr,
        style: TextStyle(
          color: Colors.black,
          fontSize: Dimens.eighteen,
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: [
        Padding(
          padding: Dimens.edgeInsets(right: Dimens.twelve),
          child: TextButton(
            onPressed: canSave ? controller.onSaveTap : null,
            style: TextButton.styleFrom(
              backgroundColor: canSave
                  ? const Color(0xFF4CAF50)
                  : const Color(0xFF4CAF50).withValues(alpha: 0.35),
              disabledBackgroundColor: const Color(0xFF4CAF50).withValues(alpha: 0.35),
              foregroundColor: Colors.white,
              disabledForegroundColor: Colors.white,
              padding: Dimens.edgeInsetsSymmetric(
                horizontal: Dimens.sixteen,
                vertical: Dimens.eight,
              ),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimens.twenty)),
            ),
            child: Text(
              TranslationUtils.save.tr,
              style: TextStyle(fontSize: Dimens.fourteen, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ],
    );
  }
}
