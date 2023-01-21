import 'package:dart_basics/task_1.dart';
import 'package:dart_basics/task_2.dart';
import 'package:dart_basics/task_3.dart';
import 'package:dart_basics/task_4.dart';
import 'package:dart_basics/task_5.dart';
import 'package:dart_basics/task_6.dart';
import 'package:dart_basics/task_7.dart';
import 'package:dart_basics/task_8.dart';

void main() {
  /*-------------------Задание 1-------------------*/

  var calculator = DelimetersCalculator();
  print('НОД двух чисед: ${calculator.nod(27, -9)}');
  print('НОД трех чисел: ${calculator.nod3(27, 0, -197)}');
  print('НОД четырех чисел: ${calculator.nod4(27, 0, -199, 216)}');

  print('НОК двух чисел: ${calculator.nok(116, 12)}');
  print('НОК трех чисел: ${calculator.nok3(-121, 182, 216)}');
  print('НОК четырех чисел: ${calculator.nok4(210, 216, 578, 921)}');

  print('Простые множители числа: ${calculator.simplify(783)}');

  /*-------------------Задание 2-------------------*/
  var converter = Converter();
  print(converter.convertToBin(-12345));
  print(converter.convertToBinRec(12345));
  print(converter.convertToDec('-11000000111001'));

  /*-------------------Задание 3-------------------*/
  var finder = NumFinder();
  String str = 
  '''Hello I'm 37 my name is MegaZord 1337 my height 19.1 meters!
  100 % I recommend to watch Rick and Morty 1 2 3 and 777.001 seasons''';
  print(finder.findNums(str));

  /*-------------------Задание 4-------------------*/
  var counter = CountWords();
  print(counter.contWords(str));

  /*-------------------Задание 5-------------------*/
  var numerator = TextToNumber();
  String strWithNums =
  '''This is a string with one or two or 300 word, it could contains
  different numbers or symbols like 1 % 232 three ^^^ <.// five and more.
  But, from this string return only one set with integer numbers!''';
  print(numerator.textToNum(strWithNums));

  /*-------------------Задание 6-------------------*/
  var onePoint = Point.one();
  var zeroPoint = Point.zero();
  var anyPoint = Point(10, -123, 23);

  print(onePoint.distanceTo(anyPoint, 5));
  print(zeroPoint.distanceTo(anyPoint, 3));

  /*-------------------Задание 7-------------------*/
  num number = 12;
  print(number.findRootN(3, 0.00000001));
  print(number.powN(3));

  /*-------------------Задание 8-------------------*/

  var robot = UserManager();
  var admin = AdminUser('Admin', 'aboba@adminmail.com');
  var ivan = GeneralUser('Ivan', 'ivanov@mail.ru');
  var imposter = GeneralUser('HACKER', 'imposter@gmail.ru');
  var igor = GeneralUser('Igor', 'iiiigoooorrr@yandex.ru');
  var olga = GeneralUser('Olyasa', 'instasamka@bigmoney.com');

  var sasha = admin.createUser('Sasha', 'email@mail.ru');

  robot.addUser(admin);
  robot.addUser(ivan);
  robot.addUser(olga);
  robot.addUser(imposter);
  robot.addUser(sasha);
  robot.addUser(igor);

  print(sasha.info());

  print(robot.getUserList());
  print(robot.getUsersEmail());

  robot.removeUser(imposter);
  print(robot.getUserList());
}