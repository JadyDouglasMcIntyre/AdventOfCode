import 'dart:io';

void main() {
  var content = getFileContent(File('../advent_day_6/day6.txt'));
  int packetMarker = getPacketMarker(content);
  print(packetMarker);
}

List<String> getFileContent(File fileName) {
  return fileName.readAsLinesSync();
}

int getPacketMarker(List<String> content) {
  var result = 0;

  var contentString = content.toString().split('');
  print(contentString.length);
  for (var i = 1; i <= contentString.length - 1; i++) {
    var packet = <String>{};
    for (var j = i; j < i + 14; j++) {
      packet.add(contentString[j]);
    }
    if (packet.length == 14) {
      result = i + 13;
      break;
    } else {
      result = 0;
    }
  }
  return result;
}
