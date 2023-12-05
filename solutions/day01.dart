import '../utils/index.dart';

class Day01 extends GenericDay {
  Day01() : super(1);

  @override
  List<String> parseInput() {
    return input.getPerLine();
  }

  @override
  int solvePart1() {
    return parseInput()
            .map((e) => e.replaceAll(RegExp(r'\D'), ' '))
            .map((e) => e.replaceAll(' ', ''))
            .map(handleCases)
            .map((e) => int.tryParse(e))
            .reduce((value, element) => value! + element!) ??
        0;
  }

  @override
  int solvePart2() {
    return parseInput()
            .map(stringToNumber)
            .map((e) => e.replaceAll(RegExp(r'\D'), ' '))
            .map((e) => e.replaceAll(' ', ''))
            .map(handleCases)
            .map((e) => int.tryParse(e))
            .reduce((value, element) => value! + element!) ??
        0;
  }

  String handleCases(String e) {
    if (e.length > 1) {
      return e = e[0] + e[e.length - 1];
    } else if (e.length == 1) {
      return e = e[0] + e[0];
    } else {
      return throw Exception('Empty Line');
    }
  }

  String stringToNumber(String named) {
    return named
        .replaceAll('one', 'o1e')
        .replaceAll('two', 't2o')
        .replaceAll('three', 't3e')
        .replaceAll('four', 'f4r')
        .replaceAll('five', 'f5e')
        .replaceAll('six', 's6x')
        .replaceAll('seven', 's7n')
        .replaceAll('eight', 'e8t')
        .replaceAll('nine', 'n9e')
        .replaceAll('zero', 'z0e');
  }
}
