import 'package:flutter/material.dart';
import 'package:new_navigation_test_2/navigation/my_route_parser.dart';
import 'package:new_navigation_test_2/navigation/my_router_delegate.dart';
import 'package:new_navigation_test_2/navigation/router_calculator.dart';
import 'package:new_navigation_test_2/pages/homePage/home_page.dart';
import 'package:new_navigation_test_2/pages/userListPage/user_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: MyRouterDelegate(
        routerCalculator: RouterCalculator(),
      ),
      routeInformationParser: MyRouteParser(),
    );
  }
}
