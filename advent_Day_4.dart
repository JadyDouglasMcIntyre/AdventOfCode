import 'dart:io';
import 'dart:core';

void main() {
  List<String> contents = getContents(File('../advent_day_4/section_ids.txt'));
  List<RangePair> ranges = sortRanges(contents);
  int overlapCount = calcOverlap(ranges);
  print(overlapCount);
}

List<String> getContents(File fileName) {
  return fileName.readAsLinesSync();
}

class Range {
  int start;
  int end;

  Range(this.start, this.end);

//e.g. "2-3"
  factory Range.fromDelimetedIntString(String input) {
    List<String> values = input.split("-");
    return Range(int.parse(values[0]), int.parse(values[1]));
  }
}

class RangePair {
  Range rangeX;
  Range rangeY;

  RangePair(this.rangeX, this.rangeY);
}

List<RangePair> sortRanges(List<String> contents) {
  List<RangePair> rangePairs = [];
  for (var line in contents) {
    List<String> rangePairInput = line.split(',').map((e) => e.trim()).toList();

    rangePairs.add(RangePair(Range.fromDelimetedIntString(rangePairInput[0]),
        Range.fromDelimetedIntString(rangePairInput[1])));

    //Same effect as above -> just using a helper method, where as above is factory constructor method
    // rangePairs.add(
    //     RangePair(getRange(rangePairInput[0]), getRange(rangePairInput[1])));
  }
  return rangePairs;
}

Range getRange(String input) {
  List<String> values = input.split("-");
  return Range(int.parse(values[0]), int.parse(values[1]));
}

int calcOverlap(List<RangePair> ranges) {
  int count = 0;
  for (var pair in ranges) {
    if (pair.rangeX.start <= pair.rangeY.end &&
        pair.rangeX.end >= pair.rangeY.start) {
      count++;
    }
  }
  return count;
}
