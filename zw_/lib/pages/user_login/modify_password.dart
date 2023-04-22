import 'package:flutter/material.dart';
import 'package:zw_/generated/l10n.dart';
import 'package:zw_/config/img_config/image_assets.dart';
import 'package:zw_/config/img_config/image_config.dart';
import 'package:zw_/config/screen_util.dart';
import 'package:zw_/utils/zw_hud.dart';
import 'package:zw_/pages/user_login/networking/user_networking.dart';


class ModifyPassword extends StatefulWidget {
  ModifyPassword({Key? key}) : super(key: key);

  @override
  State<ModifyPassword> createState() => _ModifyPasswordState();
}

class _ModifyPasswordState extends State<ModifyPassword> {
  TextEditingController textController = TextEditingController();
  String mobilePhone = "";
  String email = "";
  String validateCode="";
  String password = "";
  String confirmPassword = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(
        S.of(context).modify_password
      ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 70),
            child: ImageAssets.image(
                imgName: ImageAssetsConfig.IMAGE_LOGO,
                size: Size(330.0.w, 85.0.w)),
          ),
          Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 35, right: 35),
                          child: Column(
                            children: [
                              TextField(
                                cursorColor: Colors.black,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                    hintText: S.of(context).emailorphonenumer,
                                    hintStyle: TextStyle(color: Colors.black),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    )),
                                // controller: textController,
                                onChanged: (value){
                                    if(value.contains("@")){
                                      this.email=value;
                                    }else{
                                      this.mobilePhone = value;
                                   }
                                },
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              GestureDetector(
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                                  child: TextButton(
                                      onPressed: () {
                                        if(mobilePhone.isNotEmpty || email.isNotEmpty){
                                          ZWHud.showLoading(S.current.toast_requesting);
                                          UserNetworking.getValidateCode(mobilePhone: this.mobilePhone,email: this.email).then((value) {
                                            if(value){
                                              ZWHud.showText(S.current.validate_code_send_success);
                                            }
                                          });
                                        }else{
                                          ZWHud.showText(S.current.mobilephone_email_need);
                                        }
                                      },
                                      child: Text(
                                        S.of(context).get_validate_code,
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      )),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              TextField(
                                cursorColor: Colors.black,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                    hintText: S.of(context).validate_code,
                                    hintStyle: TextStyle(color: Colors.black),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                                onChanged: (value){
                                  this.validateCode = value;
                                },
                              ),
                              SizedBox(
                                height: 30,
                              ),

                              TextField(
                                cursorColor: Colors.black,
                                style: TextStyle(color: Colors.black),
                                obscureText: true,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                    hintText: S.of(context).loginpassword,
                                    hintStyle: TextStyle(color: Colors.black),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                                onChanged: (value){
                                  setState(() {
                                    this.password = value;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              TextField(
                                cursorColor: Colors.black,
                                style: TextStyle(color: Colors.black),
                                obscureText: true,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                    hintText: S.of(context).new_password,
                                    hintStyle: TextStyle(color: Colors.black),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                                onChanged: (value){
                                  setState(() {
                                    this.confirmPassword = value;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              GestureDetector(
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                                  child: TextButton(
                                      onPressed: () {
                                        if(validateCode.isNotEmpty &&  password.isNotEmpty &&  confirmPassword.isNotEmpty){
                                          ZWHud.showLoading(S.current.toast_requesting);
                                          UserNetworking.modifyPassword(validateCode:this.validateCode,password:this.password, confirmPassword: confirmPassword).then((value) {
                                            if(value){
                                              ZWHud.showText(S.current.modify_password_success);
                                            }
                                          });
                                        }else{
                                          if(confirmPassword.isEmpty){
                                            ZWHud.showText(S.current.password_need);
                                          }else if(validateCode.isEmpty){
                                            ZWHud.showText(S.current.validate_code_need);
                                          }else if(password.isEmpty){
                                            ZWHud.showText(S.current.password_need);
                                          }
                                        }
                                      },
                                      child: Text(
                                        S.current.modify_password,
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        )
                      ]
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}