import 'package:flutter/material.dart';

class DuyurularScreen extends StatelessWidget {
  // static const String routeName = "/duyurular-screen";
  const DuyurularScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> announcements = [
      {"title": "Yoga dersi hakkında", "date": "04 May 2024", "detail": "Değerli site sakinlerimiz, 05.05.2024 tarihinde planlanan yoga dersi iptal edilmiştir."},
      {"title": "Sosyal tesis kapalı havuz analizi hakkında", "date": "29 Nis 2024", "detail": "Sayın Site Sakinlerimiz, ..."},
      {"title": "Basketbol, Futbol Sahaları ve Çocuk Parkları", "date": "04 Nis 2024", "detail": "Basketbol, futbol sahalarımız ve çocuk parklarımızın kullanım saatleri hakkında."},
      {"title": "2024 Yılı İşletme Bütçesi", "date": "26 Mar 2024", "detail": "Sayın Site Sakinlerimiz, 2024 yılı işletme bütçesi ve açıklama metinleri ektedir."},
    ];

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
              title: Text(announcements[index]["title"]),
              subtitle: Text(announcements[index]["date"]),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(announcements[index]["title"]),
                      content: Text(announcements[index]["detail"]),
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
