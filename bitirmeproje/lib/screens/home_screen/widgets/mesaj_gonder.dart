import 'package:bitirmeproje/core/global_providers/auth_state_provider.dart';
import 'package:bitirmeproje/core/models/advert.dart';
import 'package:bitirmeproje/screens/home_screen/widgets/%C4%B0lan/providers/ilanlar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SendMessageScreen extends ConsumerStatefulWidget {
  final Advert advert;
  const SendMessageScreen({super.key, required this.advert});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SendMessageScreenState();
}

class _SendMessageScreenState extends ConsumerState<SendMessageScreen> {
  late TextEditingController _messageController;

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Mesaj Gönder'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: TextField(
                controller: _messageController,
                decoration: const InputDecoration(
                  hintText: 'Mesajınızı buraya yazın...',
                  border: OutlineInputBorder(),
                ),
                maxLines: null,
                keyboardType: TextInputType.multiline,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement message send functionality
                Map<String, dynamic> message = {
                  "message": _messageController.text,
                  "date": DateTime.now(),
                  "sender": ref.read(authStateProvider)?.uid,
                  "advert": widget.advert.id,
                  "advertiserId": widget.advert.advertiserId
                };
                ref.read(ilanlarProvider.notifier).sendMessage(message);
              },
              child: const Text('Gönder'),
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.amberAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
