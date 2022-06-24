import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../models/contact.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  List<Contact> contacts = [];

  searchContact(v) {
    setState(() {
      contacts = contacts
          .where((element) => element.name!.toLowerCase().contains(v.toLowerCase()))
          .toList();
    });
  }

  Future<bool> showContactDialog(index) async {
    bool result = false;
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Adicionar contato'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    label: const Text('Nome'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32)),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    label: const Text('Telefone'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32)),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancelar')),
              ElevatedButton(
                  onPressed: () {
                    result = true;
                    Navigator.pop(context);
                  },
                  child: const Text('Salvar')),
            ],
          );
        });
    return result;
  }

  saveEditContact(index) async {
    bool result = await showContactDialog(null);
    if (result == true) {
      setState(() {
        Contact contact = Contact(
          name: nameController.text,
          phone: phoneController.text,
        );
        contacts.add(contact);
        nameController.clear();
        phoneController.clear();
      });
    }
  }

  deleteContact(index) async {
    bool keepOn = false;
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Deletar'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('Tem certeza que deseja deletar esse contato?')
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancelar')),
              ElevatedButton(
                  onPressed: () {
                    keepOn = true;
                    Navigator.pop(context);
                  },
                  child: const Text('Sim')),
            ],
          );
        });
    if (keepOn == true) {
      setState(() {
        contacts.removeAt(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatos'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 45,
                child: TextField(
                  controller: searchController,
                  onChanged: (v) => searchContact(v),
                  decoration: InputDecoration(
                    label: const Text('Pesquisar'),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32)),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            deleteContact(index);
                          },
                          backgroundColor: const Color(0xFFFE4A49),
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(contacts[index].name!),
                      subtitle: Text(contacts[index].phone!),
                    ),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          saveEditContact(null);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
