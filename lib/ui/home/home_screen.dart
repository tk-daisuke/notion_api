import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notion_api/ui/home_view_model.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notion = ref.watch(notionProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('data'),
            SafeArea(
              child: notion.when(
                data: (data) {
                  return data != null
                      ? ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return SingleChildScrollView(
                              child: Row(
                                children: [
                                  Text('$index'),
                                  Text(data[index].title),
                                  Text(data[index].tag),
                                  Text(data[index].datetime.toString()),
                                ],
                              ),
                            );
                          },
                        )
                      : const Text('no data');
                },
                error: (e, stack) => Text(e.toString()),
                loading: () => const CircularProgressIndicator(),
              ),
            ),
            // ElevatedButton(
            //     onPressed: () {
            //       final model = ref.watch(homeViewProvider.notifier);
            //       model.getNotion();
            //     },
            //     child: const Text('get'))
          ],
        ),
      ),
    );
  }
}
