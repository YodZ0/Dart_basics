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