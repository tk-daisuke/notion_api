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
      // print(response);

      if (response.statusCode == 200) {
        final List json = _jsonDecode(response);
        final List<Todo>? todoList =
            json.map((e) => Todo.fromJson(_jsonSerial(e))).toList();
        print(todoList);
        return todoList;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  _jsonDecode(Response<dynamic> response) =>
      jsonDecode(response.toString())['results'];

  Map<String, dynamic> _jsonSerial(Map<String, dynamic> map) {
    final _item = map['properties'];
    print(map['url']);
    Map<String, dynamic> items = {
      'title': _item['title']['title'][0]['plain_text'],
      'datetime': _item['datetime']['date']['start'],
      'tag': _item['tag']['multi_select'][0]['name'],
      'url': map['url']
    };
    return items;
  }
}
