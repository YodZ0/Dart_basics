class NumFinder {

  List<num> findNums (String str) {
    List<String> list = str.split(' ');
    List<num> res = [];
    for (String i in list) {
      if (num.tryParse(i) == null) {
        continue;
      }
      res.add(num.parse(i));
    }
    return res;
  }
}