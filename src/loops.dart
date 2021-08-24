void main() {
  loopWhile();
  loopDoWhile();
  loopFor();
  breakAndContinue();
  loopForIn();
}

void loopWhile() {
  printSeparator();
  int counter = 0;

  while (counter < 10) {
    print(counter++);
  }
}

void loopDoWhile() {
  printSeparator();
  int counter = 0;

  do {
    print(counter++);
  } while (counter < 10);
}

void loopFor() {
  printSeparator();
  for (int counter = 9; counter >= 0; counter--) {
    print(counter);
  }
}

void loopForIn() {
  printSeparator();
  const list = [1, 2, 3, 4];
  const map = {
    'name': 'John',
    'age': 23
  };

  for (var item in list) {
    print(item);
  }

  for (var item in map.entries) {
    print("${item.key} -> ${item.value}");
  }
}

void breakAndContinue() {
  printSeparator();
  int counter = 0;

  while (true) {
    if (counter % 2 != 0) {
      counter++;
      continue;
    }
    print(counter++);
    if (counter > 20) break;
  }
}

void printSeparator() {
  print('-' * 30);
}
