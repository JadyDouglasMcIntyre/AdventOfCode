import 'dart:io';
import 'dart:core';

void main() {
//read file.
  var fileName = File('..\\elves.txt');
  var foodSet = fileName.readAsLinesSync();

//create a map of int, list for calorie sets per elf
  var elvesCalSet = Map<int, List<int>>();
  var elvesCalSetMapIndex = 0;
  int sumOfCalorieSet = 0;

//initialize first list
  elvesCalSet[elvesCalSetMapIndex] = [];

//fill calorie set map per elf
  foodSet.forEach((calorie) {
    if (calorie.trim() == "") {
      elvesCalSetMapIndex++;
      elvesCalSet[elvesCalSetMapIndex] = [];
    } else {
      elvesCalSet[elvesCalSetMapIndex]?.add(int.parse(calorie));
    }
  });

//create a map of int, int for total calories per elf
  var elvesTotalCal = Map<int, int>();
  var elvesTotalCalMapIndex = 0;

//fill total calories per elf map
  elvesCalSet.forEach((key, value) {
    for (var elf in value) {
      sumOfCalorieSet += elf;
    }
    elvesTotalCalMapIndex++;
    elvesTotalCal[elvesTotalCalMapIndex] = sumOfCalorieSet;
    sumOfCalorieSet = 0;
  });

//Get elf with most calories
  var mostCalories = 0;
  elvesTotalCal.forEach((key, value) {
    if (mostCalories < value) {
      mostCalories = value;
    }
  });

  var totalCalList = [];
  elvesTotalCal.forEach((key, value) {
    totalCalList.add(value);
  });

  totalCalList.sort((a, b) => b.compareTo(a));

  print(totalCalList[0] + totalCalList[1] + totalCalList[2]);
}
