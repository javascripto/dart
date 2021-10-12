class Contact {
  final String name;
  final int accountNumber;

  Contact({required this.name, required this.accountNumber});

  Map<String, dynamic> toJson() => {
        'name': name,
        'accountNumber': accountNumber,
      };

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        name: json['name'],
        accountNumber: json['accountNumber'],
      );
}
