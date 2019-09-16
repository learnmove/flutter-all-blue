import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class NewsDetailsPage extends StatefulWidget {
  final arguments;

  NewsDetailsPage({this.arguments});

  @override
  _NewsDetailsPageState createState() {
    return _NewsDetailsPageState();
  }
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {
  String title;
  String url;
  bool loaded = false;
  final flutterWebViewPlugin = FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();
    title = widget.arguments['title'];
    url = widget.arguments['url'];
    // 监听WebView的加载事件
    flutterWebViewPlugin.onStateChanged.listen((state) {
      print("state: ${state.type}");
      if (state.type == WebViewState.finishLoad) {
        // 加载完成
        setState(() {
          loaded = true;
        });
      }
    });
  }

  @override
  void dispose() {
    flutterWebViewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: this.url,
      appBar: AppBar(
        title: Text(
          this.title,
          overflow: TextOverflow.ellipsis,
          softWrap: false,
        ),
        iconTheme: IconThemeData(color: Colors.white),
        actions: <Widget>[
          Container(
            child: !loaded
                ? CupertinoActivityIndicator()
                : IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: () {
                      setState(() {
                        loaded = false;
                      });
                      flutterWebViewPlugin.reloadUrl(this.url);
                    },
                  ),
            margin: EdgeInsets.fromLTRB(2.0, 0, 10.0, 0),
          )
        ],
      ),
      withZoom: true,
      withLocalStorage: true,
      withJavascript: true,
    );
  }
}
