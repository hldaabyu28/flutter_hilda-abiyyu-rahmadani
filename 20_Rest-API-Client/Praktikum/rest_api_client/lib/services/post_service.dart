import 'package:dio/dio.dart';


import '../models/post_model.dart';

class PostService {
  final Dio _dio = Dio();

  Future<Post> fetchPost(int id) async {
    final response = await _dio.get(
      'https://jsonplaceholder.typicode.com/posts/$id',
    );

    if (response.statusCode == 200) {
      return Post.fromJson(response.data);
    } else {
      throw Exception('Failed to fetch post');
    }
  }

  Future<void> updatePost(Post post) async {
    try {
      final response = await _dio.put(
        'https://jsonplaceholder.typicode.com/posts/${post.id}',
        data: post.toJson(),
      );

      print(response.data);

      if (response.statusCode == 200) {
        print('Post updated successfully');
      } else {
        print('Failed to update post: ${response.statusCode}');
      }
    } on DioError catch (e) {
      print('Error updating post: ${e.message}');
    }
  }
}
