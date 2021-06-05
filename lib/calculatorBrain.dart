import 'dart:math';

class CalculatorBrain {

  CalculatorBrain({required this.weight , required this.height}) ;


  final int height ;
  final int weight ;

  late double _answer ;

  String calculateBMI() {


    double heightM = height / 100 ;
    _answer = (weight) / pow(heightM, 2) ;


    return _answer.toStringAsFixed(2) ;
  }
  String getResults(){


    if(_answer >= 25){
      return "Overweight" ;
    } else if (_answer > 18.5) {
      return "Normal" ;
    }
    else {
      return "Underweight" ;
    }

  }

  String getInterpretation() {
    if(_answer >= 25){
      return "You Have A Higher Than Normal Body Weight\nTry Exercise More" ;
    } else if (_answer < 18.5) {
      return "You Have Normal Body Weight\nGood Job" ;
    }
    else {
      return "Your BMI Score Is Low\nYou Should Eat More" ;
    }
  }



}