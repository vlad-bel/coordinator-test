import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_navigation_test_2/navigation/my_router_delegate.dart';
import 'package:new_navigation_test_2/navigation/paths.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Главная страница",
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: 32,
            ),
            _buildCategory(
              context,
              "Пользователи",
              BasePath.userList(),
            ),
            _buildCategory(
              context,
              "Книги",
              BasePath.booksList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory(
    BuildContext context,
    String category,
    BasePath path,
  ) {
    var router = Router.of(context).routerDelegate as MyRouterDelegate;
    return InkWell(
      onTap: () => router.setNewRoutePath(path),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            category,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
    );
  }
}
