import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../services/database_service.dart';

class AddItemView extends StatefulWidget {
  @override
  _AddItemViewState createState() => _AddItemViewState();
}

class _AddItemViewState extends State<AddItemView> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  late DatabaseService dbService;

  @override
  void initState() {
    super.initState();
    dbService = DatabaseService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                final newItem = Item(
                  name: _nameController.text,
                  description: _descriptionController.text,
                );
                dbService.insertItem(newItem);
                Navigator.pop(context);
              },
              child: Text('Add Item'),
            ),
          ],
        ),
      ),
    );
  }
}
