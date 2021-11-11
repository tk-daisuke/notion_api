// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Todo _$$_TodoFromJson(Map<String, dynamic> json) => _$_Todo(
      title: json['title'] as String,
      tag: json['tag'] as String,
      datetime: DateTime.parse(json['datetime'] as String),
      url: json['url'] as String,
    );

Map<String, dynamic> _$$_TodoToJson(_$_Todo instance) => <String, dynamic>{
      'title': instance.title,
      'tag': instance.tag,
      'datetime': instance.datetime.toIso8601String(),
      'url': instance.url,
    };
