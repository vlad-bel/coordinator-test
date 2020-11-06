import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_navigation_test_2/navigation/my_router_delegate.dart';
import 'package:new_navigation_test_2/navigation/paths.dart';

class BookListPage extends StatelessWidget {
  var books = [
    "Book 1",
    "Book 2",
    "Book 3",
    "Book 4",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Книги",
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: 32,
            ),
            for (String book in books) _buildBookItem(context, book)
          ],
        ),
      ),
    );
  }

  Widget _buildBookItem(
    BuildContext context,
    String name,
  ) {
    var router = Router.of(context).routerDelegate as MyRouterDelegate;
    return InkWell(
      onTap: () => router.setNewRoutePath(BookDetailsPath(bookName: name)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            name,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
    );
  }
}
