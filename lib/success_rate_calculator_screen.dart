import 'package:flutter/material.dart';
import 'success_rate_calculator.dart';

class SuccessRateCalculatorScreen extends StatelessWidget {
  const SuccessRateCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'حساب نسبة النجاح',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const SuccessRateCalculator(),
    );
  }
}
