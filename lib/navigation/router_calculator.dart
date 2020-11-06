import 'package:flutter/material.dart';
import 'package:new_navigation_test_2/navigation/paths.dart';
import 'package:new_navigation_test_2/pages/bookDetailsPage/book_details_page.dart';
import 'package:new_navigation_test_2/pages/bookListPage/book_list_page.dart';
import 'package:new_navigation_test_2/pages/homePage/home_page.dart';
import 'package:new_navigation_test_2/pages/userDetailsPage/user_details_page.dart';
import 'package:new_navigation_test_2/pages/userListPage/user_list_page.dart';

class RouterCalculator {
  CurrentRoute currentRoute = CurrentRoute.home;

  int userId = 0;
  String bookName = "none";

  List<Page> getRoutes() => [
        if (currentRoute == CurrentRoute.home)
          MaterialPage(
            child: HomePage(),
          ),
        if (currentRoute == CurrentRoute.userList)
          MaterialPage(
            child: UserListPage(),
          ),
        if (currentRoute == CurrentRoute.userDetails)
          MaterialPage(
            child: UserDetailsPage(userId: userId),
          ),
        if (currentRoute == CurrentRoute.booksList)
          MaterialPage(
            child: BookListPage(),
          ),
        if (currentRoute == CurrentRoute.booksDetails)
          MaterialPage(
            child: BookDetailsPage(bookName: bookName),
          ),
      ];
}
