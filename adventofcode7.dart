class ElfFile {
  String fileName;
  int fileSize;

  ElfFile(this.fileName, this.fileSize);
}

class ElfDirectory {
  String directoryName;
  final List<ElfFile> _files = [];
  final List<ElfDirectory?> _subdirectories = [];

  ElfDirectory(this.directoryName);

  void addFile(ElfFile elfFile) {
    _files.add(elfFile);
  }

  void addSubDirectory(ElfDirectory elfDirectory) {
    _subdirectories.add(elfDirectory);
  }
}

class FileSystemParser {
  List<String> inputLines;
  ElfDirectory rootDirectory = ElfDirectory('/');
  List<ElfDirectory> currentDirectoryStack = [];

  FileSystemParser(this.inputLines) {
    currentDirectoryStack = [rootDirectory];
  }

  void parse() {
    for (var i = 0; i < inputLines.length; i++) {
      if (inputLines[i].contains('cd')) {
        handleCdCommand(inputLines[i]);
      } else if (inputLines[i].contains('ls')) {
        handleLsCommand(inputLines[i]);
      }
    }
  }

  void handleCdCommand(String line) {
    print(line);
    var parts = line.split(' ');
    if (parts.length > 2 && parts[2] == '..') {
      currentDirectoryStack.removeLast();
    } else if (parts.length > 2 && parts[2] == '/') {
      currentDirectoryStack = [rootDirectory];
    } else {
      if (parts.length > 2) {
        var directoryName = parts[2];
        ElfDirectory? foundDirectory = currentDirectoryStack
            .last._subdirectories
            .firstWhere((dir) => dir?.directoryName == directoryName,
                orElse: () => null);

        if (foundDirectory != null) {
          currentDirectoryStack.add(foundDirectory);
        } else {
          var newDir = ElfDirectory(directoryName);
          currentDirectoryStack.last.addSubDirectory(newDir);
          currentDirectoryStack.add(newDir);
        }
      }
    }
  }

  void handleLsCommand(String line) {
    var i = inputLines.indexOf(line) + 1;
    while (i < inputLines.length && !inputLines[i].startsWith('\$')) {
      var currentLine = inputLines[i];
      if (RegExp(r'^\d+').hasMatch(currentLine)) {
        var parts = currentLine.split(' ');
        var size = int.parse(parts[0]);
        var name = parts[1];
        currentDirectoryStack.last.addFile(ElfFile(name, size));
      } else if (currentLine.startsWith('dir')) {
        var name = currentLine.split(' ')[1];
        var newDir = ElfDirectory(name);
        currentDirectoryStack.last.addSubDirectory(newDir);
      }
      i++;
    }
  }
}
