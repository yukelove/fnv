import 'package:flutter/material.dart';
import 'package:zw_/components/app_bar.dart';
import 'package:zw_/components/info_list_item.dart';
import 'package:zw_/config/colors_config/color_config.dart';
import 'package:zw_/config/img_config/image_config.dart';
import 'package:zw_/config/screen_util.dart';
import 'package:zw_/router/router_manager.dart';

class EquipmentInfoEditPage extends StatefulWidget {
  EquipmentInfoEditPage({Key? key}) : super(key: key);

  @override
  State<EquipmentInfoEditPage> createState() => _EquipmentInfoEditPageState();
}

class _EquipmentInfoEditPageState extends State<EquipmentInfoEditPage> {
  List<Map<String, String>> items = [
    {
      "icon": ImageAssetsConfig.IMAGE_UPDATE_DEVICE,
      "name": "Update device name"
    },
    {
      "icon": ImageAssetsConfig.IMAGE_LIMITS_DISCHARGE,
      "name": "Limits discharge/charge"
    },
    {"icon": ImageAssetsConfig.IMAGE_AC_CHARGING, "name": "AC Charging rate"},
    {"icon": ImageAssetsConfig.IMAGE_CAR_CHARGE, "name": "Car charger"},
    {"icon": ImageAssetsConfig.IMAGE_BUZZER, "name": "Buzzer"},
    {"icon": ImageAssetsConfig.IMAGE_SCREEN, "name": "Screen Brightness"},
    {
      "icon": ImageAssetsConfig.IMAGE_STANDBY_TIME_OFF,
      "name": "Standby time of equipment"
    },
    {"icon": ImageAssetsConfig.IMAGE_UPDATE_DEVICE, "name": "Other"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: CustomAppBar(
          title: "Config",
          actionIcon: "",
          leadingCallBack: () {
            RouterManager.goBack(context);
          },
          actionCallBack: () {},
        ),
        preferredSize: Size.fromHeight(54),
      ),
      body: Container(
        color: ColorsRes.color_black12,
        child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              var map = items[index];
              var icon = map["icon"];
              var title = map["name"];
              return InfoListItem(
                icon: icon!,
                title: title!,
                itemClickCallBack: () {
                  //信息修改
                },
              );
            }),
      ),
    );
  }
}
