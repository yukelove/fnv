import 'package:flutter/material.dart';
import 'package:zw_/config/screen_util.dart';
import 'package:zw_/pages/user_login/networking/user_networking.dart';
import 'package:zw_/router/router_manager.dart';
import 'package:zw_/utils/zw_hud.dart';
import 'package:zw_/generated/l10n.dart';

class AccountCancelWidget extends StatefulWidget {
  AccountCancelWidget({ Key? key,}) :super(key: key);

  @override
  _AccountCancelWidgetState createState() => _AccountCancelWidgetState();
}

class _AccountCancelWidgetState extends State<AccountCancelWidget> {
  TextEditingController _decController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();

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
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: ScreenUtil().screenHeight/ 3),
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
                        child: Text(S.current.cancel_reason,style: TextStyle(fontSize: 14,color: Color(0XFF333333),fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFFEEEEEE), width: 0.5),
                              borderRadius:BorderRadius.all(Radius.circular(4.0))
                          ),
                          child: TextField(
                              maxLines: 4,
                              maxLength: 100,
                              textInputAction: TextInputAction.done,
                              controller: _decController,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10),
                                hintText: S.current.cancel_tips,
                                border: OutlineInputBorder(borderSide: BorderSide.none),
                                // hintStyle:
                              )
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(children: <Widget>[
                          Text(S.current.loginpassword,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0XFF333333),
                                decoration: TextDecoration.none),
                          ),
                          Expanded(child: Container(
                            height: 30.0,
                            width: 150.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(5)), //边角为5
                            ),
                            child: TextField(
                              controller: _pwdController,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black,fontSize: 14.0,),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(/*边角*/
                                  borderRadius: BorderRadius.all(Radius.circular(5), //边角为5
                                  ),
                                  borderSide: BorderSide(color: Color(0XFFEEEEEE), //边线颜色为白色
                                    width: 1, //边线宽度为2
                                  ),),
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0XFFEEEEEE), //边框颜色为白色
                                  width: 1, //宽度为5
                                ),borderRadius: BorderRadius.all(Radius.circular(5), //边角为30
                                ),
                                ),
                                contentPadding: const EdgeInsets.all(0),hintStyle: TextStyle(fontSize: 12.0),
                              ),
                            ),
                          ),),
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
                          onTap: () {//
                            print(_pwdController.text);
                            if(_pwdController.text.isEmpty){
                                ZWHud.showText(S.current.password_need);
                            }else {
                              UserNetworking.accountCancel(_pwdController.text,_decController.text).then((value){
                                if(value){
                                  RouterManager.logOut(context, LOGIN_PAGE);
                                }
                              });
                              // Navigator.pop(context);
                            }
                          },
                          child: Container(width: double.infinity,height: 30.0,alignment: Alignment.center,decoration: BoxDecoration(color: Color(0XFF2B95E9),
                              borderRadius:BorderRadius.all(Radius.circular(4.0)),
                              //
                              gradient: LinearGradient(colors: [
                                Colors.black,
                                Colors.black
                              ]
                              )
                          ),
                            child: Text(S.current.accountcancel,
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
}