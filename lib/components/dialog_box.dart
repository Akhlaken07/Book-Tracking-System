import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final controllerTitle;
  final controllerAuthor;
  final controllerPage;
  VoidCallback onSave;

  //What is required here is the controllerTitle, controllerAuthor, controllerPage, and onSave function
  DialogBox({
    super.key,
    required this.controllerTitle,
    required this.controllerAuthor,
    required this.controllerPage,
    required this.onSave,
    });


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
        title: const Text('Add New Book'),
        content: Container(
          height: 200,
          child: Column(
            children: <Widget>[
              TextField(
                controller:controllerTitle,
                decoration: InputDecoration(
                  labelText: 'Book Title',
                ),
              ),
              TextField(
                controller:controllerAuthor,
                decoration: InputDecoration(
                  labelText: 'Book Author',
                ),
              ),
              TextField(
                controller:controllerPage,
                decoration: InputDecoration(
                  labelText: 'Book Page',
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: onSave,
            child: const Text('Add'),
          ),
        ],
    );
  }
}