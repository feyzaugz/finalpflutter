import 'package:bitirmeproje/core/models/privilege.dart';
import 'package:bitirmeproje/core/repositories/firestore_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'privileges_provider.g.dart';

@Riverpod(keepAlive: true)
class Privileges extends _$Privileges {
  @override
  List<Privilege> build() {
    getPrivileges();

    return [];
  }

  Future<void> getPrivileges() async {
    state = await ref.read(firestoreRepositoryProvider).getPrivileges();
  }
}
