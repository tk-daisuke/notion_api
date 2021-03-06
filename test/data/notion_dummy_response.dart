import 'package:notion_api/item/model/todo.dart';

const notionDummyResponse = {
  "object": "list",
  "results": [
    {
      "object": "page",
      "id": "1f1f1b83-302d-4e15-af2c-0bcba18624cf",
      "created_time": "2021-11-09T08:10:00.000Z",
      "last_edited_time": "2021-11-09T15:55:00.000Z",
      "cover": null,
      "icon": null,
      "parent": {"type": "database_id", "database_id": "dummy"},
      "archived": false,
      "properties": {
        "datetime": {
          "id": "C%60xf",
          "type": "date",
          "date": {"start": "2021-11-05", "end": null}
        },
        "tag": {
          "id": "%5DVPM",
          "type": "multi_select",
          "multi_select": [
            {"id": "dummy", "name": "すぐやる", "color": "red"}
          ]
        },
        "title": {
          "id": "title",
          "type": "title",
          "title": [
            {
              "type": "text",
              "text": {"content": "掃除", "link": null},
              "annotations": {
                "bold": false,
                "italic": false,
                "strikethrough": false,
                "underline": false,
                "code": false,
                "color": "default"
              },
              "plain_text": "掃除",
              "href": null
            }
          ]
        }
      },
      "url": "https://www.notion.so/1f1f1b83302d4e15af2c0bcba18624cf"
    },
    {
      "object": "page",
      "id": "dummy",
      "created_time": "2021-11-09T08:10:00.000Z",
      "last_edited_time": "2021-11-09T15:55:00.000Z",
      "cover": null,
      "icon": null,
      "parent": {"type": "database_id", "database_id": "dummy"},
      "archived": false,
      "properties": {
        "datetime": {
          "id": "C%60xf",
          "type": "date",
          "date": {"start": "2021-10-06", "end": null}
        },
        "tag": {
          "id": "%5DVPM",
          "type": "multi_select",
          "multi_select": [
            {"id": "dummy", "name": "tag2", "color": "brown"}
          ]
        },
        "title": {
          "id": "title",
          "type": "title",
          "title": [
            {
              "type": "text",
              "text": {"content": "洗濯", "link": null},
              "annotations": {
                "bold": false,
                "italic": false,
                "strikethrough": false,
                "underline": false,
                "code": false,
                "color": "default"
              },
              "plain_text": "洗濯",
              "href": null
            }
          ]
        }
      },
      "url": "https://www.notion.so/b7f856ba88ac4cb8a917beb0584170b4"
    },
    {
      "object": "page",
      "id": "dummy",
      "created_time": "2021-11-09T08:10:00.000Z",
      "last_edited_time": "2021-11-09T15:55:00.000Z",
      "cover": null,
      "icon": null,
      "parent": {"type": "database_id", "database_id": "dummy"},
      "archived": false,
      "properties": {
        "datetime": {
          "id": "C%60xf",
          "type": "date",
          "date": {"start": "2021-11-21", "end": null}
        },
        "tag": {
          "id": "%5DVPM",
          "type": "multi_select",
          "multi_select": [
            {"id": "dummy", "name": "後", "color": "blue"}
          ]
        },
        "title": {
          "id": "title",
          "type": "title",
          "title": [
            {
              "type": "text",
              "text": {"content": "料理", "link": null},
              "annotations": {
                "bold": false,
                "italic": false,
                "strikethrough": false,
                "underline": false,
                "code": false,
                "color": "default"
              },
              "plain_text": "料理",
              "href": null
            }
          ]
        }
      },
      "url": "https://www.notion.so/edae18fc30454c26be28c9f23249d2fc"
    }
  ],
  "next_cursor": null,
  "has_more": false
};

final returnTodo = <Todo>[
  Todo(
      title: 'title',
      tag: 'tag',
      datetime: DateTime(1992, 11, 13, 11, 10, 1, 1, 1),
      url: 'url'),
  Todo(
      title: 'e',
      tag: 'egawegewa',
      datetime: DateTime(2022, 11, 11, 2, 20, 2, 2, 2),
      url: 'url')
];

final responseTodo = <Todo>[
  Todo(
      title: '掃除',
      tag: 'すぐやる',
      datetime: DateTime.parse('2021-11-05 00:00:00.000'),
      url: 'https://www.notion.so/1f1f1b83302d4e15af2c0bcba18624cf'),
  Todo(
      title: '洗濯',
      tag: 'tag2',
      datetime: DateTime.parse('2021-10-06 00:00:00.000'),
      url: 'https://www.notion.so/b7f856ba88ac4cb8a917beb0584170b4'),
  Todo(
      title: '料理',
      tag: '後',
      datetime: DateTime.parse('2021-11-21 00:00:00.000'),
      url: 'https://www.notion.so/edae18fc30454c26be28c9f23249d2fc')
];
