import 'dart:math';

class Point {
  int x, y, z;

  Point(this.x, this.y, this.z);

  factory Point.zero() {
    return Point(0, 0, 0);
  }

  factory Point.one() {
    return Point(1, 1, 1);
  }

  num distanceTo(Point anotherPoint,int round) {
    num res, dx, dy, dz;
    String len;

    if (round > 20) {
      round = 20;
    } else if (round < 0) {
      round = 0;
    }

    dx = anotherPoint.x - x;
    dy = anotherPoint.y - y;
    dz = anotherPoint.z - z;
    res = sqrt(dx*dx + dy*dy + dz*dz);
    len = res.toStringAsFixed(round);
    return double.parse(len);
  }
}