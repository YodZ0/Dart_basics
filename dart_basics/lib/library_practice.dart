import 'dart:math'; // используется в задании 2

// задание 1
class DelimetersCalculator {

  int nod(int x, int y) {
    x = x.abs();
    y = y.abs();
    while (x != y) {
      if ((x == 0) | (y == 0)) {
        if (x > y) {
          return x;
        }
        else {
          return y;
        }
      }
      if (x > y) {
        x -= y;
      }
      else {
        y -= x;
      }
    }
    return x;
  }

  int nod3(int x, int y, int z) {
    return nod(nod(x, y), z);
  }

  int nod4(int x, int y, int z, int k) {
    return nod(nod(nod(x, y), z), k);
  }

  int nok(int x, int y) {
    double res = 0;
    x = x.abs();
    y = y.abs();
    if (nod(x,y) != 0) {
      res = (x*y)/nod(x,y);
      return res.toInt();
    }
    else {
      return 0;
    }
  }

  int nok3(int x, int y, int z) {
    return nok(nok(x, y), z);
  }

  int nok4(int x, int y, int z, int k) {
    return nok(nok(nok(x, y), z), k);
  }

  List simplify(num x) {
    int i = 2;
    List list = <num>[];
    x = x.abs();
    if (x == 0) {
      list.add(0);
      return list;
    }
    while (x != 1) {
      if (x % i == 0) {
        x = x / i;
        list.add(i);
      }
      else {
        i++;
      }
    }
    return list;
  }
}

// задание 2
class Converter {

  List convertToBin(num number){
    num i = 0;
    List list = [];
    if (number == 0) {
      return [0];
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
    return list.reversed.toList();
  }

  num convertToBinRec(num number) {
    if (number == 0) {
      return 0;
    }
    return (number % 2 + 10*convertToBinRec(number ~/ 2));
  }

  num convertToDec(int number){
    String numStr = number.toString();
    numStr = numStr.split('').reversed.join('');
    num sum = 0;
    for (int i = 0; i < numStr.length; i++) {
      sum += int.parse(numStr[i]) * pow(2, i);
    }
    return sum;
  }
}

//задание 3
class NumFinder {

  List findNums (String str) {
    List list = str.split(' ');
    List res = [];
    for (var i in list) {
      if (num.tryParse(i) == null) {
        continue;
      }
      res.add(num.tryParse(i));
    }
    return res;
  }
}

// задание 4
class CountWords {

  Map contWords (String str) {
    List exceptions =
    ['', ' ', '=', '-', '+', ':', '/', '*', '(', ')',
    '1', '2', '3', '4', '5', '6', '7', '8', '9', '0',
    '_', '?', ',', '.', '@', '#', '№', '%', '^', '<',
    '>', '!', '`', '~'];

    List list = str.split(' ');
    List clearList = [];

    for (var word in list) {
      String newWord = '';
      for (var char in word.split('')) {
        if (exceptions.contains(char)) {
          continue;
        }
        newWord += char;
      }
      clearList.add(newWord);
    }
    clearList.removeWhere((e) => exceptions.contains(e));

    Map dict = {};
    for (var word in clearList) {
      if (num.tryParse(word) != null) {
        continue;
      }
      if (dict.containsKey(word)) {
        dict[word] += 1;
      }
      else {
        dict[word] = 1;
      }
    }
    return dict;
  }
}

// задание 5
class TextToNumber {

  String _cleanStr (String str) {
    List exceptions =
      ['=', '-', '+', ':', '/', '*', '(', ')',
      '1', '2', '3', '4', '5', '6', '7', '8', '9', '0',
      '_', '?', ',', '.', '@', '#', '№', '%', '^', '<',
      '>', '!', '`', '~'];

    String newStr = str;

    for (var ex in exceptions) {
      newStr = newStr.replaceAll(ex, '');
    }
    return newStr;
  }

  Set textToNum(String str) {
    str = _cleanStr(str);
    str = str.toLowerCase();

    Map <String, int> nums = {
      'one': 1,
      'two': 2,
      'three': 3,
      'four': 4,
      'five': 5,
      'six': 6,
      'seven': 7,
      'eight': 8,
      'nine': 9,
      'zero': 0
    };
    
    List list = str.split(' ');
    Set<int?> set = {};

    for (var item in list) {
      if (nums.containsKey(item)) {
        set.add(nums[item]);
      }
    }
    return set;
  }
}

// задание 6
class Point {
  int x, y, z;

  Point(this.x, this.y, this.z);

  factory Point.zero() {
    return Point(0, 0, 0);
  }

  factory Point.one() {
    return Point(1, 1, 1);
  }

  num distanceTo(Point anotherPoint,int eps) {
    num res, dx, dy, dz;
    String len;

    if (eps > 20) {
      eps = 20;
    } else if (eps < 0) {
      eps = 0;
    }

    dx = anotherPoint.x - x;
    dy = anotherPoint.y - y;
    dz = anotherPoint.z - z;
    res = sqrt(dx*dx + dy*dy + dz*dz);
    len = res.toStringAsFixed(eps);
    return double.parse(len);
  }
}

// задание 7
extension Power on num {
  num powN(int n) {
    var res = this;
    if (n < 0) {
      n = n.abs();
      for (int i = 1; i < n; i++) {
      res *= this;
      }
      return 1 / res;
    } else {
      for (int i = 1; i < n; i++) {
      res *= this;
      }
      return res;
    }
  }

  num findRootN(int n, double eps){
    if (n == 0) {
      return 1;
    } else if (n == 1) {
      return this;
    }

    if (this < 0) {
      throw Exception('Корень из отрицательного значения');
    } else {
      num x0 = this / n;
      num xp, xn;
      num diff = 1;

      xp = x0;
      while (diff >= eps) {
        xn = (1/n)*((n-1)*xp + this/xp.powN(n-1));
        diff = xp - xn;
        xp = xn;
      }
      return xp;
    }
  }
}

class User {
  String userName = '';
  String email = '';

  User(this.userName, this.email);

  List info() {
    return [userName, email];
  }
}

class _Aboba {
  String getMailSystem(GeneralUser user) {
    return user.email.split('@')[1];
  }

  GeneralUser createUser(String name, String email) {
    return GeneralUser(name, email);
  }
}

class AdminUser extends User with _Aboba {
  AdminUser(String userName, String email) : super(userName, email);
}

class GeneralUser extends User {
  GeneralUser(String userName, String email) : super(userName, email);
}

class UserManager <T extends User> {

  Map<String, String> users = {};

  void addUser(User user) {
    users[user.userName] = user.email;
  }

  void removeUser(User user) {
    if (users.containsKey(user.userName)) {
      users.remove(user.userName);
    }
  }

  Map<String, String> getUserList() {
    return users;
  }

  Set<String> getUsersEmail() {
    Set <String> emails = {};
    users.forEach((key, value) {
      if (key == 'Admin') {
        emails.add(value.split('@')[1]);
      }
      emails.add(value);
    });
    return emails;
  }
}