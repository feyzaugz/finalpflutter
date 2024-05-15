import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class YeniZiyaretciKaydiScreen extends StatefulWidget {
  const YeniZiyaretciKaydiScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _YeniZiyaretciKaydiScreenState createState() => _YeniZiyaretciKaydiScreenState();
}

class _YeniZiyaretciKaydiScreenState extends State<YeniZiyaretciKaydiScreen> {
  TextEditingController dateInput = TextEditingController();
  TextEditingController timeInput = TextEditingController();
  
  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    timeInput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yeni Ziyaretçi Kaydı"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Daire',
                hintText: 'C4-45 (Hüseyin Can Aydın)',
              ),
            ),
            TextFormField(
              controller: dateInput,
              decoration: const InputDecoration(
                icon: Icon(Icons.calendar_today),
                labelText: "Beklenen Giriş Tarihi",
              ),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate); 
                  setState(() {
                    dateInput.text = formattedDate;
                  });
                }
              },
            ),
            TextFormField(
              controller: timeInput,
              decoration: const InputDecoration(
                icon: Icon(Icons.access_time),
                labelText: "Beklenen Giriş Saati",
              ),
              onTap: () async {
                TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (pickedTime != null) {
                  setState(() {
                    timeInput.text = pickedTime.format(context);
                  });
                }
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Araç Plakası',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Açıklama',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save the new visitor record
              },
              child: const Text('Kaydet'),
            ),
          ],
        ),
      ),
    );
  }
}
