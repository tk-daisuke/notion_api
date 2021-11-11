import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:notion_api/item/repository/notion_repository.dart';

import '../data/notion_dummy_response.dart';

void main() {
  final notion = NotionRepository();

  test('notion test', () {
    final jsonData = jsonEncode(notionDummyResponse);
    final loadNotion = notion.responseLoad(jsonData);
    final dateTime = DateTime.parse(loadNotion![2].datetime.toString());
    expect(loadNotion[0].title, '掃除');
    expect(loadNotion[1].tag, 'tag2');
    expect(dateTime, DateTime(2021, 11, 21));
  });
}
