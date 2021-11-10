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
        final List json = jsonDecode(response.toString())['results'];
        final List<Todo>? todoList = json.map((e) {
          final items = _jsonSerial(e);
          return Todo.fromJson(items);
        }).toList();
        print(todoList);
        return todoList;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  Map<String, dynamic> _jsonSerial(Map<String, dynamic> map) {
    final _item = map['properties'];
    Map<String, dynamic> items = {
      'title': _item['title']['title'][0]['plain_text'],
      'datetime': _item['datetime']['date']['start'],
      'tag': _item['tag']['multi_select'][0]['name']
    };
    return items;
  }
}


        //             final Map<String, dynamic> json =
        //     jsonDecode(response.toString())['results'][0]['properties'];
        // Map<String, dynamic> items = {
        //   'title': json['title']['title'][0]['plain_text'],
        //   'datetime': json['datetime']['date']['start'],
        //   'tag': json['tag']['multi_select'][0]['name']
        // };

        // final todo = Todo.fromJson(items);