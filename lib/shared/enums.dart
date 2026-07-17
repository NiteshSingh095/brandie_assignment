import 'package:brandie/core/constants/translation_utils.dart';

/// Bottom navigation enum
enum BottomNavigationEnum {
  notification,
  search,
  oriHome,
  messages,
  profile,
}

/// Ori home tab enum
enum OriHomeTabEnum {
  smartPost,
  library,
  communities,
  shareAndWin;

  String get label => switch (this) {
        OriHomeTabEnum.smartPost => TranslationUtils.smartPost,
        OriHomeTabEnum.library => TranslationUtils.library,
        OriHomeTabEnum.communities => TranslationUtils.communities,
        OriHomeTabEnum.shareAndWin => TranslationUtils.shareAndWin,
      };
}

/// Sequential loader step status
enum StepStatus { pending, inProgress, completed }
