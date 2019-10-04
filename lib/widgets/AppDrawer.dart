import 'package:flutter/material.dart';
import '../util/ThemeUtils.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: Container(
        child: ListView(
          padding: EdgeInsets.only(top: 0),
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('joudev'),
              accountEmail: Text('joudev@qq.com'),
              currentAccountPicture: InkWell(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                  ),
                  onTap: () {}),
              decoration: BoxDecoration(
                color: ThemeUtils.currentColorTheme,
              ),
            ),
            Divider(),
            ListTile(
                title: Text("主题设置"),
                leading: Icon(Icons.color_lens),
                trailing: Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, '/theme');
                }),
            Divider(),
          ],
        ),
      ),
    );
  }
}
