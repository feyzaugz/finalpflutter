import 'package:flutter/material.dart';

class IlanCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const IlanCard({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Card(
        margin: const EdgeInsets.only(bottom: 8.0),
        child: ListTile(
          leading: Icon(icon, color: Theme.of(context).primaryColor),
          title: Text(title),
          trailing: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              // İlanı kaldırma işlevi
            },
          ),
        ),
      ),
    );
  }
}
