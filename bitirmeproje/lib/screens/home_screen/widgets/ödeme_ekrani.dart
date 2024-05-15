
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
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
            steps: _buildSteps(),
          ),
          // Buradan sonra ekstradan kartlar ve butonlar ekleniyor:
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Card(
              child: ListTile(
                title: Text(
                    'Konya Meram - Feyza Uğuz'),
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
              onPressed: () {
                if (_currentStep < 2) {
                  setState(() {
                    _currentStep++;
                  });
                }
              },
              child: const Text('Devam Et'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Step> _buildSteps() {
    return [
      Step(
        title: const Text('Özet'),
        content: const Text('Özet içeriği burada.'),
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
