import 'package:brandie/models/smart_post/smart_post.dart';
import 'package:brandie/repository/smart_post/smart_post.dart';

class SmartPostViewModel {
  SmartPostViewModel({SmartPostRepository? repository})
      : _repository = repository ?? SmartPostRepository();

  final SmartPostRepository _repository;

  Future<List<SmartPostModel>> fetchPosts() {
    return _repository.fetchPosts();
  }
}
