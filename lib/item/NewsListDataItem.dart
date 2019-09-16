import 'package:flutter/material.dart';
import '../bean/news_list_data_bean_entity.dart';

class NewsListDataItem extends StatefulWidget {
  NewsListDataBeanDataData itemData;

  NewsListDataItem(this.itemData);

  @override
  _NewsListDataItemState createState() {
    return _NewsListDataItemState();
  }
}

class _NewsListDataItemState extends State<NewsListDataItem> {
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
    Row author = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
            child: Row(
          children: <Widget>[
            Text('作者:  '),
            Text(
              widget.itemData.author,
              style: TextStyle(color: Theme.of(context).accentColor),
            ),
          ],
        )),
      ],
    );

    Row title = Row(
      children: <Widget>[
        Expanded(
          child: Text.rich(
            TextSpan(text: widget.itemData.title),
            softWrap: true,
            style: TextStyle(fontSize: 16.0, color: Colors.black),
            textAlign: TextAlign.left,
          ),
        )
      ],
    );

    Row chapterName = Row(
      children: <Widget>[
        Expanded(
          child: Text(
            widget.itemData.chapterName,
            softWrap: true,
            style: TextStyle(color: Theme.of(context).accentColor),
            textAlign: TextAlign.left,
          ),
        ),
        Text(
          widget.itemData.niceDate,
          style: TextStyle(color: Theme.of(context).accentColor),
        )
      ],
    );

    Column column = Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          child: author,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
          child: title,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          child: chapterName,
        ),
      ],
    );

    return Card(
      elevation: 4.0,
      child: InkWell(
        child: column,
        onTap: () {
          Navigator.pushNamed(context, '/newsDetailsPage', arguments: {
            "title": widget.itemData.title,
            "url": widget.itemData.link,
          });
        },
      ),
    );
  }
}
