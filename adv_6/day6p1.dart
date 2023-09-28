// import 'dart:io';

// void main() {
//   var content = getFileContent(File('../advent_day_6/day6.txt'));
//   int packetMarker = getPacketMarker(content);
//   print(packetMarker);
// }

// List<String> getFileContent(File fileName) {
//   return fileName.readAsLinesSync();
// }

// int getPacketMarker(List<String> content) {
//   var result = 0;

//   var contentString = content.toString().split('');
//   for (var i = 1; i <= contentString.length - 5; i += 3) {
//     //it's 1 & -5, as there are '[]' at 0 & -1
//     var packet = <String>{};
//     for (var j = i; j < i + 4; j++) {
//       packet.add(contentString[j]);
//     }
//     if (packet.length == 4) {
//       result = i + 3;
//       break;
//     } else {
//       result = 0;
//     }
//   }
//   return result;
// }
