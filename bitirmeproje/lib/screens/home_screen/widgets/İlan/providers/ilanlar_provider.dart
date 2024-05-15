import 'package:bitirmeproje/core/models/advert.dart';
import 'package:bitirmeproje/core/repositories/firestore_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ilanlar_provider.g.dart';

@Riverpod(keepAlive: true)
class Ilanlar extends _$Ilanlar {
  @override
  List<Advert> build() {
    getAdverts();
    return [];
  }

  Future<void> getAdverts() async {
    state = await ref.read(firestoreRepositoryProvider).getAdverts();
  }
}
