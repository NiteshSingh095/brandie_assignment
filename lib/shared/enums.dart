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
        OriHomeTabEnum.smartPost => 'Smart Post',
        OriHomeTabEnum.library => 'Library',
        OriHomeTabEnum.communities => 'Communities',
        OriHomeTabEnum.shareAndWin => 'Share & Win',
      };
}

/// Sequential loader step status
enum StepStatus { pending, inProgress, completed }
