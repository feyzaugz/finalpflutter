import 'package:bitirmeproje/core/models/guest.dart';
import 'package:bitirmeproje/screens/Diger%20Ekran/ziyaretci_ekle.dart';
import 'package:bitirmeproje/screens/guests_screen/providers/guests_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ZiyaretciKaydiScreen extends ConsumerWidget {
  const ZiyaretciKaydiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final guests = ref.watch(guestsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ziyaretçi Kaydı"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const YeniZiyaretciKaydiScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: guests.isEmpty ? buildNoGuest() : buildGuestList(guests),
    );
  }

  Widget buildGuestList(List<Guest> guests) {
    return ListView.separated(
      itemCount: guests.length,
      itemBuilder: (context, index) => Card(
        child: ListTile(
          title: Text("Daire: ${guests[index].apartment}"),
          subtitle: Text(
            DateFormat('yyyy-MM-dd hh:mm').format(guests[index].date),
          ),
        ),
      ),
      separatorBuilder: (context, index) => const Divider(),
    );
  }

  Widget buildNoGuest() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset(
                'assets/images/ziyaretci.jpg'), // Ensure this image asset exists
          ),
          const Text(
            "Ziyaretçi Kaydı Bulunmuyor.",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            "Kayıt bulunamadı.",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
