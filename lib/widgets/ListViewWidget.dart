import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';

class ListViewWidget {
  static Widget loadingWidget(context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedRotationBox(
            duration: Duration(milliseconds: 500),
            child: GradientCircularProgressIndicator(
              radius: 10.0,
              colors: [Colors.blue, Colors.lightBlue[50]],
              value: .8,
              backgroundColor: Colors.transparent,
              strokeCapRound: true,
            ),
          ),
          Text("  加载更多...")
        ],
      ),
    );
  }

  static Widget noMoreViewWidget(list, context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "ヾ(･ε･｀*)人家也是有底线的~",
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
