import 'dart:convert';
import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import '../api/Api.dart';
import '../bean/daily_list_data_bean_entity.dart';
import '../item/DailyListDataItem.dart';
import '../util/NetUtils.dart';
import '../widgets/ListViewWidget.dart';

class DailyPage extends StatefulWidget {
  DailyPage({Key key}) : super(key: key);

  @override
  _DailyPageState createState() {
    return _DailyPageState();
  }
}

class _DailyPageState extends State<DailyPage> {
  DateTime beforeDay = DateTime.now().add(Duration(days: 1));

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
    // TODO: implement build
    return InfiniteListView<DailyListDataBeanStory>(
      itemBuilder:
          (List<DailyListDataBeanStory> list, int index, BuildContext ctx) {
        return DailyListDataItem(list[index]);
      },
      onRetrieveData:
          (int page, List<DailyListDataBeanStory> items, bool refresh) {
        return Future(() async {
          if (refresh) {
            setState(() {
              items.clear();
              beforeDay = DateTime.now().add(Duration(days: 1));
            });
          }
          String url = Api.dailyList;
          url +=
              "${beforeDay.year}${beforeDay.month < 10 ? "0${beforeDay.month}" : beforeDay.month}${beforeDay.day < 10 ? "0${beforeDay.day}" : beforeDay.day}";
          await NetUtils.get(
              url: url,
              onCallBack: (value) {
                if (value != null) {
                  List<DailyListDataBeanStory> data =
                      DailyListDataBeanEntity.fromJson(json.decode(value))
                          .stories;
                  if (data.length == 0) {
                    return;
                  }
                  setState(() {
                    items.addAll(data);
                    beforeDay = beforeDay.add(Duration(days: -1));
                  });
                }
              });
          return true;
        });
      },
      loadingBuilder: ListViewWidget.loadingWidget,
      noMoreViewBuilder: ListViewWidget.noMoreViewWidget,
    );
  }
}
