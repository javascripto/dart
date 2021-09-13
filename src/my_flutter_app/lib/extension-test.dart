
void main(List<String> args) {
  final permissions = [
    Permission('Storage'),
    Permission('Camera')
  ];

  permissions.request();
}

class Permission {
  String name;
  Permission(this.name);
  void log() => print("Requisitando permissão $name");
}

extension on List<Permission> {
  void request() {
    this.forEach((permission) => permission.log());
  }
}
