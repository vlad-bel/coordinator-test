import 'package:flutter/cupertino.dart';

enum CurrentRoute {
  unknown,
  home,
  userList,
  userDetails,
  booksList,
  booksDetails,
}

class BasePath {
  final CurrentRoute currentRoute;

  BasePath({@required this.currentRoute});

  BasePath.unknown() : currentRoute = CurrentRoute.unknown;

  BasePath.home() : currentRoute = CurrentRoute.home;

  BasePath.userList() : currentRoute = CurrentRoute.userList;

  BasePath.booksList() : currentRoute = CurrentRoute.booksList;
}

class UserDetailsPath extends BasePath {
  final int userId;

  UserDetailsPath({this.userId})
      : super(currentRoute: CurrentRoute.userDetails);
}

class BookDetailsPath extends BasePath {
  final String bookName;

  BookDetailsPath({this.bookName})
      : super(currentRoute: CurrentRoute.booksDetails);
}
