import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:notion_api/item/key.dart';
import 'package:notion_api/item/model/todo.dart';

class NotionRepository {
  final _dio = Dio();

  Future<List<Todo>?> fetchNotion() async {
    try {
      final url = 'https://api.notion.com/v1/databases/$databaseId/query';
      final response = await _dio.postUri(Uri.parse(url),
          options: Options(headers: {
            "Authorization": "Bearer " + apikey,
            "Notion-Version": "2021-08-16"
          }));
      if (response.statusCode == 200) {
        return responseLoad(response.toString());
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  List<Todo>? responseLoad(String response) {
    final List notionData = jsonDecode(response)['results'];
    final List<Todo>? todoList =
        notionData.map((e) => Todo.fromJson(_jsonParse(e))).toList();
    return todoList;
  }

  Map<String, dynamic> _jsonParse(Map<String, dynamic> map) {
    final _item = map['properties'];
    Map<String, dynamic> items = {
      'title': _item['title']['title'][0]['plain_text'] ?? '',
      'datetime': _item['dateTime']['date']['start'] ?? '${DateTime.now()}',
      'tag': _item['tag']['multi_select'][0]['name'] ?? 'tag',
      'url': map['url'] ?? 'https://www.google.com/'
    };
    return items;
  }
}
