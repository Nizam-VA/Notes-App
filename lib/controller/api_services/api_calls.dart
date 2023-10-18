import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:posts_api/model/post_model.dart';

class ApiCalls {
  static String baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<PostModel>> fetchAllPost() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final postsList = jsonDecode(response.body) as List<dynamic>;
        List<PostModel> posts = [];
        for (int i = 0; i < postsList.length; i++) {
          final post = PostModel.fromJson(postsList[i] as Map<String, dynamic>);
          posts.add(post);
        }
        return posts;
      } else {
        return [];
      }
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<bool> addPost(PostModel post) async {
    Map<String, dynamic> data = {
      'title': post.title,
      'body': post.body,
      'userId': '20'
    };

    try {
      final response = await http.post(Uri.parse(baseUrl), body: data);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        print('data inserted successfully');
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<bool> updatePost(PostModel post) async {
    Map<String, dynamic> data = {
      'title': post.title,
      'body': post.body,
    };

    try {
      final response =
          await http.put(Uri.parse('$baseUrl/${post.id}'), body: data);
      print(response.statusCode);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<bool> deletePost(int id) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/$id'));
      print(response.statusCode);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        print('data deleted successfully');
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
