import 'package:flutter/material.dart';

class ImageAssets {

  static String getImgPath(String pathName, {String suffix: "png"}) =>
      "images/$pathName.$suffix";

  static Image image({required String imgName,Size? size}){
    String imgPath = ImageAssets.getImgPath(imgName);
    return Image.asset(imgPath,width: size?.width,height: size?.height,);
  }
  
  
}