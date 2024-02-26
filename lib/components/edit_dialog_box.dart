import 'package:flutter/material.dart';

class EditDialogBox extends StatelessWidget {
  final controllerPage;
  VoidCallback onEdit;

  //What is required here is the controllerTitle, controllerAuthor, controllerPage, and onSave function
  EditDialogBox({
    super.key,

    required this.controllerPage,
    required this.onEdit,
    });


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
        title: const Text('Update Page Number'),
        content: Container(
          height: 200,
          child: Column(
            children: <Widget>[
              TextField(
                controller:controllerPage,
                decoration: InputDecoration(
                  labelText: 'New Page Number',
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
            onPressed: onEdit,
            child: const Text('Update'),
          ),
        ],
    );
  }
}