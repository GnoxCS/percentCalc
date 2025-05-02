import 'package:flutter/material.dart';
import 'success_rate_calculator_screen.dart';

void main() => runApp(const StudentSuccessApp());

class StudentSuccessApp extends StatelessWidget {
  const StudentSuccessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'حساب نسبة النجاح',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, fontFamily: 'Roboto'),
      home: const SuccessRateCalculatorScreen(),
    );
  }
}
