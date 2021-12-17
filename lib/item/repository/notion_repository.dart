import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notion_api/item/key.dart';
import 'package:notion_api/item/model/todo.dart';

final notionProvider = FutureProvider<List<Todo>?>((ref) async {
  final fetch = await NotionRepository().fetchNotion();
  if (fetch != null) {
    return fetch;
  }
});

class NotionRepository {
  Future<List<Todo>?> fetchNotion() async {
    try {
      final url = 'https://api.notion.com/v1/databases/$databaseId/query';
      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Authorization": "Bearer " + apikey,
          "Notion-Version": "2021-08-16"
        },
      );
      if (response.statusCode == 200) {
        return responseConvert(response.body.toString());
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  List<Todo>? responseConvert(String response) {
    final List notionData = jsonDecode(response)['results'];
    final List<Todo>? todoList =
        notionData.map((e) => Todo.fromJson(_jsonParse(e))).toList();

    return todoList;
  }

  Map<String, dynamic> _jsonParse(Map<String, dynamic> map) {
    final _item = map['properties'];
    Map<String, dynamic> items = {
      'title': _item['title']?['title']?[0]?['plain_text'] ?? 'error',
      'datetime': _item['datetime']?['date']?['start'] ?? '${DateTime.now()}',
      'tag': _item['tag']?['multi_select']?[0]?['name'] ?? 'error',
      'url': map['url'] ?? 'https://www.google.com/'
    };
    return items;
  }
}
