import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

import 'controllers/transactions_controller.dart';

final transactionsController = TransactionsController();

final _router = Router()
  ..get('/', (Request req) => Response.ok('Hello, World!\n'))
  ..get('/transactions', transactionsController.listTransactions)
  ..post('/transactions', transactionsController.createTransation);

void main(List<String> args) async {
  final ip = InternetAddress.anyIPv4;

  final _handler = Pipeline().addMiddleware(logRequests()).addHandler(_router);

  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(_handler, ip, port);
  print('Server listening on port ${server.port}');
}
