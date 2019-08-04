import 'package:http/http.dart' as http;
import 'package:news_app/models/post.dart';
import 'dart:convert';

import '../util/api_util.dart';

class PostsApi {
  String allWhatsNewsUrl = baseApi + whatsNewsApp;
  String allRecentUpdatesNews = baseApi + recentUpdatesNewsApp;
  String popularNews = baseApi + popularNewsApp;

  Future<List<Post>> fetchWhatsNews() async {
    List<Post> posts = [];
    try {
      var response = await http.get(allWhatsNewsUrl);
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        var data = jsonData['data'];
        for (var item in data) {
          Post post = Post(
            id: item['id'].toString(),
            title: item['title'].toString(),
            content: item['content'].toString(),
            dateWritten: item['date_written'].toString(),
            featuredImage: item['featured_image'].toString(),
            votesUp: item['vote_up'],
            votesDown: item['vote_down'],
            votersUp: (item['votersUp'] == null)
                ? List<int>()
                : jsonDecode(item['votersUp']),
            votersDown: (item['votersDown'] == null)
                ? List<int>()
                : jsonDecode(item['votersDown']),
            userId: item['user_id'],
            categoryId: item['category_id'],
          );
          posts.add(post);
        }
      }
    } catch (err) {
      print(err);
    }
    return posts;
  }

  Future<List<Post>> fetchRecentUpdatesNews() async {
    List<Post> posts = [];
    try {
      var response = await http.get(allRecentUpdatesNews);
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        var data = jsonData['data'];
        for (var item in data) {
          Post post = Post(
            id: item['id'].toString(),
            title: item['title'].toString(),
            content: item['content'].toString(),
            dateWritten: item['date_written'].toString(),
            featuredImage: item['featured_image'].toString(),
            votesUp: item['vote_up'],
            votesDown: item['vote_down'],
            votersUp: (item['votersUp'] == null)
                ? List<int>()
                : jsonDecode(item['votersUp']),
            votersDown: (item['votersDown'] == null)
                ? List<int>()
                : jsonDecode(item['votersDown']),
            userId: item['user_id'],
            categoryId: item['category_id'],
          );
          posts.add(post);
        }
      }
    } catch (err) {
      print(err);
    }
    return posts;
  }

  Future<List<Post>> fetchPopular() async {
    List<Post> posts = [];
    try {
      var response = await http.get(popularNews);
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        var data = jsonData['data'];
        for (var item in data) {
          Post post = Post(
            id: item['id'].toString(),
            title: item['title'].toString(),
            content: item['content'].toString(),
            dateWritten: item['date_written'].toString(),
            featuredImage: item['featured_image'].toString(),
            votesUp: item['vote_up'],
            votesDown: item['vote_down'],
            votersUp: (item['votersUp'] == null)
                ? List<int>()
                : jsonDecode(item['votersUp']),
            votersDown: (item['votersDown'] == null)
                ? List<int>()
                : jsonDecode(item['votersDown']),
            userId: item['user_id'],
            categoryId: item['category_id'],
          );
          posts.add(post);
        }
      }
    } catch (err) {
      print(err);
    }
    return posts;
  }
}
