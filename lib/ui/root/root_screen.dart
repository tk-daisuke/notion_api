import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notion_api/ui/database/database_screen.dart';

final bottomIndex = StateProvider<int>((ref) => 0);

class RootScreen extends HookConsumerWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _index = ref.watch(bottomIndex.state);
    const pageWidgets = [
      DatabaseScreen(),
      DatabaseScreen(),
    ];
    
    return Scaffold(
      bottomNavigationBar: const BottomNavigationItems(),
      body: pageWidgets.elementAt(_index.state),
    );
  }
}

class BottomNavigationItems extends HookConsumerWidget {
  const BottomNavigationItems({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _index = ref.watch(bottomIndex.state);

    return BottomNavigationBar(
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      // selectedItemColor: Colors.white,
      // unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: 'データベース',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: 'ホーム',
        ),
      ],
      currentIndex: _index.state,
      onTap: (selectIndex) async {
        _index.state = selectIndex;
      },
    );
  }
}
