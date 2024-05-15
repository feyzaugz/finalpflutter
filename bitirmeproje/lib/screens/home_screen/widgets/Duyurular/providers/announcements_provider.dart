import 'package:bitirmeproje/core/models/announcement.dart';
import 'package:bitirmeproje/core/repositories/firestore_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'announcements_provider.g.dart';

@Riverpod(keepAlive: true)
class Announcements extends _$Announcements {
  @override
  List<Announcement> build() {
    getAnnouncement();

    return [];
  }

  Future<void> getAnnouncement() async {
    state = await ref.read(firestoreRepositoryProvider).getAnnouncement();
  }
}
