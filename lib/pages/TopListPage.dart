import 'dart:convert';
import 'package:flutter/material.dart';
import '../bean/top_type_bean_entity.dart';
import '../item/TopListDataItem.dart';
import '../api/Api.dart';
import '../util/NetUtils.dart';

class TopListPage extends StatefulWidget {
  TopListPage({Key key}) : super(key: key);

  @override
  _TopListPageState createState() {
    return _TopListPageState();
  }
}

class _TopListPageState extends State<TopListPage> {
  final List<Tab> myTabs = <Tab>[];
  final List<String> ids = <String>[];

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<Null> _refreshData() async {
    setState(() {
      myTabs.clear();
      ids.clear();
    });
    getTopType();
  }

  void getTopType() {
    NetUtils.get(
        url: Api.topType,
        onCallBack: (value) {
          if (value != null) {
            List<TopTypeBeanData> topTypeBeanDatas =
                TopTypeBeanEntity.fromJson(json.decode(value)).data;
            for (var i = 0; i < topTypeBeanDatas.length; i++) {
              setState(() {
                myTabs.add(Tab(
                  text: topTypeBeanDatas[i].title,
                ));
                ids.add(topTypeBeanDatas[i].id);
              });
            }
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return myTabs.length == 0
        ? Scaffold(
            appBar: AppBar(
              title: Text("热榜", style: TextStyle(color: Colors.white)),
              iconTheme: IconThemeData(color: Colors.white),
              centerTitle: true,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {
                    _refreshData();
                  },
                )
              ],
            ),
            body: Center(
              child: Text("加载中..."),
            ),
          )
        : DefaultTabController(
            length: myTabs.length,
            child: Scaffold(
              appBar: AppBar(
                title: Text("热榜", style: TextStyle(color: Colors.white)),
                iconTheme: IconThemeData(color: Colors.white),
                centerTitle: true,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: () {
                      _refreshData();
                    },
                  )
                ],
                bottom: TabBar(
                  tabs: myTabs,
                  isScrollable: true,
                ),
              ),
              body: TabBarView(
                children: ids.map((String id) {
                  return TopListDataItem(id);
                }).toList(),
              ),
            ),
          );
  }
}
