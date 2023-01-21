import 'dart:math';

class Converter {

  String convertToBin(int number){
    num i = 0;
    List list = [];
    bool isNegative = false;
    String result;

    if (number == 0) {
      return '0';
    }
    if (number < 0) {
      isNegative = true;
      number = number.abs();
    }
    while (number / 2 > 0) {
      if (number / 2 == 1) {
        list.add(0);
        list.add(1);
        break;
      }
      i = number % 2;
      number ~/= 2;
      list.add(i);
    }

    list = list.reversed.toList();
    result = list.join('');

    if (isNegative) {
      return '-$result';
    }
    
    return result;
  }

  // не работает с отрицательными числами
  String convertToBinRec(int number) {
    if (number == 0) {
      return 0.toString();
    }
    return (number % 2 + 10*int.parse(convertToBinRec(number ~/ 2))).toString();
  }

  int convertToDec(String number) {
    List<String> list = ['-', '0', '1'];
    List<String> numList = number.split('');
    String numStr;
    num sum = 0;
    bool isNegative = false;

    for (var i in numList) {
      if (list.contains(i)) {
        continue;
      } else {
        throw 'Число должно состоять из знаков: (-, 0, 1)';
      }
    }
    
    if (numList.contains('-')) {
      if (numList[0] == '-') {
        isNegative = true;
        numList.remove('-');
      } else {
        throw 'Знак (-) не в начале числа';
      }
    }
    numStr = numList.reversed.join('');
    
    for (int i = 0; i < numStr.length; i++) {
        sum += int.parse(numStr[i]) * pow(2, i);
    }

    if (isNegative) {
      sum *= -1;
    }
    return sum.toInt();
  }
}