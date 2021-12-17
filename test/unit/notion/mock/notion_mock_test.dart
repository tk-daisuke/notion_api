import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:notion_api/item/model/todo.dart';
import 'package:notion_api/item/repository/notion_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../data/notion_dummy_response.dart';
import 'notion_mock_test.mocks.dart';

// flutter pub run build_runner build
@GenerateMocks([NotionRepository])
void main() {
  // final notion = NotionRepository();
  final mock = MockNotionRepository();

  group('fetch', () {
    // final dummyData = notionDummyResponse;
    test('return null', () async {
      when(mock.fetchNotion()).thenAnswer((_) async => null);
      verifyNever(mock.fetchNotion());
      var fetch = await mock.fetchNotion();
      expect(fetch, isNull);
      verify(mock.fetchNotion());
    });
    test('return entity', () async {
      when(mock.fetchNotion()).thenAnswer((_) async => returnTodo);

      var fetch = await mock.fetchNotion();
      expect(fetch, returnTodo);
      verify(mock.fetchNotion());
    });
  });

  group('responseLoad', () {
    final jsonData = jsonEncode(notionDummyResponse);
    test('return null', () async {
      when(mock.responseConvert(jsonData)).thenReturn(null);

      final loadNotion = mock.responseConvert(jsonData);
      expect(loadNotion, isNull);
      verify(mock.responseConvert(jsonData));
    });
    test('return entity', () {
      when(mock.responseConvert(jsonData)).thenReturn(returnTodo);
      final loadNotion = mock.responseConvert(jsonData);
      expect(loadNotion![0].title, returnTodo[0].title);
      expect(loadNotion[1].tag, returnTodo[1].tag);
      expect(loadNotion[0].datetime, returnTodo[0].datetime);
      verify(mock.responseConvert(jsonData));
    });
  });
}
      // final dateTime = DateTime.parse(loadNotion![2].datetime.toString());
      // expect(loadNotion[0].title, '掃除');
      // expect(loadNotion[1].tag, 'tag2');
      // expect(dateTime, DateTime(2021, 11, 21));