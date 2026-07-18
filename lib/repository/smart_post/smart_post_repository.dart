import 'dart:convert';

import 'package:brandie/models/smart_post/smart_post.dart';
import 'package:flutter/services.dart';

class SmartPostRepository {
  static const String _assetPath = 'assets/data/smart_posts.json';

  Future<List<SmartPostModel>> fetchPosts() async {
    try {
      final raw = await rootBundle.loadString(_assetPath);
      final decoded = jsonDecode(raw) as Map<String, dynamic>;
      final posts = decoded['posts'];
      
      if (posts is! List) return const [];
      return posts.whereType<Map<String, dynamic>>().map(SmartPostModel.fromJson).toList();
    } catch (error) {
      return [];
    }
  }
}
