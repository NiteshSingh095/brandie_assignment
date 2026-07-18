import 'music_info_model.dart';
import 'product_info_model.dart';

class SmartPostModel {
  const SmartPostModel({
    required this.id,
    required this.backgroundImage,
    required this.profileImage,
    required this.statusBadge,
    required this.communityLine,
    this.product,
    this.music,
    required this.caption,
    this.referralCode,
    this.referralLink,
    this.sharePlatforms = const [],
  });

  final String id;
  final String backgroundImage;
  final String profileImage;
  final String statusBadge;
  final String communityLine;
  final ProductInfoModel? product;
  final MusicInfoModel? music;
  final String caption;
  final String? referralCode;
  final String? referralLink;
  final List<String> sharePlatforms;

  factory SmartPostModel.fromJson(Map<String, dynamic> json) {
    final productJson = json['product'];
    final musicJson = json['music'];
    final platforms = json['share_platforms'];

    return SmartPostModel(
      id: json['id'] as String? ?? '',
      backgroundImage: json['background_image'] as String? ?? '',
      profileImage: json['profile_image'] as String? ?? '',
      statusBadge: json['status_badge'] as String? ?? '',
      communityLine: json['community_line'] as String? ?? '',
      product: productJson is Map<String, dynamic>
          ? ProductInfoModel.fromJson(productJson)
          : null,
      music: musicJson is Map<String, dynamic>
          ? MusicInfoModel.fromJson(musicJson)
          : null,
      caption: json['caption'] as String? ?? '',
      referralCode: json['referral_code'] as String? ?? '',
      referralLink: json['referral_link'] as String? ?? '',
      sharePlatforms: platforms is List
          ? platforms.map((e) => e.toString()).toList()
          : const [],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'background_image': backgroundImage,
        'profile_image': profileImage,
        'status_badge': statusBadge,
        'community_line': communityLine,
        'product': product?.toJson(),
        'music': music?.toJson(),
        'caption': caption,
        'referral_code': referralCode,
        'referral_link': referralLink,
        'share_platforms': sharePlatforms,
      };

  SmartPostModel copyWith({String? caption}) {
    return SmartPostModel(
      id: id,
      backgroundImage: backgroundImage,
      profileImage: profileImage,
      statusBadge: statusBadge,
      communityLine: communityLine,
      product: product,
      music: music,
      caption: caption ?? this.caption,
      referralCode: referralCode,
      referralLink: referralLink,
      sharePlatforms: sharePlatforms,
    );
  }
}
