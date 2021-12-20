import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeViewProvider = ChangeNotifierProvider((ref) => HomeViewModel());


class HomeViewModel extends ChangeNotifier {
  // Future<void> getNotion() async {
  //   final NotionRepository notionRepository = NotionRepository();
  //   await notionRepository.fetchNotion();
  //   notifyListeners();
  // }
}
