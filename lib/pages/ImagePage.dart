import 'dart:convert';
import 'package:flutter/material.dart';
import '../bean/image_list_data_bean_entity.dart';
import '../item/ImageListDataItem.dart';
import '../api/Api.dart';
import '../util/NetUtils.dart';

class ImagePage extends StatefulWidget {
  ImagePage({Key key}) : super(key: key);

  @override
  _ImagePageState createState() {
    return _ImagePageState();
  }
}

class _ImagePageState extends State<ImagePage> {
  ScrollController _scrollController = ScrollController();
  int _imageId = 0;
  List<ImageListDataBeanData> _imageList = List();
  static int index = 0;

  @override
  void initState() {
    super.initState();
    _getPostData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _addMoreData();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 2,
        ),
        itemCount: _imageList.length,
        controller: _scrollController,
        itemBuilder: (context, index) => ImageListDataItem(_imageList[index]),
      ),
    );
  }

  // 下拉刷新数据
  Future<Null> _refreshData() async {
    setState(() {
      _imageId = 0;
      _imageList.clear();
    });
    index = 0;
    _getPostData();
  }

  // 上拉加载数据
  Future<Null> _addMoreData() async {
    index = 0;
    _getPostData();
  }

  void _getPostData() async {
    if (_imageId == -1) {
      return;
    }
    var url = Api.imageList + "$_imageId";
    await NetUtils.get(
        url: url,
        onCallBack: (value) {
          if (value != null) {
            ImageListDataBeanData imageListDataBeanData =
                ImageListDataBeanEntity.fromJson(json.decode(value)).data;
            if (imageListDataBeanData != null) {
              setState(() {
                _imageList.add(imageListDataBeanData);
              });
            }
            if (_imageId == 0) {
              _imageId = int.parse(imageListDataBeanData.hpcontentId) - 1;
            } else {
              _imageId--;
            }
          }
        });
    index++;
    print(_imageId);
    if (index > 6 && _imageList.length>5) {
      return;
    }
    _getPostData();
  }
}
