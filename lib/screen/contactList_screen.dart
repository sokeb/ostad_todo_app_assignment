import 'package:flutter/material.dart';
import '../entities/contact.dart';
import '../widget/list_of_contacts.dart';

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  final List<Contact> _contactList = [];

  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _numberTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff476a6e),
        foregroundColor: Colors.white,
        title: const Center(child: Text("Contact List")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                      controller: _nameTEController,
                      decoration: const InputDecoration(
                        hintText: 'name',
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Enter Name of Contact';
                        } else {
                          return null;
                        }
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _numberTEController,
                    decoration: const InputDecoration(
                      hintText: 'Number',
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.number,
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter Contact Number';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size.fromWidth(double.maxFinite),
                          backgroundColor: const Color(0xff476a6e),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Contact contact = Contact(_nameTEController.text.trim(),
                              _numberTEController.text.trim());
                          _addNewContract(contact);
                        }
                      },
                      child: const Text(
                        "Add",
                        style: TextStyle(fontSize: 16),
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _contactList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: GestureDetector(
                        onLongPress: () {
                          _showDialogScreen(index);
                        },
                        child: ListOfContacts(
                          todo: _contactList[index],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialogScreen(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: const Text('Confirmation'),
              content: const Text('Are you sure for Delete?'),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.browser_not_supported,
                        color: Colors.blue)),
                IconButton(
                    onPressed: () {
                      _deleteContact(index);
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.delete_outline, color: Colors.blue))
              ]);
        });
  }

  @override
  void dispose() {
    super.dispose();
    _numberTEController.dispose();
    _nameTEController.dispose();
  }

  void _addNewContract(Contact contact) {
    _contactList.add(contact);
    setState(() {});
  }

  void _deleteContact(int index) {
    _contactList.removeAt(index);
    setState(() {});
  }
}
