import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'input_field.dart';

class SuccessRateCalculator extends StatefulWidget {
  const SuccessRateCalculator({super.key});

  @override
  _SuccessRateCalculatorState createState() => _SuccessRateCalculatorState();
}

class _SuccessRateCalculatorState extends State<SuccessRateCalculator> {
  final TextEditingController _totalStudentsController =
      TextEditingController();
  final TextEditingController _failedStudentsController =
      TextEditingController();
  String _result = '';
  double _successRate = 0.0;

  void _calculateSuccessRate() {
    final total = _totalStudentsController.text.trim();
    final failed = _failedStudentsController.text.trim();
    if (total.isEmpty || failed.isEmpty) {
      setState(() => _result = 'يرجى إدخال جميع الحقول');
      return;
    }
    try {
      final totalStudents = int.parse(_convertToEnglishNumbers(total));
      final failedStudents = int.parse(_convertToEnglishNumbers(failed));
      if (totalStudents <= 0 ||
          failedStudents < 0 ||
          failedStudents > totalStudents) {
        setState(() => _result = 'المدخلات غير صحيحة');
        return;
      }
      _successRate = ((totalStudents - failedStudents) / totalStudents) * 100;
      FocusScope.of(context).unfocus();
      setState(() {
        _result = 'نسبة النجاح: ${_successRate.round()}%';
        _totalStudentsController.clear();
        _failedStudentsController.clear();
      });
    } catch (_) {
      setState(() => _result = 'يرجى إدخال أرقام صحيحة');
    }
  }

  String _convertToEnglishNumbers(String input) {
    const arabicToEnglish = {
      '٠': '0',
      '١': '1',
      '٢': '2',
      '٣': '3',
      '٤': '4',
      '٥': '5',
      '٦': '6',
      '٧': '7',
      '٨': '8',
      '٩': '9',
    };
    return input.split('').map((char) => arabicToEnglish[char] ?? char).join();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF2196F3), Color(0xFF64B5F6)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'أدخل البيانات لحساب نسبة النجاح',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    InputField(
                      controller: _totalStudentsController,
                      labelText: 'عدد الطلاب المشاركين',
                      icon: Icons.group,
                      iconColor: Colors.blue,
                    ),
                    const SizedBox(height: 20),
                    InputField(
                      controller: _failedStudentsController,
                      labelText: 'عدد الطلاب الراسبين',
                      icon: Icons.error,
                      iconColor: Colors.red,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF007AFF),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: _calculateSuccessRate,
                      child: const Text(
                        'احسب النسبة',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'النتيجة:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SelectableText(
                      _result,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color:
                            _successRate < 50
                                ? Colors.red
                                : _successRate >= 60 && _successRate <= 79
                                ? const Color.fromARGB(255, 246, 222, 3)
                                : _successRate > 80
                                ? Colors.green
                                : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
