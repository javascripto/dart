import 'package:uuid/uuid.dart';

import 'contact.dart';

class Transaction {
  late final String id;
  late final String dateTime;
  final double value;
  final Contact contact;

  Transaction(
      {String? id,
      required this.value,
      required this.contact,
      String? dateTime}) {
    this.id = id ?? Uuid().v4();
    this.dateTime = dateTime ?? DateTime.now().toString();
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'value': value,
        'contact': contact.toJson(),
        'dateTime': dateTime,
      };

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json['id'],
        value: json['value'],
        contact: Contact.fromJson(json['contact']),
        dateTime: json['dateTime'],
      );
}
