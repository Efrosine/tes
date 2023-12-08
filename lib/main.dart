import 'package:flutter/material.dart';
import 'package:tes/api.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Coba(),
    );
  }
}

class Coba extends StatelessWidget {
  Coba({super.key});

  final _service = ApiSerrvice();
  void getData() async {
    final result = await _service.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            child: Text('klik'),
            onPressed: () {
              getData();
            }),
      ),
    );
  }
}
