import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  LoadingWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AnimatedRotationBox(
            child: GradientCircularProgressIndicator(
              radius: 15.0,
              colors: [Colors.red[300], Colors.orange, Colors.grey[50]],
              value: .8,
              backgroundColor: Colors.transparent,
            ),
          ),
          Text("loading"),
        ],
      ),
    );
  }
}
