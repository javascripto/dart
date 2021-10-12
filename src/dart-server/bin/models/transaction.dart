import 'package:uuid/uuid.dart';

import 'contact.dart';

class Transaction {
  late final String id;
  final double value;
  final Contact contact;
  final String datetime;

  Transaction(
      {String? id,
      required this.value,
      required this.contact,
      required this.datetime}) {
    this.id = id ?? Uuid().v4();
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'value': value,
        'contact': contact.toJson(),
        'datetime': datetime,
      };

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json['id'],
        value: json['value'],
        contact: Contact.fromJson(json['contact']),
        datetime: json['dateTime'],
      );
}
