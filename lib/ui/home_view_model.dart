import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notion_api/item/model/todo.dart';
import 'package:notion_api/item/repository/notion_repository.dart';

final homeViewProvider = ChangeNotifierProvider((ref) => HomeViewModel());
final notionProvider = FutureProvider<List<Todo>?>((ref) async {
  final _notionRepository = NotionRepository();
  final notion = await _notionRepository.fetchNotion();
  return notion;
});
class HomeViewModel extends ChangeNotifier {
  Future<void> getNotion() async {
    final NotionRepository notionRepository = NotionRepository();
    await notionRepository.fetchNotion();
    notifyListeners();
  }
}
