import 'package:flutter/material.dart';
import 'package:zw_/components/app_bar.dart';
import 'package:zw_/config/colors_config/color_config.dart';
import 'package:zw_/router/router_manager.dart';

class EquipmentAddPage extends StatefulWidget {
  EquipmentAddPage({Key? key}) : super(key: key);

  @override
  State<EquipmentAddPage> createState() => _EquipmentAddPageState();
}

class _EquipmentAddPageState extends State<EquipmentAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: CustomAppBar(
          title: "添加设备",
          leadingCallBack: () {
            RouterManager.goBack(context);
          },
        ),
        preferredSize: Size.fromHeight(54),
      ),
      body: Container(
        child: Column(
          children: [
            Container()
          ],
        ),
      ),
    );
  }
}
