import 'package:flutter/material.dart';

void main() => runApp(const StoreFrontApp());

class StoreFrontApp extends StatelessWidget {
  const StoreFrontApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}
