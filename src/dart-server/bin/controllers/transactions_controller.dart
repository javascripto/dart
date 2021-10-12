import 'dart:io';
import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../models/transaction.dart';

class TransactionsController {
  final _transactionsRepository = <Transaction>[];

  listTransactions(Request request) => _jsonResponse(_transactionsRepository);

  createTransation(Request request) async {
    final parsedBody = jsonDecode(await request.readAsString());
    final transaction = Transaction.fromJson(parsedBody);
    _transactionsRepository.add(transaction);
    return _jsonResponse(transaction);
  }
}

Response _jsonResponse(dynamic body) {
  return Response.ok(jsonEncode(body), headers: {
    HttpHeaders.contentTypeHeader: 'application/json',
  });
}
