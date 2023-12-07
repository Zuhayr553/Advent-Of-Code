import '../utils/index.dart';

class Day03 extends GenericDay {
  Day03() : super(3);

  @override
  List<String> parseInput() {
    return input.getPerLine();
  }

  final regExp = RegExp(r'[^\d\w\s.]');
  @override
  int solvePart1() {
    List<int> _partNumbersList = [];
    List<String> _input = parseInput();

    for (int i = 0; i < _input.length; i++) {
      RegExp numberPattern = RegExp(r'\d+');
      Iterable<Match> matches = numberPattern.allMatches(_input[i]);

      for (Match match in matches) {
        int startIndex = match.start;
        int endIndex = match.end; // Adjust to get the index of the last digit
        String? number = match.group(0);

        // Get previous and next elements
        String? previousElement = (i > 0) ? _input[i - 1] : null;
        String? nextElement = (i < _input.length - 1) ? _input[i + 1] : null;
        String _numberLeftAndRight = _input[i].substring(
            (startIndex - 1 >= 0) ? (startIndex - 1) : (startIndex),
            (endIndex + 1 < _input[i].length) ? (endIndex + 1) : (endIndex));

        String? _aboveTheNumber = previousElement?.substring(
            (startIndex - 1 >= 0) ? (startIndex - 1) : startIndex,
            (endIndex + 1 < previousElement.length)
                ? (endIndex + 1)
                : endIndex);
        String? _belowTheNumber = nextElement?.substring(
            (startIndex - 1 >= 0) ? (startIndex - 1) : startIndex,
            (endIndex + 1 < nextElement.length) ? (endIndex + 1) : endIndex);
        if ((_aboveTheNumber != null && regExp.hasMatch(_aboveTheNumber)) ||
            (_belowTheNumber != null && regExp.hasMatch(_belowTheNumber)) ||
            regExp.hasMatch(_numberLeftAndRight)) {
          _partNumbersList.add(int.parse(number!));
        }

        // print("Previous Element: $previousElement");
        // print("Next Element: $nextElement");
      }
    }

    return _partNumbersList.reduce((value, element) => value + element);
  }

  @override
  int solvePart2() {
    return 0;
  }
}
