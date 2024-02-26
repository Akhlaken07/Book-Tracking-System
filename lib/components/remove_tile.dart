// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class RemoveTile extends StatelessWidget {
  VoidCallback onRemove;
  RemoveTile({super.key, required this.onRemove});


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[100],
      child: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          showDialog(
            context: context, 
            builder: (context){
              return AlertDialog(
                backgroundColor: Colors.red[200],
                title: const Text('Remove Book'),
                content: const Text('Are you sure you want to remove this book?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      onRemove();
                      Navigator.of(context).pop();
                    },
                    child: const Text('Remove'),
                  ),
                ],
              );
            },
          );
        },
      )
    );
  }
}