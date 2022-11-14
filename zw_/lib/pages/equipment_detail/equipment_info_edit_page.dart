import 'package:flutter/material.dart';
import 'package:zw_/generated/l10n.dart';
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
      "name": S.current.updatedevicename
    },
    {
      "icon": ImageAssetsConfig.IMAGE_LIMITS_DISCHARGE,
      "name": S.current.limitdischargeandcharge
    },
    {"icon": ImageAssetsConfig.IMAGE_AC_CHARGING,
      "name": S.current.acchargerate},
    {"icon": ImageAssetsConfig.IMAGE_CAR_CHARGE,
      "name": S.current.carcharge},
    {"icon": ImageAssetsConfig.IMAGE_BUZZER, "name": S.current.buzzer},
    {"icon": ImageAssetsConfig.IMAGE_SCREEN, "name": S.current.screenbrightness},
    {
      "icon": ImageAssetsConfig.IMAGE_STANDBY_TIME_OFF,
      "name": S.current.standbytime
    },
    {"icon": ImageAssetsConfig.IMAGE_UPDATE_DEVICE, "name": S.current.others},
  ];

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
