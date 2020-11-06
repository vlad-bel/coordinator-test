import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookDetailsPage extends StatelessWidget {
  final String bookName;

  BookDetailsPage({this.bookName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "Деталка книги $bookName",
              style: Theme.of(context).textTheme.headline3,
            )
          ],
        ),
      ),
    );
  }
}
