import 'package:flutter/material.dart';
import '../pages/ChangeThemePage.dart';
import '../pages/NewsDetailsPage.dart';

//配置路由
final routes = {
  '/theme': (context, {arguments}) => ChangeThemePage(),
  '/newsDetailsPage': (context, {arguments}) => NewsDetailsPage(
        arguments: arguments,
      ),
};

//统一处理路由跳转传参
Function myGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
  return null;
};
