import 'package:flutter/material.dart';
import 'package:test_todo_app/screen/contactList_screen.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: const ContactListScreen(),
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(),
          errorBorder: OutlineInputBorder(),

        )
      ),
    );
  }
}