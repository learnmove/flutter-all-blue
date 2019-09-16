import 'package:flutter/material.dart';
import '../application/App.dart';
import '../events/ChangeThemeEvent.dart';
import '../util/ThemeUtils.dart';

class ChangeThemePage extends StatefulWidget {
  ChangeThemePage({Key key}) : super(key: key);

  @override
  _ChangeThemePageState createState() {
    return _ChangeThemePageState();
  }
}

class _ChangeThemePageState extends State<ChangeThemePage> {
  List<Color> colors = ThemeUtils.supportColors;

  changeColorTheme(Color c) {
    App.eventBus.fire(ChangeThemeEvent(c));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('主题设置', style: TextStyle(color: Colors.white)),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Padding(
            padding: const EdgeInsets.all(4.0),
            child: GridView.count(
              crossAxisCount: 4,
              children: List.generate(colors.length, (index) {
                return InkWell(
                  onTap: () {
                    ThemeUtils.currentColorTheme = colors[index];
                    App.setColorTheme(index);
                    changeColorTheme(colors[index]);
                  },
                  child: Container(
                    color: colors[index],
                    margin: const EdgeInsets.all(3.0),
                  ),
                );
              }),
            )));
  }
}
