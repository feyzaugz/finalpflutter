import 'package:bitirmeproje/core/global_providers/auth_state_provider.dart';
import 'package:bitirmeproje/core/models/request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/requests_provider.dart';

class YeniTalepScreen extends StatefulWidget {
  const YeniTalepScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _YeniTalepScreenState createState() => _YeniTalepScreenState();
}

class _YeniTalepScreenState extends State<YeniTalepScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _subject;
  late String _apartment;
  String? _requestType;
  late String _description;

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yeni Talep'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Konu',
                  border: OutlineInputBorder(),
                ),
                onSaved: (v) {
                  _subject = v!;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Daire',
                  border: OutlineInputBorder(),
                ),
                onSaved: (v) {
                  _apartment = v!;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField(
                items: [
                  'Arıza',
                  'Soru',
                  'Öneri',
                  'Şikayet',
                  'İstek/Talep',
                  'Memnuniyet',
                  'Diğer'
                ].map((String category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (String? value) {
                  _requestType = value!;
                },
                decoration: const InputDecoration(
                  labelText: 'İstek Tipi',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Açıklama',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                onSaved: (v) {
                  _description = v!;
                },
              ),
              const SizedBox(height: 16),
              Consumer(builder: (context, ref, _) {
                return ElevatedButton.icon(
                  icon: const Icon(Icons.save),
                  label: const Text('Kaydet'),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      if (_requestType == null) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog.adaptive(
                            title: const Text("Eksik Bilgi"),
                            content: const Text('İstek tipi boş bırakılamaz.'),
                            actions: [
                              TextButton(
                                child: const Text('Ok'),
                                onPressed: () => Navigator.pop(context),
                              )
                            ],
                          ),
                        );
                        return;
                      }

                      Request request = Request(
                          subject: _subject,
                          apartment: _apartment,
                          requestType: _requestType!,
                          description: _description,
                          requester: ref.read(authStateProvider)!.uid);

                      bool result = await ref
                          .read(requestsProvider.notifier)
                          .addNewRequest(request);

                      if (result && context.mounted) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog.adaptive(
                            title: const Text("Başarılı"),
                            content: const Text(
                                'Talebiniz başarılı şekilde oluşturuldu. En kısa sürede size dönüş yapılacaktır.'),
                            actions: [
                              TextButton(
                                child: const Text('Ok'),
                                onPressed: () => Navigator.pop(context),
                              )
                            ],
                          ),
                        );
                      }
                    }
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
