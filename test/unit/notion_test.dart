import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:notion_api/item/model/todo.dart';
import 'package:notion_api/item/repository/notion_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'notion_test.mocks.dart';
import '../data/notion_dummy_response.dart';

// flutter pub run build_runner build
@GenerateMocks([NotionRepository])
void main() {
  // final notion = NotionRepository();
  final mock = MockNotionRepository();

  group('fetch', () {
    test('return null', () async {
      when(mock.fetchNotion()).thenAnswer((_) async => null);
      var get = await mock.fetchNotion();
      expect(get, isNull);
    });
    test('return entity', () async {
      final _list = <Todo>[
        Todo(
            title: 'title',
            tag: 'tag',
            datetime: DateTime(1992, 11, 13, 11, 10),
            url: 'url'),
      ];
      when(mock.fetchNotion()).thenAnswer((_) async => _list);
      var get = await mock.fetchNotion();
      expect(get, _list);
    });
  });
  test('notion test', () {
    final jsonData = jsonEncode(notionDummyResponse);
    final loadNotion = mock.responseLoad(jsonData);
    final dateTime = DateTime.parse(loadNotion![2].datetime.toString());
    expect(loadNotion[0].title, '掃除');
    expect(loadNotion[1].tag, 'tag2');
    expect(dateTime, DateTime(2021, 11, 21));
  });
}
