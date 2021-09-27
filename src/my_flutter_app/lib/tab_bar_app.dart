import 'package:flutter/material.dart';

class TabBarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Tabs'),
          ),
          bottomNavigationBar: const Material(
            color: Colors.blue,
            child: TabBar(tabs: [
              Tab(icon: Icon(Icons.flash_on)),
              Tab(icon: Icon(Icons.grid_on)),
              Tab(icon: Icon(Icons.mail)),
            ]),
          ),
          body: TabBarView(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.flash_on),
                Text('foo'),
              ],
            ),
            const Icon(Icons.directions_transit),
            const Icon(Icons.directions_bike),
          ]),
        ),
      ),
    );
  }
}
