// import 'dart:io';

// void main() {
//   var contents = getContents(
//       File('..\\advent_day_5\\day5input.txt')); //get contents of the file
//   var crates = parseCrates(contents); //crates into lists
//   var instructions = parseInstructions(contents); //instructions => objects
//   var topStack = getTopStack(instructions, crates);
//   topStack.forEach((element) => print(element));
// }

// List<String> getContents(File fileName) {
//   return fileName.readAsLinesSync();
// }

// List<List<String?>> parseCrates(List<String> contents) {
//   List<String> crateGroup = [];
//   for (var i = 0; i <= 7; i++) {
//     crateGroup.add(contents[i]);
//   }
//   int columnCount = 9;
//   RegExp regex = RegExp(r'\[([A-Z])\]');

//   List<List<String?>> crateGrid = [];
//   for (var line in crateGroup) {
//     List<String?> lineCrates = List.generate(columnCount, (index) => "0");
//     var matches = regex.allMatches(line).toList();

//     int currentIndex = 0;
//     for (var match in matches) {
//       int cratePosition = line.indexOf(match.group(0)!, currentIndex);
//       int crateColumn = cratePosition ~/ 4;
//       lineCrates[crateColumn] = match.group(1);
//       currentIndex = cratePosition + 1;
//     }

//     crateGrid.add(lineCrates);
//   }

//   List<List<String?>> columns = [];
//   List<String?> column = [];
//   int charIndex = 0;
//   for (charIndex = 0; charIndex <= 8; charIndex++) {
//     for (var columnIndex = 0; columnIndex <= 7; columnIndex++) {
//       column.add(crateGrid[columnIndex][charIndex]);
//     }
//     columns.add(column.reversed.toList());
//     column = [];
//   }

//   for (var i = 0; i < columns.length; i++) {
//     while (columns[i][columns[i].length - 1] == '0') {
//       columns[i].removeLast();
//     }
//   }
//   return columns;
// }

// List<Instructions> parseInstructions(List<String> contents) {
//   List<String> instructionGroup = [];
//   for (var i = 10; i < 513; i++) {
//     instructionGroup.add(contents[i]);
//   }

//   RegExp reg = RegExp(r'\d+');
//   List<Instructions> instructionSets = [];
//   for (var element in instructionGroup) {
//     Iterable<RegExpMatch> matches = reg.allMatches(element);

//     if (matches.length >= 3) {
//       int quantity = int.parse(matches.elementAt(0).group(0)!);
//       int source = int.parse(matches.elementAt(1).group(0)!);
//       int destination = int.parse(matches.elementAt(2).group(0)!);
//       instructionSets.add(Instructions(quantity, source, destination));
//     }
//   }
//   return instructionSets;
// }

// List<String?> getTopStack(
//     List<Instructions> instructions, List<List<String?>> crates) {
//   instructions.forEach((instruction) {
//     for (var i = 0; i < instruction.quantity; i++) {
//       if (crates[instruction.source - 1].isEmpty) {
//         break;
//       }
//       crates[instruction.destination - 1]
//           .add(crates[instruction.source - 1].removeLast());
//     }
//   });
//   List<String?> top = [];
//   for (var colindx = 0; colindx < 9; colindx++) {
//     top.add(crates[colindx].isEmpty ? null : crates[colindx].last);
//   }

//   return top;
// }

// class Instructions {
//   int quantity;
//   int source;
//   int destination;

//   Instructions(this.quantity, this.source, this.destination);

//   @override
//   String toString() {
//     return '[$quantity, $source, $destination]';
//   }
// }
