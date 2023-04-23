import 'dart:io';
import 'package:flutter/material.dart';
import 'package:zw_/config/screen_util.dart';
import 'package:zw_/pages/user_login/networking/user_networking.dart';
import 'package:zw_/router/router_manager.dart';
import 'package:zw_/utils/zw_hud.dart';
import 'package:zw_/generated/l10n.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zw_/pages/user_login/user_info/user_info.dart';
import 'package:zw_/utils/local_cache.dart';
import 'crop_image_page.dart';

class ModifyUserInfoWidget extends StatefulWidget {
  ModifyUserInfoWidget({ Key? key,}) :super(key: key);

  @override
  _ModifyUserInfoWidgetState createState() => _ModifyUserInfoWidgetState();
}

class _ModifyUserInfoWidgetState extends State<ModifyUserInfoWidget> {
  TextEditingController _avatarController = TextEditingController();
  TextEditingController _nickNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

  // ImagePicker获取内容后返回的对象是XFile
  XFile? image;
  List<XFile>? imageList;
  XFile? video;
// 使用ImagePicker前必须先实例化
  final ImagePicker _imagePicker = ImagePicker();

  late String iconUrl="";


  @override
  void initState() {
    super.initState();
    UserInfo userInfo = UserInfo.user();
    iconUrl = "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw%2F80b51c9c-88af-4fea-916c-559a17902c29%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1684874341&t=c8d273935f8fb7e0c8f3ad740babe9d4";
    _phoneNumberController.text = userInfo.mobilephone;
    _nickNameController.text = userInfo.username;
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          backgroundColor: Colors.white54,
          body: _body(),
        ),
    );
  }

  SingleChildScrollView _body() {
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: ScreenUtil().screenHeight/5),
          child: Stack(
            children: <Widget>[
              Positioned(
                child: Container(
                  decoration: BoxDecoration(color: Colors.white,borderRadius:BorderRadius.all(Radius.circular(5))),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 23),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(S.current.modify_user_info,style: TextStyle(fontSize: 14,color: Color(0XFF333333),fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none),
                        ),
                      ),
                      // SizedBox(height: 10,),
                      // Container(
                      //   padding: EdgeInsets.symmetric(horizontal: 20),
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //         border: Border.all(color: Color(0xFFEEEEEE), width: 0.5),
                      //         borderRadius:BorderRadius.all(Radius.circular(4.0))
                      //     ),
                      //     child: TextField(
                      //         maxLines: 1,
                      //         maxLength: 100,
                      //         textInputAction: TextInputAction.done,
                      //         controller: _avatarController,
                      //         decoration: InputDecoration(
                      //           contentPadding: const EdgeInsets.all(10),
                      //           hintText: S.current.cancel_tips,
                      //           border: OutlineInputBorder(borderSide: BorderSide.none),
                      //           // hintStyle:
                      //         ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: 20,),
                      CircleAvatar(
                        backgroundImage: NetworkImage(iconUrl),
                        radius: 50.0,
                      ),
                      SizedBox(height:20),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFFEEEEEE), width: 0.5),
                              borderRadius:BorderRadius.all(Radius.circular(4.0))
                          ),
                          child: TextButton(
                              child: Text(
                                S.current.select_image,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey),
                              ),
                            onPressed: () {
                              selectImage();
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: <Widget>[
                            Text(S.current.nickname,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0XFF333333),
                                  decoration: TextDecoration.none),
                            ),
                            SizedBox(width:38,height: 20,),
                            Expanded(
                              child: Container(
                                height: 30.0,
                                width: 150.0,
                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(5)),),
                                child: TextField(
                                  controller: _nickNameController,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.black,fontSize: 14.0,),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(5),),
                                      borderSide: BorderSide(color: Color(0XFFEEEEEE), width: 1,),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0XFFEEEEEE), width: 1, ),
                                      borderRadius: BorderRadius.all(Radius.circular(5),),
                                    ),
                                    contentPadding: const EdgeInsets.all(0),hintStyle: TextStyle(fontSize: 12.0),
                                  ),
                                ),
                              ),
                            ),
                          // Text('test',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Color(0XFF333333),decoration: TextDecoration.none),
                          // ),
                          // Container(
                          //   padding: EdgeInsets.symmetric(horizontal: 26, vertical: 3),
                          //   decoration: BoxDecoration(
                          //       border: Border.all(width: 1, color: Color(0XFFEEEEEE)),
                          //       borderRadius:BorderRadius.all(Radius.circular(5))
                          //   ),
                          //   child: Text('test',
                          //     style: TextStyle(fontSize: 14,color: Color(0XFF333333),decoration: TextDecoration.none),
                          //   ),
                          // ),
                        ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: <Widget>[
                            Text(S.current.mobilephone,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0XFF333333),
                                  decoration: TextDecoration.none),
                            ),
                            SizedBox(width:10,height: 20,),
                            Expanded(
                              child: Container(
                                height: 30.0,
                                width: 150.0,
                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(5)),),
                                child: TextField(
                                  controller: _phoneNumberController,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.black,fontSize: 14.0,),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(5),),
                                      borderSide: BorderSide(color: Color(0XFFEEEEEE), width: 1,),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0XFFEEEEEE), width: 1, ),
                                      borderRadius: BorderRadius.all(Radius.circular(5),),
                                    ),
                                    contentPadding: const EdgeInsets.all(0),hintStyle: TextStyle(fontSize: 12.0),
                                  ),
                                ),
                              ),
                            ),
                            // Text('test',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Color(0XFF333333),decoration: TextDecoration.none),
                            // ),
                            // Container(
                            //   padding: EdgeInsets.symmetric(horizontal: 26, vertical: 3),
                            //   decoration: BoxDecoration(
                            //       border: Border.all(width: 1, color: Color(0XFFEEEEEE)),
                            //       borderRadius:BorderRadius.all(Radius.circular(5))
                            //   ),
                            //   child: Text('test',
                            //     style: TextStyle(fontSize: 14,color: Color(0XFF333333),decoration: TextDecoration.none),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: GestureDetector(
                          onTap: () {
                            UserNetworking.modifyUserInfo(_nickNameController.text,_avatarController.text,_phoneNumberController.text).then((value){
                              if(value){
                                Navigator.pop(context);
                              }
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            height: 30.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(0XFF2B95E9),
                              borderRadius:BorderRadius.all(Radius.circular(4.0)),
                              gradient: LinearGradient(colors: [Color(0xFFFF7F16),Color(0xFFEF3500)])
                            ),
                            child: Text(
                              S.current.save,
                              style: TextStyle(color: Colors.white, fontSize: 14.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )],
          )
      ),
    );
  }

  // 设置返回图片的其他参数
  selectImage() async {
    XFile? image = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 250,
      maxWidth: 250,
      imageQuality: 80,
    );
    if (image != null) this.image = image;
    cropImage2(image!);
    setState(() {});
  }

  selectCamera() async {
    XFile? photo = await _imagePicker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.rear,
    );
    if (photo != null) image = photo;
    setState(() {});
  }


  void cropImage(XFile originalImage) async {
    String filePath = originalImage.path;
    // String? result = await Navigator.push(context,
    //     MaterialPageRoute(builder: (context) => CropImageRoute(file)));
    String path = "${CROP_IMAGE_PAGE}?originalImage=${filePath}";
    RouterManager.jump(context, path).then((value){
      String result = value.toString();
      if (result.isEmpty) {
        print('上传失败');
      } else {
        //result是图片上传后拿到的url
        setState(() {
          iconUrl = result;
          print('上传成功：$iconUrl');
          // _upgradeRemoteInfo();//后续数据处理，这里是更新头像信息
        });
      }
    });
  }

  void cropImage2(XFile originalImage) async {
    String filePath = originalImage.path;
    File file = File(filePath);
    String? result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => CropImagePage(image: file,)));
      if (result !=null &&  result.isEmpty) {
        print('上传失败');
      } else {
        //result是图片上传后拿到的url
        setState(() {
          iconUrl = result!;
          print('上传成功：$iconUrl');
          // _upgradeRemoteInfo();//后续数据处理，这里是更新头像信息
        });
      }
    }
}