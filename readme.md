# Iniciando

https://dart.dev

https://dart.dev/get-dart

https://dartpad.dev


# Hello world

```dart
// hello.dart
void main() {
  print('Olá, Mundo');
}
```

# Executando e compilando para exe e js

```sh
dart hello.dart                          # executando código
dart compile exe hello.dart              # compilando binário
dart compile js hello.dart -o hello.js   # compilando para javascript
```

# Variáveis

- Alguns tipos primitivos no dart são int, double, bool, String
- No dart também é possível declarar variáveis e constantes sem informar o tipo utilizando as palavras var, const, final, dynamic 
- Variáveis declaradas com var podem mudar o valor mas não o tipo
- Constantes declaradas com const e final não podem receber novos valores
- Variáveis declaradas com dynamic podem mudar tanto o valor quanto o tipo

```dart
void main() {
  int integer = 1;
  double PI = 3.14;
  String text = 'Hello';
  bool isTrue = true;

  num number = 1.2;
  number = 1;

  const constant = 3.14;
  var variable = 1; variable = 2;
  dynamic typeVariable = 1; typeVariable = '1';
  const bool FALSE = false;
  const final TRUE = true;
}
```