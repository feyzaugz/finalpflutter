import 'package:bitirmeproje/core/services/firestore_service.dart';
import 'package:bitirmeproje/screens/guests_screen/providers/guests_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class YeniZiyaretciKaydiScreen extends StatefulWidget {
  const YeniZiyaretciKaydiScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _YeniZiyaretciKaydiScreenState createState() =>
      _YeniZiyaretciKaydiScreenState();
}

class _YeniZiyaretciKaydiScreenState extends State<YeniZiyaretciKaydiScreen> {
  TextEditingController dateInput = TextEditingController();
  TextEditingController timeInput = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _daire;
  String? _plaka;
  String? _aciklama;
  DateTime? _date;
  TimeOfDay? _time;

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    timeInput.text = "";
    super.initState();
  }

  @override
  void dispose() {
    dateInput.dispose();
    timeInput.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yeni Ziyaretçi Kaydı"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Daire',
                  hintText: 'C4-45 (Hüseyin Can Aydın)',
                ),
                validator: inputValidator,
                onSaved: (v) {
                  _daire = v;
                },
              ),
              TextFormField(
                controller: dateInput,
                decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_today),
                  labelText: "Beklenen Giriş Tarihi",
                ),
                onTap: () async {
                  _date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (_date != null) {
                    String formattedDate =
                        DateFormat('dd/MM/yyyy').format(_date!);
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
                  _time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (_time != null) {
                    setState(() {
                      timeInput.text = _time!.format(context);
                    });
                  }
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Araç Plakası',
                ),
                validator: inputValidator,
                onSaved: (v) {
                  _plaka = v;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Açıklama',
                ),
                onSaved: (v) {
                  _aciklama = v;
                },
              ),
              const SizedBox(height: 20),
              Consumer(builder: (context, ref, _) {
                return ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      if (_date != null && _time != null) {
                        DateTime date = DateTime(_date!.year, _date!.month,
                            _date!.day, _time!.hour, _time!.minute);
                        Map<String, dynamic> guest = {
                          "apartment": _daire,
                          "date": date,
                          "plaka": _plaka,
                          "explanation": _aciklama
                        };

                        bool result = await ref
                            .read(guestsProvider.notifier)
                            .addGuest(guest);

                        if (result && context.mounted) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog.adaptive(
                              title: const Text('Başarılı'),
                              content:
                                  const Text("Ziyaretci başarıyla kaydedildi."),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Ok'),
                                )
                              ],
                            ),
                          );
                        }
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Eksik Bilgi'),
                            content:
                                const Text('Tarih ve saat boş bırakılamaz'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Ok'),
                              )
                            ],
                          ),
                        );
                      }
                    }
                  },
                  child: const Text('Kaydet'),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  String? inputValidator(String? value) {
    if (value == null) {
      return "Zorunlu alan.";
    } else {
      if (value.isEmpty) {
        return "Zorunlu alan.";
      } else {
        return null;
      }
    }
  }
}
