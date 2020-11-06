import 'package:flutter/material.dart';
import 'package:new_navigation_test_2/navigation/paths.dart';

class MyRouteParser extends RouteInformationParser<BasePath> {
  @override
  Future<BasePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);

    print(uri);
    // Handle '/'
    if (uri.pathSegments.length == 0) {
      return BasePath.home();
    }

    // Handle base paths
    if (uri.pathSegments.length == 1) {
      var basePath = uri.pathSegments[0];
      if (basePath == 'userList') {
        return BasePath.userList();
      }
      if (basePath == 'bookList') {
        return BasePath.booksList();
      }
    }

    // handle details paths
    if (uri.pathSegments.length == 2) {
      var basePath = uri.pathSegments[0];
      //parse /userList/:userId
      if (basePath == 'userList') {
        var userId = int.tryParse(uri.pathSegments[1]);
        return UserDetailsPath(userId: userId);
      }
      //parse /booksList/:bookName
      if (basePath == 'bookList') {
        var bookName = uri.pathSegments[1];
        return BookDetailsPath(bookName: bookName);
      }
    }

    // Handle unknown routes
    return BasePath.unknown();
  }

  @override
  RouteInformation restoreRouteInformation(BasePath path) {
    var currentRoute = path.currentRoute;
    if (currentRoute == CurrentRoute.home) {
      return RouteInformation(location: '/');
    }

    if (currentRoute == CurrentRoute.unknown) {
      return RouteInformation(location: '/404');
    }

    if (currentRoute == CurrentRoute.userList) {
      return RouteInformation(location: '/userList');
    }

    if (currentRoute == CurrentRoute.userDetails) {
      var userDetailsPath = path as UserDetailsPath;
      return RouteInformation(location: '/userList/${userDetailsPath.userId}');
    }

    if (currentRoute == CurrentRoute.booksList) {
      return RouteInformation(location: '/bookList');
    }

    if (currentRoute == CurrentRoute.booksDetails) {
      var bookDetailsPath = path as BookDetailsPath;
      return RouteInformation(location: '/bookList/${bookDetailsPath.bookName}');
    }

    return null;
  }
}
