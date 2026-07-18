class MusicInfoModel {
  const MusicInfoModel({required this.label});

  final String label;

  factory MusicInfoModel.fromJson(Map<String, dynamic> json) {
    return MusicInfoModel(label: json['label'] as String? ?? '');
  }

  Map<String, dynamic> toJson() => {'label': label};
}
