import 'dart:math';

void main() {
  int? age;
  Random random = new Random();

  if (random.nextInt(10) > 1) {
    age = random.nextInt(100);
  }

  age == null
    ? print('Não informado')
    : print('Idade: ${age}');

  if (age == null) return;

  if (age < 18) print('Menor de idade');
  else if (age >= 60) print('Idoso');
  else print('Maior de idade');

  // switch
  print('Escolha um número entre 1 e 3');
  int number = 1;
  switch (number) {
    case 1: print('Primeiro número'); break;
    case 2: print('Segundo número'); break;
    case 3: print('Terceiro número'); break;
    default: print('Opção desconhecida');
  }
}
