
void main() {
  // final person = Person.anonymous();
  // print(person);
  // person.doSomething();

  var teste = Teste2();
}


class Person {
  String name;

  Person(this.name);

  // named constructors
  Person.anonymous(): name = 'anonymous';

  static Person Anonymous() => Person('anonymous');

  @override
  String toString() => name;

  @Todo('seth', 'make this do something')
  void doSomething() {
    print('do something');
  }
}


class Todo {
  final String who;
  final String what;

  const Todo(this.who, this.what);

  void log() {
    print('TODO: $who $what');
  }
}

class Teste {
  teste1() => print('teste1');
  teste2() => print('teste2');
  teste3() => print('teste3');
}

class Teste2 {
  String prop = 'prop';
}
