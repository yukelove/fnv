import 'package:flutter/material.dart';
import 'package:zw_/generated/l10n.dart';
import 'package:zw_/components/app_bar.dart';
import 'package:zw_/pages/user_login/networking/user_networking.dart';
import 'package:zw_/router/router_manager.dart';

class ConserveEnergyConfigPage extends StatefulWidget {
  String serialnumber = "";
  ConserveEnergyConfigPage({Key? key,String serialnumber = ""}) : super(key: key){
    this.serialnumber = serialnumber;
  }

  @override
  State<ConserveEnergyConfigPage> createState() => _ConserveEnergyConfigPage();
}

class _ConserveEnergyConfigPage extends State<ConserveEnergyConfigPage> {
  TextEditingController textController = TextEditingController();
  String mobilePhone = "";
  String email = "";
  String password = "";
  String inviteCode = "";
  String model1 = "";
  String model1Switch = "";
  String model1Type = "";
  String model1Time ="";
  String model2 = "";
  String model2Switch = "";
  String model2Type = "";
  String model2Time ="";
  String model3 = "";
  String model3Switch = "";
  String model3Type = "";
  String model3Time ="";
  String model4 = "";
  String model4Switch = "";
  String model4Type = "";
  String model4Time ="";
  String model5 = "";
  String model5Switch = "";
  String model5Type = "";
  String model5Time ="";
  String model6 = "";
  String model6Switch = "";
  String model6Type = "";
  String model6Time ="";
  String model7 = "";
  String model7Switch = "";
  String model7Type = "";
  String model7Time ="";
  String model8 = "";
  String model8Switch = "";
  String model8Type = "";
  String model8Time ="";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: CustomAppBar(
          title: S.of(context).config,
          actionIcon: "",
          leadingCallBack: () {
            RouterManager.goBack(context);
          },
          actionCallBack: () {},
        ),
        preferredSize: Size.fromHeight(54),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 5, top: 30),
                child: Text(
                  S.of(context).power_supply_setting+":",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
            ],
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
                                hintText: S.of(context).mobilephone,
                                hintStyle: TextStyle(color: Colors.black),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                )),
                            // controller: textController,
                            onChanged: (value){
                              this.mobilePhone = value;
                            },
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
                                hintText: S.of(context).email,
                                hintStyle: TextStyle(color: Colors.black),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            onChanged: (value){
                              this.email = value;
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
                              this.password = value;
                            },
                          ),
                          SizedBox(
                            height: 40,
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
                                hintText: S.of(context).invitecode,
                                hintStyle: TextStyle(color: Colors.black),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                )),
                            onChanged: (value){
                              this.inviteCode = value;
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
                                    UserNetworking.userRegister(mobilePhone: this.mobilePhone,email: this.email,password: this.password,inviteCode: this.inviteCode).then((value) {
                                      if(value){
                                        Future.delayed(Duration(seconds: 2),(){
                                          RouterManager.jump(context, LOGIN_PAGE);
                                        });
                                      }
                                    });
                                  },
                                  child: Text(
                                    S.of(context).save,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
