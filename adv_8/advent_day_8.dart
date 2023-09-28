import 'dart:io';

void main() {
  List<String> treeRows =
      getTreesInRows('../../AdventOfCode/adv_8/day_8_test_input.txt');

  List<List<int>> treeColumns = getTreesInColumns(treeRows);
  isTreeVisible(treeColumns);
  int edgeTrees = countEdgeTrees(treeRows, treeColumns);
  print(edgeTrees);
}

List<String> getTreesInRows(String fileName) {
  return File(fileName).readAsLinesSync();
}

List<List<int>> getTreesInColumns(List<String> treeRows) {
  List<List<int>> treeColumns = [];
  List<int> treeColumn = [];

  for (int i = 0; i < treeRows.length; i++) {
    List<String> trees = treeRows[i].split('');
    for (int j = 0; j < trees.length; j++) {
      int tree = int.parse(trees[j]);
      treeColumn.add(tree);
    }
    treeColumns.add(treeColumn);
    treeColumn = [];
  }
  return treeColumns;
}

int countEdgeTrees(List<String> treeRows, List<List<int>> treeColumns) {
  int firstRow = treeColumns[0].length;
  int lastRow = treeColumns.last.length;
  return ((treeRows.length - 2) * 2) + firstRow + lastRow;
}

void isTreeVisible(List<List<int>> treeColumns) {
  //this is how I can ring fence my trees, now I need to create the logic to get the visible
  for (var i = 1; i < treeColumns.length - 1; i++) {  //through each column, starting and ending within range
    for (var j = 1; j < treeColumns[i].length - 1; j++) { //through each row of column, starting and ending within range
      if (treeColumns[i][j] < treeColumns[i - 1][j]) {
        for (var k = 0; k < treeColumns.length; k++) {
          
        }
      }
    }
  }
}
