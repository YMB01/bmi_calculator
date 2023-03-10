import 'dart:math';

class CalculatorBrain {
  final int weight;
  final int height;
  CalculatorBrain({required this.height, required this.weight});
  late double _bmi;
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OverWeight';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UnderWeight';
    }
  }
  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have higher than normal body weight. Try to exercise more ';
    } else if (_bmi > 18.5) {
      return 'You have normal body weight. Good Job';
    } else {
      return 'You have lower than normal body weight. try to eat a bit more';
    }
  }
}
