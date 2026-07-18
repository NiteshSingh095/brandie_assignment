import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:social_sharing_plus/social_sharing_plus.dart';

class SocialShareUtility {
  const SocialShareUtility._();

  static SocialPlatform? platformFrom(String platform) {
    return switch (platform.toLowerCase()) {
      'facebook' => SocialPlatform.facebook,
      'twitter' => SocialPlatform.twitter,
      'linkedin' => SocialPlatform.linkedin,
      'whatsapp' => SocialPlatform.whatsapp,
      'telegram' => SocialPlatform.telegram,
      'reddit' => SocialPlatform.reddit,
      _ => null,
    };
  }

  static Future<bool> share({
    required String platform,
    required String content,
    String? mediaAssetPath,
  }) async {
    final socialPlatform = platformFrom(platform);
    if (socialPlatform == null) {
      debugPrint('Unsupported share platform: $platform');
      return false;
    }

    try {
      String? mediaPath;
      if (mediaAssetPath != null && mediaAssetPath.isNotEmpty) {
        mediaPath = await _assetToTempFile(mediaAssetPath);
      }

      await SocialSharingPlus.shareToSocialMedia(
        socialPlatform,
        content,
        media: mediaPath,
        isOpenBrowser: true,
      );
      return true;
    } on PlatformException catch (error, stackTrace) {
      debugPrint('Platform error sharing to $platform: ${error.message}');
      debugPrintStack(stackTrace: stackTrace);
      return false;
    } catch (error, stackTrace) {
      debugPrint('Failed to share to $platform: $error');
      debugPrintStack(stackTrace: stackTrace);
      return false;
    }
  }

  static Future<String?> _assetToTempFile(String assetPath) async {
    try {
      final bytes = await rootBundle.load(assetPath);
      final tempDir = await getTemporaryDirectory();
      final fileName = assetPath.split('/').last;
      final file = File('${tempDir.path}/$fileName');
      await file.writeAsBytes(bytes.buffer.asUint8List());
      return file.path;
    } catch (error, stackTrace) {
      debugPrint('Failed to prepare media for sharing: $error');
      debugPrintStack(stackTrace: stackTrace);
      return null;
    }
  }
}
