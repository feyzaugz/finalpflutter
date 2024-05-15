import 'package:bitirmeproje/core/models/announcement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/announcements_provider.dart';

class DuyurularScreen extends ConsumerWidget {
  const DuyurularScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Announcement> announcements = ref.watch(announcementsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Duyurular"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: announcements.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.announcement, color: Colors.yellow),
              title: Text(announcements[index].title),
              subtitle: Text(announcements[index].date.toString()),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(announcements[index].title),
                      content: Text(announcements[index].description),
                      actions: <Widget>[
                        TextButton(
                          child: const Text("Kapat"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
