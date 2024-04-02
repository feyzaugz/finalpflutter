import 'package:flutter/material.dart';

class DebtCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        title: Text('Borcunuz'),
        subtitle: Text('2.560,21 TL',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0)),
        trailing: ElevatedButton(
          onPressed: () {
            // Ödeme yapma işlevi
          },
          child: Text('Ödeme Yap'),
          style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
        ),
      ),
    );
  }
}
