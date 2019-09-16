import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'application/App.dart';
import 'events/ChangeThemeEvent.dart';
import 'pages/DailyPage.dart';
import 'pages/ImagePage.dart';
import 'pages/NewsPage.dart';
import 'pages/TopListPage.dart';
import 'routes/Routes.dart';
import 'util/ThemeUtils.dart';
import 'widgets/AppDrawer.dart';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    //设置Android头部的导航栏透明
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final appBarTitles = ['资讯', '热榜', '日报', '图库'];
  Color themeColor = ThemeUtils.currentColorTheme;
  int _tabIndex = 0;
  var _body;
  var pages;

  @override
  void initState() {
    super.initState();
    App.getColorThemeIndex().then((index) {
      if (index != null) {
        ThemeUtils.currentColorTheme = ThemeUtils.supportColors[index];
        App.eventBus.fire(ChangeThemeEvent(ThemeUtils.supportColors[index]));
      }
    });
    App.eventBus.on<ChangeThemeEvent>().listen((event) {
      setState(() {
        themeColor = event.color;
      });
    });
    pages = <Widget>[
      NewsPage(),
      TopListPage(),
      DailyPage(),
      ImagePage(),
    ];
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _body = IndexedStack(
      children: pages,
      index: _tabIndex,
    );
    return MaterialApp(
      theme: ThemeData(primaryColor: themeColor),
      home: Scaffold(
        appBar: _tabIndex == 1
            ? null
            : AppBar(
                title: Text(appBarTitles[_tabIndex],
                    style: TextStyle(color: Colors.white)),
                iconTheme: IconThemeData(color: Colors.white),
                centerTitle: true,
              ),
        body: _body,
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.toys), title: Text(appBarTitles[0])),
            BottomNavigationBarItem(
                icon: Icon(Icons.whatshot), title: Text(appBarTitles[1])),
            BottomNavigationBarItem(
                icon: Icon(Icons.description), title: Text(appBarTitles[2])),
            BottomNavigationBarItem(
                icon: Icon(Icons.photo), title: Text(appBarTitles[3])),
          ],
          currentIndex: _tabIndex,
          onTap: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
        ),
        drawer: _tabIndex == 0 ? AppDrawer() : null,
      ),
      onGenerateRoute: myGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
