import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_navigation_test_2/navigation/paths.dart';
import 'package:new_navigation_test_2/navigation/router_calculator.dart';
import 'package:new_navigation_test_2/pages/bookDetailsPage/book_details_page.dart';
import 'package:new_navigation_test_2/pages/bookListPage/book_list_page.dart';
import 'package:new_navigation_test_2/pages/homePage/home_page.dart';
import 'package:new_navigation_test_2/pages/userDetailsPage/user_details_page.dart';
import 'package:new_navigation_test_2/pages/userListPage/user_list_page.dart';

class MyRouterDelegate extends RouterDelegate<BasePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<BasePath> {
  final GlobalKey<NavigatorState> navigatorKey;

  final RouterCalculator routerCalculator;

  MyRouterDelegate({@required this.routerCalculator})
      : navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: routerCalculator.getRoutes(),
      onPopPage: (route, result) {
        return true;
      },
    );
  }

  @override
  BasePath get currentConfiguration {
    switch (routerCalculator.currentRoute) {
      case CurrentRoute.home:
        return BasePath.home();
      case CurrentRoute.userList:
        return BasePath.userList();
      case CurrentRoute.userDetails:
        return UserDetailsPath(userId: routerCalculator.userId);
      case CurrentRoute.booksList:
        return BasePath.booksList();
      case CurrentRoute.booksDetails:
        return BookDetailsPath(bookName: routerCalculator.bookName);
      default:
        return BasePath.unknown();
    }
  }

  /// Обновление роутера
  @override
  Future<void> setNewRoutePath(BasePath path) async {
    switch (path.currentRoute) {
      case CurrentRoute.home:
        routerCalculator.currentRoute = CurrentRoute.home;
        return notifyListeners();
      case CurrentRoute.userList:
        routerCalculator.currentRoute = CurrentRoute.userList;
        return notifyListeners();
      case CurrentRoute.userDetails:
        routerCalculator.userId = (path as UserDetailsPath).userId;
        routerCalculator.currentRoute = CurrentRoute.userDetails;
        return notifyListeners();
      case CurrentRoute.booksList:
        routerCalculator.currentRoute = CurrentRoute.booksList;
        return notifyListeners();
      case CurrentRoute.booksDetails:
        routerCalculator.bookName = (path as BookDetailsPath).bookName;
        routerCalculator.currentRoute = CurrentRoute.booksDetails;
        return notifyListeners();
      default:
        routerCalculator.currentRoute = CurrentRoute.unknown;
        return notifyListeners();
    }
  }
}
