import 'dart:io';
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_all_blue/bean/image_list_data_bean_entity.dart';
import 'package:flutter_all_blue/util/ThemeUtils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

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
    PermissionHandler().requestPermissions(<PermissionGroup>[
      PermissionGroup.storage, // 添加文件存储权限
    ]);
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
        Padding(
          child: FlatButton.icon(
            icon: Icon(Icons.file_download),
            label: Text("下载"),
            onPressed: _getHttp,
          ),
          padding: EdgeInsets.all(10.0),
        )
      ],
    );
  }

  _getHttp() async {
    var response = await Dio().get(widget.imageListDataBeanData.hpImgUrl,
        options: Options(responseType: ResponseType.bytes));
    final result =
        await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    bool isSuccess = false;
    if (Platform.isIOS) {
      isSuccess = result;
    } else if (Platform.isAndroid) {
      if (result != "" || result != null) isSuccess = true;
    }
    if (isSuccess) {
      Fluttertoast.showToast(
          msg: "下载成功",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: ThemeUtils.currentColorTheme,
          fontSize: 15.0);
    }
  }
}
