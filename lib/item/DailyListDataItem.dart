import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../bean/daily_list_data_bean_entity.dart';

class DailyListDataItem extends StatefulWidget {
  DailyListDataBeanStory itemData;

  DailyListDataItem(this.itemData);

  @override
  _DailyListDataItemState createState() {
    return _DailyListDataItemState();
  }
}

class _DailyListDataItemState extends State<DailyListDataItem> {
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
    return Card(
      elevation: 4.0,
      child: InkWell(
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Padding(
                child: Text(widget.itemData.title,
                    style: TextStyle(
                      fontSize: 18.0,
                    )),
                padding: EdgeInsets.fromLTRB(10.0, 0, 5.0, 0),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: CachedNetworkImage(
                  imageUrl: widget.itemData.images[0],
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.pushNamed(context, '/newsDetailsPage', arguments: {
            "title": widget.itemData.title,
            "url": widget.itemData.url,
          });
        },
      ),
    );
  }
}
