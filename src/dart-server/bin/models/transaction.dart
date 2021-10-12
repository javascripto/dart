import 'package:uuid/uuid.dart';

import 'contact.dart';

class Transaction {
  late final String id;
  late final String datetime;
  final double value;
  final Contact contact;

  Transaction(
      {String? id,
      required this.value,
      required this.contact,
      String? datetime}) {
    this.id = id ?? Uuid().v4();
    this.datetime = datetime ?? DateTime.now().toString();
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
