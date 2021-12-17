import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:notion_api/item/repository/notion_repository.dart';

import '../../data/notion_dummy_response.dart';

void main() {
  final notion = NotionRepository();

  group('fetch', () {
    late final dummyResponse = responseTodo;
    test('return entity', () async {
      final fetch = await notion.fetchNotion();
      expect(fetch, dummyResponse);
    });
  });

  group('responseConvert', () {
    // test('return null', () async {
    //   // final loadNotion = ;
    //   expect(notion.responseConvert('error'), isNull);
    // });
    test('return entity', () {
      final jsonData = jsonEncode(notionDummyResponse);
      final data = notion.responseConvert(jsonData);
      expect(data, isNotNull);
      expect(data![0].title, '掃除');
      expect(data[1].tag, 'tag2');
      expect(data[2].datetime, DateTime.parse('2021-11-21 00:00:00.000'));
    });
  });
}
      // final dateTime = DateTime.parse(loadNotion![2].datetime.toString());
      // expect(loadNotion[0].title, '掃除');
      // expect(loadNotion[1].tag, 'tag2');
      // expect(dateTime, DateTime(2021, 11, 21));