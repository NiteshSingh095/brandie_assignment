import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherUtility {
  const UrlLauncherUtility._();

  /// Launch URL
  static Future<void> launch(String? url) async {
    try {
      if (url == null || url.trim().isEmpty) return;

      final uri = Uri.tryParse(url.trim());
      if (uri == null) {
        debugPrint('Invalid URL: $url');
        return;
      }

      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        debugPrint('Could not launch $url');
      }
    } catch (error) {
      debugPrint('Error launching URL: $error');
    }
  }
}
