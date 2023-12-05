import '../utils/index.dart';

class Day02 extends GenericDay {
  Day02() : super(2);

  @override
  List<String> parseInput() {
    return input.getPerLine();
  }

  @override
  int solvePart1() {
    List<int> validGameIds = parseInput()
        .map((e) => e.replaceAll(RegExp(';'), ','))
        .map((e) => e.split(':'))
        .where((e) {
          List<String> _parsingStringToList = e.last.split(',').toList();
          return !checkForColors(_parsingStringToList, 'red')
                  .any((element) => element > 12) &&
              !checkForColors(_parsingStringToList, 'blue')
                  .any((element) => element > 14) &&
              !checkForColors(_parsingStringToList, 'green')
                  .any((element) => element > 13);
        })
        .map((e) => int.parse(e
            .firstWhere((element) => element.contains('Game'))
            .replaceAll(' ', '')
            .replaceAll(RegExp(r'\D'), '')))
        .toList();

    int result =
        validGameIds.fold(0, (previous, current) => previous + current);

    print(result);
    return result;
  }

  List<int> checkForColors(List<String> e, String color) {
    print('\n');
    return e
        .where((element) => element.contains(color))
        .map((e) => e.replaceAll(' ', ''))
        .map((e) => e.replaceAll(RegExp(r'\D'), ''))
        .map((e) => int.parse(e))
        .toList();
  }

  @override
  int solvePart2() {
    List<int> sumOfPowers = [];
    var result = parseInput()
        .map((e) => e.replaceAll(RegExp(';'), ','))
        .map((e) => e.split(':'))
        .map((e) {
      int findingGameID = int.parse(
        e
            .firstWhere((element) => element.contains('Game'))
            .replaceAll(' ', '')
            .replaceAll(RegExp(r'\D'), ''),
      );
      List<String> _parsingStringToList = e.last.split(',').toList();
      sumOfPowers.add((checkForColors(_parsingStringToList, 'red').max) *
          (checkForColors(_parsingStringToList, 'blue').max) *
          (checkForColors(_parsingStringToList, 'green').max));
      return sumOfPowers.reduce((value, element) => value + element);
    }).toList();

    return result.last;
  }
}
