import 'package:flutter/material.dart';
import 'schema_loader.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadSchemas();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(child: Text('CABTECH')),
      ),
    );
  }
}