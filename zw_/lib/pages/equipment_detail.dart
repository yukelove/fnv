import 'package:flutter/material.dart';


class EquipmentDetail extends StatefulWidget {
  EquipmentDetail({Key? key}) : super(key: key);

  @override
  State<EquipmentDetail> createState() => _EquipmentDetailState();
}

class _EquipmentDetailState extends State<EquipmentDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("设备详情页"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Text("设备详情"),
        ),
      ),
    );
  }
}