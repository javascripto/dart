import 'dart:io';
import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../models/transaction.dart';

typedef JSON = Map<String, dynamic>;

class TransactionsController {
  final List<Transaction> _transactions = [];

  Response listTransactions(Request request) {
    return Response.ok(jsonEncode(_transactions), headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });
  }

  Future<Response> createTransation(Request request) async {
    JSON requestBody = jsonDecode(await request.readAsString());
    Transaction transaction = Transaction.fromJson(requestBody);
    _transactions.add(transaction);
    return Response.ok(jsonEncode(transaction), headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });
  }
}
