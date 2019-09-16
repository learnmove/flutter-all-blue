import 'package:cached_network_image/cached_network_image.dart';
import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  List data;

  BannerWidget(this.data);

  @override
  _BannerWidgetState createState() {
    return _BannerWidgetState();
  }
}

class _BannerWidgetState extends State<BannerWidget> {
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
    List<Widget> items = [];

    if (widget.data != null && widget.data.length > 0) {
      for (var i = 0; i < widget.data.length; i++) {
        var item = widget.data[i];
        var imgUrl = item.imagePath;
        var title = item.title;
        var link = item.url;
        items.add(GestureDetector(
          child: Stack(
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: imgUrl,
                fit: BoxFit.fill,
              ),
              Align(
                alignment: FractionalOffset.bottomCenter,
                child: new Container(
                  width: 1000.0,
                  color: const Color(0x50000000),
                  padding: const EdgeInsets.all(5.0),
                  child: new Text(title,
                      style:
                          new TextStyle(color: Colors.white, fontSize: 15.0)),
                ),
              ),
            ],
          ),
          onTap: () {
            Navigator.pushNamed(context, '/newsDetailsPage', arguments: {
              "title": title,
              "url": link,
            });
          },
        ));
      }
    }

    return Padding(
      child: AspectRatio(
        aspectRatio: 16.0 / 9.0,
        child: SizedBox(
          child: Swiper(
            speed: 400,
            indicatorAlignment: AlignmentDirectional.topEnd,
            circular: true,
            indicator: NumberSwiperIndicator(),
            children: items,
          ),
          height: 200.0,
        ),
      ),
      padding: EdgeInsets.all(5.0),
    );
  }
}

class NumberSwiperIndicator extends SwiperIndicator {
  @override
  Widget build(BuildContext context, int index, int itemCount) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black45, borderRadius: BorderRadius.circular(20.0)),
      margin: EdgeInsets.only(top: 10.0, right: 5.0),
      padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
      child: Text("${++index}/$itemCount",
          style: TextStyle(color: Colors.white70, fontSize: 11.0)),
    );
  }
}

class Data {
  String title;
  String imagePath;
  String url;

  Data(this.title, this.imagePath, this.url);
}
