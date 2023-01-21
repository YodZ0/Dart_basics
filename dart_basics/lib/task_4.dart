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
