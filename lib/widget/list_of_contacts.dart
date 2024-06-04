import 'package:flutter/material.dart';
import '../entities/contact.dart';

class ListOfContacts extends StatelessWidget {
  const ListOfContacts({
    super.key,
    required this.todo,
  });

  final Contact todo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: const Icon(Icons.person, size: 40, color: Color(0xff695621)),
        title: Text(
          todo.name,
          style:
              const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(todo.number),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.call, size: 30, color: Colors.blue),
        ));
  }
}
