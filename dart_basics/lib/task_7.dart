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
    if (eps <= 0) {
      eps = 0.000001;
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