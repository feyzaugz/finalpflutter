import 'package:flutter/material.dart';

class AyricalikCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData iconData;
  final String imagePath;

  const AyricalikCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.iconData,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.stretch, // Kart içindeki içeriği genişlet
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Image.asset(
              '',
              fit: BoxFit.cover, // Resmi kaplayacak şekilde ayarla
            ),
          ),
          ListTile(
            leading: Icon(iconData, size: 20),
            title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(subtitle),
          ),
        ],
      ),
    );
  }
}
