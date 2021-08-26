class Client {
  late String name;
  late String document;

  Client(String name, String document) {
    this.name = name;
    this.document = document;
  } 

  @override String toString() => name;
}
