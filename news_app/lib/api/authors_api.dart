import 'package:http/http.dart' as http;
import 'dart:convert';

// import base api link
import '../util/api_util.dart';

import 'package:news_app/models/author.dart';

class AuthorAPI {
  String allAuthorApiUrl = base_api + all_author_api_url;

  Future< List<Author> > fetchAllAuthor() async {
    try {
      List<Author> authors = [];
      var response = await http.get(allAuthorApiUrl);
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        var data = jsonData['data'];

        for (var item in data) {
          Author author = Author(item['id'].toString(), item['name'].toString(), item['email'].toString(), item['avatar'].toString());
          authors.add(author);
        }
        return authors;
      }
    } catch (err) {
      print(err);
    }
  }
}
