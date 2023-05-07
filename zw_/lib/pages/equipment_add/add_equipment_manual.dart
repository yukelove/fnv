import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zw_/config/screen_util.dart';
import 'package:zw_/router/router_manager.dart';
import 'package:zw_/utils/zw_hud.dart';
import 'package:zw_/generated/l10n.dart';
import 'package:zw_/pages/equipment_add/networking/equipment_add_networking.dart';
import 'package:zw_/utils/local_cache.dart';

class AddEquipmentManual extends StatefulWidget {
  AddEquipmentManual({ Key? key,}) :super(key: key);

  @override
  _AddEquipmentManualState createState() => _AddEquipmentManualState();
}

class _AddEquipmentManualState extends State<AddEquipmentManual> {
  TextEditingController _deviceNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
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
                        child: Text(S.current.add_device_manual,style: TextStyle(fontSize: 14,color: Color(0XFF333333),fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: <Widget>[
                            Text(S.current.input_device_number,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0XFF333333),
                                  decoration: TextDecoration.none),
                            ),
                            SizedBox(height: 20,),
                            Expanded(
                              child: Container(
                                height: 30.0,
                                width: 150.0,
                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(5)),),
                                child: TextField(
                                  controller: _deviceNumberController,
                                  textAlign: TextAlign.center,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))
                                  ],
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
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: GestureDetector(
                          onTap: () {
                            EquipmentAddNetworking.addEquipment(equipmentCode: _deviceNumberController.text).then((value){
                              if(value){
                                RouterManager.goBack(context);
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
                                gradient: LinearGradient(colors: [Colors.black,Colors.black])
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
}