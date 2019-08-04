import 'package:http/http.dart' as http;
import 'package:news_app/models/category.dart';
import 'dart:convert';

import '../util/api_util.dart';

class CategoriesApi {
   String allCategoryApiUrl = baseApi + allCategoryApiUrlApp;

  Future<List<Category>> fetchAllCategory() async {
    List<Category> categories = [];
    try {
      var response = await http.get(allCategoryApiUrl);
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        var data = jsonData['data'];
        for (var item in data) {
          Category category = Category(item['id'].toString(), item['title'].toString());
          categories.add(category);
        }
      }
    } catch (err) {
      print(err);
    }
    return categories;
  }
}