import 'dart:convert';
import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import '../api/Api.dart';
import '../bean/news_banner_bean_entity.dart';
import '../bean/news_list_data_bean_entity.dart';
import '../item/NewsListDataItem.dart';
import '../util/NetUtils.dart';
import '../widgets/BannerWidget.dart';
import '../widgets/ListViewWidget.dart';
import '../widgets/LoadingWidget.dart';

class NewsPage extends StatefulWidget {
  NewsPage({Key key}) : super(key: key);

  @override
  _NewsPageState createState() {
    return _NewsPageState();
  }
}

class _NewsPageState extends State<NewsPage> {
  List<NewsBannerBeanData> bannerData;
  int curPage = 0;
  ScrollController _controller = ScrollController();
  bool showToTopBtn = false;

  @override
  void initState() {
    super.initState();
    getBanner();
    _controller.addListener(() {
      if (_controller.offset < 200 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 200 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  void getBanner() {
    NetUtils.get(
        url: Api.banner,
        onCallBack: (value) {
          if (value != null) {
            setState(() {
              bannerData =
                  NewsBannerBeanEntity.fromJson(json.decode(value)).data;
            });
          }
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (bannerData != null) {
      return Scaffold(
        body: InfiniteListView<NewsListDataBeanDataData>(
          headerBuilder: (list, context) {
            return BannerWidget(bannerData);
          },
          itemBuilder: (List<NewsListDataBeanDataData> list, int index,
              BuildContext ctx) {
            return NewsListDataItem(list[index]);
          },
          onRetrieveData:
              (int page, List<NewsListDataBeanDataData> items, bool refresh) {
            return Future(() async {
              if (refresh) {
                setState(() {
                  items.clear();
                  curPage = 0;
                  getBanner();
                });
              }
              String url = Api.newsList;
              url += "$curPage/json";
              await NetUtils.get(
                  url: url,
                  onCallBack: (value) {
                    if (value != null) {
                      List<NewsListDataBeanDataData> data =
                          NewsListDataBeanEntity.fromJson(json.decode(value))
                              .data
                              .datas;
                      if (data.length == 0) {
                        return;
                      }
                      setState(() {
                        items.addAll(data);
                        curPage++;
                      });
                    }
                  });
              return true;
            });
          },
          loadingBuilder: ListViewWidget.loadingWidget,
          noMoreViewBuilder: ListViewWidget.noMoreViewWidget,
          scrollController: _controller,
        ),
        floatingActionButton: !showToTopBtn
            ? null
            : FloatingActionButton(
                child: Icon(Icons.arrow_upward),
                onPressed: () {
                  _controller.animateTo(.0,
                      duration: Duration(milliseconds: 200),
                      curve: Curves.ease);
                }),
      );
    } else {
      return LoadingWidget();
    }
  }
}
