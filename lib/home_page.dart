import 'package:book_tracking_system/components/book_tile.dart';
import 'package:book_tracking_system/components/dialog_box.dart';
import 'package:book_tracking_system/components/edit_dialog_box.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controllerTitle = TextEditingController();
  final _controllerAuthor = TextEditingController();
  final _controllerPage = TextEditingController();

  //List of books
  List newBooks = [
      ['Example Book', 'Example Author',0],
      ];

  //To save new book to the list
  void saveNewBook() {
    setState(() {
      newBooks.add([_controllerTitle.text, _controllerAuthor.text, int.parse(_controllerPage.text)]);
      _controllerTitle.clear();
      _controllerAuthor.clear();
      _controllerPage.clear();
    });
    Navigator.of(context).pop();
  }

  //To pop up dialog box to create new book
  void createNewBook() {
    showDialog(
      context: context, 
      builder: (context){
        return DialogBox(
          controllerTitle: _controllerTitle,
          controllerAuthor: _controllerAuthor,
          controllerPage: _controllerPage,
          onSave:saveNewBook,
        );
      },
      );
  }

  //To delete book from the list
  void deleteBooks(int index){
    setState(() {
      newBooks.removeAt(index);
    });
  }
  
  //To edit book from the list
  void editBooks(int index){
    //To pop up dialog box to edit book
    showDialog(
      context: context, 
      builder: (context){
        return EditDialogBox(
          controllerPage: _controllerPage,
          onEdit: () {
            setState(() {
              newBooks[index][2] = int.parse(_controllerPage.text);
              _controllerPage.clear();
            });
            Navigator.of(context).pop();
          },
        );
      },
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Center(child: const Text('Book Track')),
      ),
      body: Container(
        color: Colors.blue[100],
        child: ListView.builder(
          itemCount: newBooks.length,
          itemBuilder: (context, index){
            return BookTile(
              bookTitle: newBooks[index][0],
              bookAuthor: newBooks[index][1],
              bookPage: newBooks[index][2],
              deleteBook: (context)=>deleteBooks(index),
              editBook: (context)=>editBooks(index),
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createNewBook();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 252, 240, 134),
      )
    );
  }
}

