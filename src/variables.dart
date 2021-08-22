

void main() {
  // Tipos primitivos
  String name = "João";
  int age = 20;
  double a = 0.2, b = 0.1;
  bool doubleIssue = a + b != 0.3;

  // Inferencia de tipos em variáveis e constantes
  // variaveis declaradas com var recebem o tipo por inferencia
  // constantes declaradas com const ou final não podem ser alteradas
  // variaveis declaradas com dynamic podem mudar de valor e também de tipo
  const name2 = 'Fulano'; // String
  final name3 = 'Beltrano'; // String
  var age2 = 25; // int
  dynamic any = 123; // int
  any = "abc"; // String

  print([name2, name3, age2, any]);

  print(doubleIssue);
  print('Olá, meu nome é ${name}');
  print(5/2 == 2.5);

  // Conversão
  print(3.14.toInt() == 3.toDouble());
  print('1' != 1 && '1' == 1.toString());
  print(double.parse('3.14').toInt());

  // Objetos
  Person person = new Person(name, age);
  person.sayHi();
}


class Person {
  late int age;
  late String name = '';

  Person(String name, int age) {
    this.age = age;
    this.name = name;
  }

  void sayHi() {
    print("Olá, eu sou ${this.name} e tenho ${this.age} anos");
  }
}