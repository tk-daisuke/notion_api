import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:notion_api/item/model/todo.dart';
import 'package:notion_api/item/url_launcher_service.dart';
import 'package:notion_api/ui/home_view_model.dart';

class DatabaseScreen extends HookConsumerWidget {
  const DatabaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notion = ref.watch(notionProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('database'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            notion.when(
              data: (data) {
                return RefreshIndicator(
                  onRefresh: () => ref.refresh(notionProvider.future),
                  child: data != null
                      ? _notionListView(data)
                      : const Text('no data'),
                );
              },
              error: (e, stack) => _error(e, ref),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
            ElevatedButton(
                onPressed: () => ref.refresh(notionProvider),
                child: const Text('RELOAD'))
          ],
        ),
      ),
    );
  }

  ListView _notionListView(List<Todo> data) {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (context, index) {
        final title = data[index].title;
        final tag = data[index].tag;
        final time = DateTime.parse(data[index].datetime.toString());
        final dateFormat = DateFormat('yyyy年\nMM月dd日').format(time);
        final url = data[index].url;

        return InkWell(
          onTap: () => UrlLauncherService().launchURL(url),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(flex: 1, child: Text("$index")),
                  Expanded(
                    flex: 8,
                    child: Row(
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Chip(label: Text(tag)),
                        ),
                      ],
                    ),
                  ),
                  Expanded(flex: 2, child: Text(dateFormat))
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Column _error(Object e, WidgetRef ref) {
    return Column(
      children: [
        Text(e.toString()),
        ElevatedButton(
            onPressed: () => ref.refresh(notionProvider.future),
            child: const Text('reload'))
      ],
    );
  }
}
