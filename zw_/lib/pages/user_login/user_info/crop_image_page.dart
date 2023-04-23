import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:zw_/pages/model/upload_result.dart';
import 'package:zw_/config/screen_util.dart';
import 'package:image_crop/image_crop.dart';

class CropImagePage extends StatefulWidget {

  // String filePath = "";
  late File image; //原始图片路径
  CropImagePage({Key? key,required this.image}) : super(key: key);
  //     :super(key: key){
  //   // this.filePath = filePath;
  //   // this.image = File(filePath);
  // }

  @override
  State<CropImagePage> createState() => new _CropImagePageState();
}

class _CropImagePageState extends State<CropImagePage> {
  late double baseLeft; //图片左上角的x坐标
  late double baseTop; //图片左上角的y坐标
  late double imageWidth; //图片宽度，缩放后会变化
  double imageScale = 1; //图片缩放比例
  late Image imageView;
  final cropKey = GlobalKey<CropState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: ScreenUtil().screenHeight,
          width: ScreenUtil().screenWidth,
          color: Colors.grey,
          child: Column(
            children: <Widget>[
              Container(
                height: ScreenUtil().screenHeight * 0.8,
                child: Crop.file(
                  widget.image,
                  key: cropKey,
                  aspectRatio: 1.0,
                  alwaysShowGrid: true,
                ),
              ),
              TextButton(
                onPressed: () {
                  _crop(widget.image);
                },
                child: Text('ok'),
              ),
            ],
          ),
        ));
  }

  Future<void> _crop(File originalFile) async {
    final crop = cropKey.currentState;
    final area = crop!.area;
    if (area == null) {
      //裁剪结果为空
      print('裁剪不成功');
    }
    await ImageCrop.requestPermissions().then((value) {
      if (value) {
        ImageCrop.cropImage(
          file: originalFile,
          area: crop.area as Rect,
        ).then((value) {
          upload(value);
        }).catchError(() {
          print('裁剪不成功');
        });
      } else {
        upload(originalFile);
      }
    });
  }

  ///上传头像
  void upload(File file) {
    print(file.path);
    Dio dio = Dio();
    print("调用上传文件服务");
    Navigator.pop(context, file.path);
    // dio.post("http://your ip:port/",data: FormData.fromMap({'file': file})).then((response) {
    //   if (!mounted) {
    //     return;
    //   }
    //   Map responseData = response.data as Map;
    //   //处理上传结果
    //   UploadIconResult bean = UploadIconResult.uploadIconData(responseData);
    //   print('上传头像结果 $bean');
    //   if (bean.code == '1') {
    //     Navigator.pop(context, bean.data.url);//这里的url在上一页调用的result可以拿到
    //   } else {
    //     Navigator.pop(context, '');
    //   }
    // });

  }
}