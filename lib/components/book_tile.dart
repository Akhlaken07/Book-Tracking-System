import 'package:book_tracking_system/components/edit_tile.dart';
import 'package:book_tracking_system/components/remove_tile.dart';
import 'package:flutter/material.dart';

class BookTile extends StatelessWidget {

  final String bookTitle;
  final String bookAuthor;
  final int bookPage;
  Function (BuildContext) deleteBook;
  Function (BuildContext) editBook;
  
  //What is required here is the bookTitle, bookAuthor, bookPage, and deleteBook function
  BookTile({
    super.key,
    required this.bookTitle,
    required this.bookAuthor,
    required this.bookPage,
    required this.deleteBook,
    required this.editBook
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        padding:  EdgeInsets.all(15),
        child: Row(
          children: [
            Text(
              'Title: $bookTitle\nAuthor: $bookAuthor\nPage: $bookPage',
              ),
              Spacer(),
              EditBook(onEdit: () => editBook(context)),
              SizedBox(width: 10),
              RemoveTile(onRemove: () => deleteBook(context))
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.yellow[100],
          borderRadius: BorderRadius.circular(8),
        )
      ),
    );
  }
}