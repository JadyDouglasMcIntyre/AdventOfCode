import 'dart:io';

void main() {
  //import/read file
  var fileName = File(
      'C:\\Users\\jadym01\\Desktop\\advent_of_code\\advent_day_3\\bag.txt');
  //split on line break
  var rucksacks = fileName.readAsLinesSync();

//ASCII ref.
  String a = 'a';
  String A = 'A';

  var sumPriority = 0;

  for (var i = 0; i < rucksacks.length - 2; i += 3) {
    var rucksack1Items = rucksacks[i].split("").toSet();
    var rucksack2Items = rucksacks[i + 1].split("").toSet();
    var rucksack3Items = rucksacks[i + 2].split("").toSet();

    var commonCharacters = rucksack1Items
        .intersection(rucksack2Items)
        .intersection(rucksack3Items);

    for (var char in commonCharacters) {
      if (char != char.toUpperCase()) {
        sumPriority += char.codeUnitAt(0) - a.codeUnitAt(0) + 1;
      } else {
        sumPriority += char.codeUnitAt(0) - A.codeUnitAt(0) + 27;
      }
    }
  }
  print(sumPriority);
}

//  //import/read file
//   var fileName = File(
//       'C:\\Users\\jadym01\\Desktop\\advent_of_code\\advent_day_3\\bag.txt');
//   //split on line break
//   var rucksacks = fileName.readAsLinesSync();
//   //declare split comparment's map
//   var compartments = Map<String, String>();


//sorting compartments into map
  // rucksacks.forEach((rucksack) {
  //   var midLength =
  //       ((rucksack.length) / 2).round(); //get midlength of each string

  //   var compartment1 = rucksack.substring(0, midLength); //get first compartment
  //   var compartment2 = rucksack.substring(midLength); //get second compartment

  //   compartments[compartment1] = compartment2; //Add to Map
  // });


//use to get group priorities.
  // int priority = 0;
  // int sumPriority = 0;

  // compartments.forEach((key, value) {
  //   var compartment1Items = key.split("");
  //   var compartment2Items = value.split("");

  //   compartment1Items.forEach((compartment1Item) {
  //     compartment2Items.forEach((compartment2Item) {
  //       if (compartment1Item == compartment2Item) {
  //         if (compartment1Item != compartment1Item.toUpperCase()) {
  //           priority = (compartment1Item.codeUnitAt(0)) - a.codeUnitAt(0) + 1;
  //         } else {
  //           priority = (compartment1Item.codeUnitAt(0)) - A.codeUnitAt(0) + 27;
  //         }
  //       }
  //     });
  //   });
  //   sumPriority += priority;
  // });
  // print(sumPriority);