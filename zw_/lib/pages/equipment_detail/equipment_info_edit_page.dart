import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zw_/generated/l10n.dart';
import 'package:zw_/components/app_bar.dart';
import 'package:zw_/components/info_list_item.dart';
import 'package:zw_/config/img_config/image_config.dart';
import 'package:zw_/pages/equipment_detail/cubit/equipment_detail_cubit.dart';
import 'package:zw_/pages/equipment_detail/state/equipment_detail_state.dart';
import 'package:zw_/pages/equipment_list/cubit/equipment_cubit.dart';
import 'package:zw_/pages/equipment_list/state/equipment_model.dart';
import 'package:zw_/pages/equipment_list/state/equipment_state.dart';
import 'package:zw_/router/router_manager.dart';
import 'package:zw_/utils/zw_hud.dart';

class EquipmentInfoEditPage extends StatefulWidget {
  String serialnumber = "";
  EquipmentInfoEditPage({Key? key, String serialnumber = ""})
      : super(key: key) {
    this.serialnumber = serialnumber;
  }

  @override
  State<EquipmentInfoEditPage> createState() => _EquipmentInfoEditPageState();
}

class _EquipmentInfoEditPageState extends State<EquipmentInfoEditPage> {
  List<Map<String, String>> items = [
    {
      "icon": ImageAssetsConfig.IMAGE_CONSERVE_ENERGY_CONFIG,
      "name": S.current.conserve_energy_config
    },
    {
      "icon": ImageAssetsConfig.IMAGE_CHARGE_CONFIG,
      "name": S.current.charge_config
    },
    {
      "icon": ImageAssetsConfig.IMAGE_UPDATE_DEVICE,
      "name": S.current.updatedevicename
    },
    {
      "icon": ImageAssetsConfig.IMAGE_LIMITS_DISCHARGE,
      "name": S.current.limitdischargeandcharge
    },
    {
      "icon": ImageAssetsConfig.IMAGE_AC_CHARGING,
      "name": S.current.acchargerate
    },
    {
      "icon": ImageAssetsConfig.IMAGE_CAR_CHARGE,
      "name": S.current.carcharge},
    {
      "icon": ImageAssetsConfig.IMAGE_BUZZER,
      "name": S.current.buzzer},
    {
      "icon": ImageAssetsConfig.IMAGE_SCREEN,
      "name": S.current.screenbrightness
    },
    {
      "icon": ImageAssetsConfig.IMAGE_STANDBY_TIME_OFF,
      "name": S.current.standbytime
    },
    {
      "icon": ImageAssetsConfig.IMAGE_UPDATE_DEVICE,
      "name": S.current.others
    },

  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        var model = EquipmentModel(
          serialnumber: widget.serialnumber,
          deviceenname: "",
          devicename: "",
          icon: "",
          dumpenergy: 0.0,
          sort: 0,
          status: 0,
        );
        return EquipmentDetailCubit(EquipmentDetailState(
            serialnumber: widget.serialnumber, model: model,isEditInfo: true));
      },
      lazy: false,
      child: BlocBuilder<EquipmentDetailCubit, EquipmentDetailState>(
        builder: (ctx, state) {
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
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    // var map = items[index];
                    // var icon = map["icon"];
                    // var title = map["name"];
                    // return InfoListItem(
                    //   icon: icon!,
                    //   title: title!,
                    //   itemClickCallBack: () {
                    //     //信息修改
                    //     print("Click item !");
                    //   },
                    // );
                    return getItem(this.widget.serialnumber,index);
                  }),
            ),
          );
        },
      ),
    );
  }

  Widget  getItem(var serialnumber,int index){
    var m = items[index];
    return GestureDetector(
        child:Container(
        height:40,
        // child:Text(title.toString()),
          child: InfoListItem(
            icon: m["icon"].toString(),
            title: m["name"].toString(),
          ),
        ),
        //item 点击事件
        onTap: (){
          print("点击到第"+index.toString()+"-"+serialnumber.toString());
          setState(() {
          onItemClick(serialnumber,index);
          });
        },
        //item 长按事件
        onLongPress: (){
          setState(() {
            _onItemLongPressed(serialnumber,index);
          });
          print("长按"+index.toString());
        }
    );
  }

  void  onItemClick(var serialnumber,int index){
    setState(() {
      var m = items[index];
      print("--"+m["icon"].toString());
      print("conserve_energy_config".toString() == m["icon"].toString());
      if("conserve_energy_config".toString() == m["icon"].toString()){
        //进入运行节能供电配置界面
        String path = "${CONSERVE_ENERGY_CONFIG_FORM_PAGE}?serialnumber=${serialnumber}";
        RouterManager.jump(context, path);
      }else if("charge_config".toString() == m["icon"].toString()){
        //进入电池充电配置界面
        String path = "${CHARGE_CONFIG_FORM_PAGE}?serialnumber=${serialnumber}";
        RouterManager.jump(context, path);
      }else{
        showCustomDialog(context, index);
      }
    });

  }

  ///* item长按

  void _onItemLongPressed(var serialnumber,int index) {
    ZWHud.showText("你长安了第"+index.toString()+"条数据");
  }

  void showCustomDialog(BuildContext context,int position ){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
            title:new Text("点击提示"),
            content:new SingleChildScrollView(
                child:new ListBody(children: [new Text("${"开发中，敬请期待!"+position.toString()}")])),
            actions: [
              new TextButton(
                child:new Text("取消"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new TextButton(
                child:new Text("确认"),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

}
