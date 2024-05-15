import 'package:bitirmeproje/core/global_providers/auth_state_provider.dart';
import 'package:bitirmeproje/core/models/advert.dart';
import 'package:bitirmeproje/screens/home_screen/widgets/%C4%B0lan/providers/ilanlar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IlanOlusturScreen extends StatefulWidget {
  const IlanOlusturScreen({super.key});

  @override
  State<IlanOlusturScreen> createState() => _IlanOlusturScreenState();
}

class _IlanOlusturScreenState extends State<IlanOlusturScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _title;
  String? _description;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("İlan Oluştur"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                onSaved: (v) {
                  _title = v;
                },
                validator: (v) {
                  if (v == null) {
                    return "Zorunlu Alan";
                  } else {
                    if (v.isEmpty) {
                      return "Zorunlu Alan";
                    } else {
                      return null;
                    }
                  }
                },
                decoration: const InputDecoration(
                  labelText: "Başlık",
                  hintText: "Başlık giriniz",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                onSaved: (v) {
                  _description = v;
                },
                validator: (v) {
                  if (v == null) {
                    return "Zorunlu Alan";
                  } else {
                    if (v.isEmpty) {
                      return "Zorunlu Alan";
                    } else {
                      return null;
                    }
                  }
                },
                decoration: const InputDecoration(
                  labelText: "Açıklama",
                  hintText: "Açıklama giriniz",
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                // onSaved: (v) {
                //   v = _description;
                // },
                // validator: (v) {
                //   if (v == null) {
                //     return "Zorunlu Alan";
                //   } else {
                //     if (v.isEmpty) {
                //       return "Zorunlu Alan";
                //     } else {
                //       return null;
                //     }
                //   }
                // },
                decoration: const InputDecoration(
                  labelText: "Ad Soyad",
                  hintText: "Adınızı ve soyadınızı giriniz",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24.0),
              Consumer(builder: (context, ref, _) {
                return ElevatedButton(
                  onPressed: () async {
                    // Burada ilan yayınlama işlevi gerçekleştirilecek
                    // Şimdilik basit bir onay mesajı göster

                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      Advert newAdvert = Advert(
                          title: _title!,
                          icon: "gamepad",
                          category: "Teknoloji",
                          saleType: "Ürün Satışı",
                          date: DateTime.now(),
                          price: 0,
                          location: "İzmir",
                          status: "Güncel",
                          description: _description!,
                          advertiserId: ref.read(authStateProvider)!.uid);

                      bool result = await ref
                          .read(ilanlarProvider.notifier)
                          .createNewAdvert(newAdvert);
                      if (result && context.mounted) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("Başarılı"),
                            content:
                                const Text("İlanınız başarıyla yayınlandı!"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(); // Dialog'u kapat
                                },
                                child: const Text("Tamam"),
                              ),
                            ],
                          ),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: Text("Yayınla"),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
