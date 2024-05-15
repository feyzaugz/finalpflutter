import 'package:bitirmeproje/core/models/announcement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../duyurular/duyurular_tumu.dart';
import 'providers/announcements_provider.dart';

class DuyurularSection extends ConsumerWidget {
  const DuyurularSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Announcement> announcements = ref.watch(announcementsProvider);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Duyurular',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DuyurularScreen()),
                  );
                },
                child: const Text('TÜMÜ'),
              ),
            ],
          ),
        ),

        if (announcements.isNotEmpty)
          ListTile(
            leading:
                const Icon(Icons.campaign, color: Colors.orange, size: 32.0),
            title: Text(announcements.first.title),
            subtitle: Text(announcements.first.description),
            trailing: ElevatedButton(
              onPressed: () {
                // Duyuru detaylarına git
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.orange,
                // primary: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: const Text('DUYURU'),
            ),
          ),
        // Daha fazla ListTile duyuruları ekleyebilirsiniz.
      ],
    );
  }
}
