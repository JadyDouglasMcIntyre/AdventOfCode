import 'dart:io';

void main() {
  //getting file contents ✔
  var fileName = File(
      'C:\\Users\\jadym01\\Desktop\\advent_of_code\\advent_day_2\\rps.txt');
  var playPairs = fileName.readAsLinesSync();

//initializing list ✔
  var playsSplit = [];

//splitting pairs  ✔
  for (var pair in playPairs) {
    for (var char in pair.split(' ')) {
      if (char.trim().isNotEmpty) {
        playsSplit.add(char);
      }
    }
  }

  var myIndex = 1;
  var elfIndex = 0;
  var myScore = 0;

//part 2
  for (myIndex; myIndex < playsSplit.length; myIndex += 2) {
    //Lose X
    if (playsSplit[myIndex] == 'X') {
      myScore += 0;
      if (playsSplit[elfIndex] == 'A' && playsSplit[myIndex] == 'X') {
        myScore += 3;
      } else if (playsSplit[elfIndex] == 'B' && playsSplit[myIndex] == 'X') {
        myScore += 1;
      } else if (playsSplit[elfIndex] == 'C' && playsSplit[myIndex] == 'X') {
        myScore += 2;
      }
    }
    //Draw Y
    if (playsSplit[myIndex] == 'Y') {
      myScore += 3;
      if (playsSplit[elfIndex] == 'A' && playsSplit[myIndex] == 'Y') {
        myScore += 1;
      } else if (playsSplit[elfIndex] == 'B' && playsSplit[myIndex] == 'Y') {
        myScore += 2;
      } else if (playsSplit[elfIndex] == 'C' && playsSplit[myIndex] == 'Y') {
        myScore += 3;
      }
    }
    //Win Z
    if (playsSplit[myIndex] == 'Z') {
      myScore += 6;
      if (playsSplit[elfIndex] == 'A' && playsSplit[myIndex] == 'Z') {
        myScore += 2;
      } else if (playsSplit[elfIndex] == 'B' && playsSplit[myIndex] == 'Z') {
        myScore += 3;
      } else if (playsSplit[elfIndex] == 'C' && playsSplit[myIndex] == 'Z') {
        myScore += 1;
      }
    }
    elfIndex += 2;
  }
  print(myScore);
}


//part one

  // var myScore = 0;
  // var index = 0;

  // for (var myIndex = 1; myIndex < playsSplit.length; myIndex += 2) {
  //   if (playsSplit[myIndex] == 'X') {
  //     myScore++;
  //   } else if (playsSplit[myIndex] == 'Y') {
  //     myScore += 2;
  //   } else if (playsSplit[myIndex] == 'Z') {
  //     myScore += 3;
  //   }
  //   //draw
  //   if (playsSplit[myIndex] == 'X' && playsSplit[index] == 'A') {
  //     myScore += 3;
  //   }
  //   if (playsSplit[myIndex] == 'Y' && playsSplit[index] == 'B') {
  //     myScore += 3;
  //   }
  //   if (playsSplit[myIndex] == 'Z' && playsSplit[index] == 'C') {
  //     myScore += 3;
  //   }
  //   //wins
  //   if (playsSplit[myIndex] == 'X' && playsSplit[index] == 'C') {
  //     myScore += 6;
  //   } else if (playsSplit[myIndex] == 'Y' && playsSplit[index] == 'A') {
  //     myScore += 6;
  //   } else if (playsSplit[myIndex] == 'Z' && playsSplit[index] == 'B') {
  //     myScore += 6;
  //   }
  //   //loss
  //   if (playsSplit[myIndex] == 'X' && playsSplit[index] == 'B') {
  //     myScore += 0;
  //   } else if (playsSplit[myIndex] == 'Y' && playsSplit[index] == 'C') {
  //     myScore += 0;
  //   } else if (playsSplit[myIndex] == 'Z' && playsSplit[index] == 'A') {
  //     myScore += 0;
  //   }
  //   index += 2;
  // }
  // print(myScore);
