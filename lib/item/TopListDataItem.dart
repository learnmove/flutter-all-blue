import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../bean/top_list_data_bean_entity.dart';
import '../api/Api.dart';
import '../util/NetUtils.dart';

class TopListDataItem extends StatefulWidget {
  String id;

  TopListDataItem(this.id);

  @override
  _TopListDataItemState createState() {
    return _TopListDataItemState();
  }
}

class _TopListDataItemState extends State<TopListDataItem>
    with AutomaticKeepAliveClientMixin {
  List<TopListDataBeanData> topListDataBeanDatas = List();

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
      topListDataBeanDatas.clear();
    });
    getTopInfo();
  }

  void getTopInfo() {
    NetUtils.get(
        url: Api.topInfo + widget.id,
        onCallBack: (value) {
          if (value != null) {
            setState(() {
              topListDataBeanDatas =
                  TopListDataBeanEntity.fromJson(json.decode(value)).data;
            });
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    RegExp exp = RegExp(r'.+(.JPEG|.jpeg|.JPG|.jpg|.gif)$');
    RegExp exphttp = RegExp(r'^http');
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: topListDataBeanDatas.length == 0
          ? Center(
              child: Text("加载中..."),
            )
          : ListView.builder(
              itemCount: topListDataBeanDatas.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  child: Card(
                    elevation: 3.0,
                    child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: exp.hasMatch(topListDataBeanDatas[index].url)
                            ? (exphttp.hasMatch(topListDataBeanDatas[index].url)
                                ? CachedNetworkImage(
                                    placeholder: (context, url) =>
                                        Image.asset('images/placeholder.gif'),
                                    imageUrl: topListDataBeanDatas[index].url,
                                  )
                                : CachedNetworkImage(
                                    placeholder: (context, url) =>
                                        Image.asset('images/placeholder.gif'),
                                    imageUrl:
                                        "http:${topListDataBeanDatas[index].url}",
                                  ))
                            : ListTile(
                                title: Text(
                                    "${topListDataBeanDatas[index].title}"),
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/newsDetailsPage',
                                      arguments: {
                                        "title":
                                            topListDataBeanDatas[index].title,
                                        "url": topListDataBeanDatas[index].url,
                                      });
                                },
                              )),
                  ),
                  padding: EdgeInsets.all(5.0),
                );
              },
            ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
