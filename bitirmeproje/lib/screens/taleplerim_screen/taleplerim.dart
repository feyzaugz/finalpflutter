import 'package:flutter/material.dart';

import 'yeni_talep.dart';

class TaleplerimScreen extends StatefulWidget {
  static const String routeName = "/taleplerim";
  const TaleplerimScreen({super.key});

  @override
  State<TaleplerimScreen> createState() => _TaleplerimScreenState();
}

class _TaleplerimScreenState extends State<TaleplerimScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Taleplerim"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Yeni talep ekleme sayfasına yönlendirme işlemi

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const YeniTalepScreen()),
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ToggleButtons(
              isSelected: const [true, false],
              onPressed: (int index) {
                // Toggle button state değişikliği
              },
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text("Güncel"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text("Tamamlanmış"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text(
                    "Taleplerinizle ilgili son güncellemeleri haber vermeyi ister misiniz?",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          // Sonra Karar Ver butonu işlevi
                        },
                        child: const Text("Sonra Karar Ver"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Evet, isterim butonu işlevi
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        child: const Text("Evet, İsterim"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Image.asset("assets/images/communication.png"),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Yönetiminiz ile iletişime geçin. Talep, öneri ve şikayetlerinizi yönetiminize buradan iletebilirsiniz.",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const YeniTalepScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: const Text(
                "Yeni Talep",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
