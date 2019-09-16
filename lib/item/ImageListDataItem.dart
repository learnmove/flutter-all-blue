import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_all_blue/widgets/ImageDownloadWidgets.dart';
import '../bean/image_list_data_bean_entity.dart';

class ImageListDataItem extends StatefulWidget {
  ImageListDataBeanData imageListDataBeanData;

  ImageListDataItem(this.imageListDataBeanData);

  @override
  _ImageListDataItemState createState() {
    return _ImageListDataItemState();
  }
}

class _ImageListDataItemState extends State<ImageListDataItem> {
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
      elevation: 5.0,
      child: InkWell(
        child: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Padding(
                child: CachedNetworkImage(
                  placeholder: (context, url) =>
                      Image.asset('images/loading.gif'),
                  imageUrl: widget.imageListDataBeanData.hpImgUrl,
                  fit: BoxFit.cover,
                ),
                padding: EdgeInsets.all(5.0),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  widget.imageListDataBeanData.hpContent,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
        onTap: () {
          showDialog<Null>(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return ImageDownloadWidgets(widget.imageListDataBeanData);
            },
          ).then((val) {
            print(val);
          });
        },
      ),
    );
  }
}
