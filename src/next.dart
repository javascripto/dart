import 'dart:io';
import 'dart:async';

void main(List<String> args) {
  print(args);
  dart:io:exit(0); // exit code 0
}

typedef IntArray = List<int>;
typedef CompareFn<T> = int Function(T a, T b);

// annotation/decorators
// union type with library - https://github.com/rrousselGit/union
// modules
// exit code

// https://dart.dev/guides/language/language-tour
// as, in, static, assert, export, import, interface,
// async, await, is, switch, extension, late, sync,
// external, library, on typedef, covariant Function,
// arrow funtion, part,, get, required, deferred, hide,
// rethrow, with, yield, set


void interval() {
  Timer.periodic(Duration(seconds: 1),  (timer)  {
    print(timer.tick);
    if (timer.tick == 5) timer.cancel();
  });
}


void logPerson() {
  final person = Person(name: 'Fulano');
  print(person);
}

class Person {
  int? age;
  String? name;

  Person({String? this.name = '', int? this.age = 0 });

  @override String toString() => '{name: $name, age: $age}';
}