import 'package:bitirmeproje/core/global_providers/user_state_provider.dart';
import 'package:bitirmeproje/screens/hesap_ozeti_screen/providers/cards_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final _formKey = GlobalKey<FormState>();

  late String _cardName;
  late String _cardNumber;
  late String _expirationDate;
  late String _cvv;

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kart Ekle"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Kart Adı',
                  hintText: 'Kart adı giriniz',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onSaved: (v) {
                  _cardName = v!;
                },
                validator: (v) {
                  if (v == null) {
                    return "Bu alan zorunludur";
                  } else {
                    if (v.isEmpty) {
                      return "Bu alan zorunludur";
                    } else {
                      return null;
                    }
                  }
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Kart Numarası',
                  hintText: 'Kart numaranızı giriniz',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onSaved: (v) {
                  _cardNumber = v!;
                },
                validator: (v) {
                  if (v == null) {
                    return "Bu alan zorunludur";
                  } else {
                    if (v.isEmpty) {
                      return "Bu alan zorunludur";
                    } else {
                      return null;
                    }
                  }
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Son Kullanma Tarihi (AA/YY)',
                  hintText: 'MM/YY',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.datetime,
                onSaved: (v) {
                  _expirationDate = v!;
                },
                validator: (v) {
                  if (v == null) {
                    return "Bu alan zorunludur";
                  } else {
                    if (v.isEmpty) {
                      return "Bu alan zorunludur";
                    } else {
                      return null;
                    }
                  }
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'CVV',
                  hintText: 'Kartınızın arka yüzündeki 3 haneli güvenlik kodu',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onSaved: (v) {
                  _cvv = v!;
                },
                validator: (v) {
                  if (v == null) {
                    return "Bu alan zorunludur";
                  } else {
                    if (v.isEmpty) {
                      return "Bu alan zorunludur";
                    } else {
                      return null;
                    }
                  }
                },
              ),
              const SizedBox(height: 30),
              Consumer(builder: (context, ref, _) {
                return ElevatedButton(
                  onPressed: () async {
                    // Burada kart ekleme işlemini gerçekleştir
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Map<String, dynamic> cardDetails = {
                        "cardName": _cardName,
                        "cardNumber": _cardNumber,
                        "expirationDate": _expirationDate,
                        "cvv": _cvv
                      };
                      bool result = await ref
                          .read(cardsProvider.notifier)
                          .addNewCard(
                              cardDetails, ref.read(userStateProvider)!.uid);

                      if (result && context.mounted) {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog.adaptive(
                                  title: const Text('Başarılı'),
                                  content: const Text(
                                      "Kartınız başarılı şekilde kaydedildi"),
                                  actions: [
                                    TextButton(
                                      child: const Text("Geri Dön"),
                                      onPressed: () {
                                        // İşlem tamamlandığında ana ekrana dön
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      },
                                    )
                                  ],
                                ));
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text('Kartı Ekle'),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
