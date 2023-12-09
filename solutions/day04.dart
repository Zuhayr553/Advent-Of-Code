import 'dart:math';

import '../utils/index.dart';

class Day04 extends GenericDay {
  Day04() : super(4);

  @override
  List<String> parseInput() {
    return input.getPerLine();
  }

  @override
  int solvePart1() {
    List<String> _input = parseInput();
    List<int> totalPoints = [];
    for (String s in _input) {
      List<List<String>> splitStrings = splitCardString(s);
      List winningNumbers = splitStrings[0];
      List myNumbers = splitStrings[1];
      Set commonElements =
          winningNumbers.toSet().intersection(myNumbers.toSet());
      List<int> parsedInts =
          commonElements.map((e) => int.parse(e.toString())).toList();
      totalPoints.add(parsedInts.isEmpty
          ? 0
          : int.parse(pow(2, parsedInts.length - 1).toString()));
    }

    return totalPoints.reduce((value, element) => value + element);
  }

  List<List<String>> splitCardString(String inputString) {
    // Split the string based on the "|" character
    List<String> splitStrings = inputString.split(':');
    splitStrings.removeAt(0);
    splitStrings = splitStrings.first.split('|');

    var intLists = splitStrings.map((e) => e.split(' ')).toList();
    intLists
        .map((e) => e.removeWhere((element) => element == '' || element == ' '))
        .toList();
    return intLists;
  }

  @override
  int solvePart2() {
    List<String> _input = parseInput();
    List<int> totalPoints = [];
    List<int> cardCounter = List.generate(_input.length, (index) => 1);
    for (int i = 0; i < _input.length; i++) {
      for (int k = 0; k < cardCounter[i]; k++) {
        List<List<String>> splitStrings = splitCardString(_input[i]);
        List winningNumbers = splitStrings[0];
        List myNumbers = splitStrings[1];
        Set commonElements =
            winningNumbers.toSet().intersection(myNumbers.toSet());
        List<int> parsedInts =
            commonElements.map((e) => int.parse(e.toString())).toList();
        totalPoints.add(parsedInts.isEmpty
            ? 0
            : int.parse(pow(2, parsedInts.length - 1).toString()));
        for (int j = 1; j <= parsedInts.length; j++) {
          cardCounter[i + j] = (cardCounter[i + j]) + 1;
        }
      }
    }

    return cardCounter.reduce((value, element) => value + element);
  }
}
