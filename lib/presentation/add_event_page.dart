import 'package:flutter/material.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({super.key});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();
  String? _selectedCategory;

  List<String> _categories = [
    'Category 1',
    'Category 2',
    'Category 3',
    'Category 4',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Event')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Event Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter event title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _descriptionController,
                decoration:
                    const InputDecoration(labelText: 'Event Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter event description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ListTile(
                title: const Text('Start Date'),
                subtitle: Text('${_startDate.toString()}'),
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: _startDate,
                    firstDate: DateTime(2022),
                    lastDate: DateTime(2025),
                  ).then((date) {
                    if (date != null) {
                      setState(() {
                        _startDate = date;
                      });
                    }
                  });
                },
              ),
              ListTile(
                title: const Text('End Date'),
                subtitle: Text('${_endDate.toString()}'),
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: _endDate,
                    firstDate: DateTime(2022),
                    lastDate: DateTime(2025),
                  ).then((date) {
                    if (date != null) {
                      setState(() {
                        _endDate = date;
                      });
                    }
                  });
                },
              ),
              DropdownButtonFormField(
                value: _selectedCategory,
                items: _categories.map((category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
                decoration: const InputDecoration(labelText: 'Category'),
                validator: (value) {
                  if (value == null) {
                    return 'Please select a category';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Save event logic goes here
                    // Once saved, you can navigate to another page or show a confirmation dialog
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
