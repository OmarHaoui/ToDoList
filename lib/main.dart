import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list/Screens/add_note_screen.dart';
import 'package:to_do_list/Screens/notes_screen.dart';

void main() async {
  await Hive.initFlutter();

  await Hive.openBox('notes');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TODO LIST',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.black, secondary: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Notes(),
    );
  }
}
