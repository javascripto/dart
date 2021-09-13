class Client {
  String name;
  String document;

  // syntactic sugar for assignment to members
  Client(this.name, this.document);

  @override String toString() => name;
}

void main() {
  // cascade notation
  var client = Client('foo', 'bar')
    ..name = 'Foo'
    ..document = 'Bar';

  print(client.name);
  print(client.document);
}
