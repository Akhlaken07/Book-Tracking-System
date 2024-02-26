import 'package:flutter/material.dart';

class EditBook extends StatelessWidget {
  VoidCallback onEdit;
  EditBook({super.key, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[100],
      child: IconButton(
        icon: const Icon(Icons.edit),
        onPressed: () {
          onEdit();
        },
      )
    );
  }
}

