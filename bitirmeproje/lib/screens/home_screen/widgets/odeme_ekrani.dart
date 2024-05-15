import 'package:bitirmeproje/core/global_providers/user_state_provider.dart';
import 'package:bitirmeproje/core/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _currentStep = 0;

  void _onStepContinue() {
    if (_currentStep < 2) {
      setState(() {
        _currentStep++;
      });
    }
  }

  void _onStepCancel() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final user = ref.watch(userStateProvider)!;
      return Scaffold(
        appBar: AppBar(
          title: const Text('Ödeme'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Stepper(
              currentStep: _currentStep,
              onStepContinue: _onStepContinue,
              onStepCancel: _onStepCancel,
              onStepTapped: (step) {
                setState(() {
                  _currentStep = step;
                });
              },
              steps: _buildSteps(user),
            ),
            // Buradan sonra ekstradan kartlar ve butonlar ekleniyor:
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Card(
                child: ListTile(
                  title: Text('Konya Meram - Feyza Uğuz'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                child: Column(
                  children: [
                    ListTile(
                      title: const Text('Ödeme Bilgileri'),
                      subtitle: Column(
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: true, // Checkbox durumu
                                onChanged: (bool? value) {
                                  // Checkbox işlevi
                                },
                              ),
                              const Expanded(child: Text('C4-45')),
                              const Text('0,00 TL'), // Örnek bir tutar
                            ],
                          ),
                          // Diğer borç ve ödeme bilgileri...
                        ],
                      ),
                    ),
                    const Divider(height: 1),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Toplam'),
                          Text('0,00 TL'), // Örnek bir toplam tutar
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () async {
                  if (_currentStep < 2) {
                    setState(() {
                      _currentStep++;
                    });
                  }

                  bool result =
                      await ref.read(userStateProvider.notifier).payDebt();

                  if (result && context.mounted) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog.adaptive(
                        title: const Text('Başarılı'),
                        content: const Text('Borcunuz Başarılı şekilde ödendi'),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            child: const Text("Geri Dön"),
                          )
                        ],
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text('Devam Et'),
              ),
            ),
          ],
        ),
      );
    });
  }

  List<Step> _buildSteps(AppUser user) {
    return [
      Step(
        title: const Text('Özet'),
        content: Text('${user.debt}₺ borcunuz bulunmaktadır.'),
        isActive: _currentStep == 0,
        state: _currentStep > 0 ? StepState.complete : StepState.indexed,
      ),
      Step(
        title: const Text('Ödeme Bilgileri'),
        content: const Text('Ödeme bilgileri içeriği burada.'),
        isActive: _currentStep == 1,
        state: _currentStep > 1 ? StepState.complete : StepState.indexed,
      ),
      Step(
        title: const Text('Onay'),
        content: const Text('Onay içeriği burada.'),
        isActive: _currentStep == 2,
        state: _currentStep == 2 ? StepState.complete : StepState.indexed,
      ),
    ];
  }
}
