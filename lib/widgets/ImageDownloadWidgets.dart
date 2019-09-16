import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_all_blue/bean/image_list_data_bean_entity.dart';

class ImageDownloadWidgets extends StatefulWidget {
  ImageListDataBeanData imageListDataBeanData;

  ImageDownloadWidgets(this.imageListDataBeanData);

  @override
  _ImageDownloadWidgetsState createState() {
    return _ImageDownloadWidgetsState();
  }
}

class _ImageDownloadWidgetsState extends State<ImageDownloadWidgets> {
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
    return AlertDialog(
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Card(
              child: CachedNetworkImage(
                imageUrl: widget.imageListDataBeanData.hpImgUrl,
              ),
              elevation: 6.0,
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                widget.imageListDataBeanData.hpContent,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
//        Padding(
//          child: FlatButton.icon(
//            icon: Icon(Icons.file_download),
//            label: Text("下载"),
//            onPressed: () {},
//          ),
//          padding: EdgeInsets.all(10.0),
//        )
      ],
    );
  }
}
