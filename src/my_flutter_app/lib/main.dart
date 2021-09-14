
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Transferências'),
        ),
        body: Column(
          children: [
            Card(
              child: ListTile(
                leading: Icon(Icons.monetization_on),
                title: Text('100.0'),
                subtitle: Text('1000'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.monetization_on),
                title: Text('100.0'),
                subtitle: Text('1000'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.monetization_on),
                title: Text('100.0'),
                subtitle: Text('1000'),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    );
  }
}