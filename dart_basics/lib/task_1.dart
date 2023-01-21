class DelimetersCalculator {
  
  // НОД двух чисел
  int nod(int x, int y) {
    x = x.abs();
    y = y.abs();
    while (x != y) {
      if ((x == 0) || (y == 0)) {
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

  // НОД трех чисел
  int nod3(int x, int y, int z) {
    return nod(nod(x, y), z);
  }

  // НОД четырех чисел
  int nod4(int x, int y, int z, int k) {
    return nod(nod(nod(x, y), z), k);
  }

  // НОК двух чисел
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

  // НОК двух чисел
  int nok3(int x, int y, int z) {
    return nok(nok(x, y), z);
  }

  // НОК двух чисел
  int nok4(int x, int y, int z, int k) {
    return nok(nok(nok(x, y), z), k);
  }

  // Дробление числа на простые множители
  List simplify(int x) {
    int i = 2;
    List list = <num>[];
    x = x.abs();
    if (x == 0) {
      list.add(0);
      return list;
    }
    while (x != 1) {
      if (x % i == 0) {
        x = x ~/ i;
        list.add(i);
      }
      else {
        i++;
      }
    }
    return list;
  }
}