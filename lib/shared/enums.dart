enum BottomNavigationEnum {
  notification,
  search,
  oriHome,
  messages,
  profile,
}

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
