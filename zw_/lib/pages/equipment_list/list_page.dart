import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zw_/generated/l10n.dart';
import 'package:zw_/components/app_bar.dart';
import 'package:zw_/config/font_config/font_config.dart';
import 'package:zw_/config/img_config/image_config.dart';
import 'package:zw_/config/screen_util.dart';
import 'package:zw_/config/spacer_config/SpacerConfig.dart';
import 'package:zw_/pages/equipment_list/cubit/equipment_cubit.dart';
import 'package:zw_/pages/equipment_list/networking/equipment_networking.dart';
import 'package:zw_/pages/equipment_list/state/equipment_state.dart';
import 'package:zw_/pages/equipment_list/widgets/equipment_grid_item.dart';
import 'package:zw_/router/router_manager.dart';
import 'package:zw_/pages/equipment_add/networking/equipment_add_networking.dart';

class ListPage extends StatefulWidget {
  ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late EquipmentCubit cubit;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (_) {
        return EquipmentCubit(EquipmentState(list: []));
      },
      child: BlocBuilder<EquipmentCubit, EquipmentState>(
        builder: (ctx, state) {
          cubit = BlocProvider.of<EquipmentCubit>(ctx);
          return Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(54),
                child: CustomAppBar(
                  title: S.of(context).devicelist,
                  leadingIcon: ImageAssetsConfig.IMAGE_USRE,
                  actionIcon: ImageAssetsConfig.IMAGE_PLUS,
                  leadingCallBack: () {
                    //用户信息
                    RouterManager.jump(context, USER_INFO_PAGE);
                  },
                  actionCallBack: () {
                    //添加设备
                    RouterManager.jump(context, EQUIPMENT_ADD_PAGE)
                        .then((value) {
                      //路由返回时添加设备
                      String equipmentCode = value["qrcode"] as String;
                      EquipmentAddNetworking.addEquipment(
                          equipmentCode: equipmentCode).then((val){
                            //添加完成后重新加载设备列表
                            cubit.getEquipmentList();
                          });
                      
                    });
                  },
                )),
            body: Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: SpacerConfig.SPACER_15(),
                        horizontal: SpacerConfig.SPACER_15()),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10.0.w),
                          child: Text(
                            S.of(context).device,
                            style: TextStyle(
                                fontSize: FontRes.font_sp16,
                                fontWeight: FontWeight.w800),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                        padding: EdgeInsets.symmetric(
                            horizontal: SpacerConfig.SPACER_15()),
                        itemCount: state.list.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.3,
                          // crossAxisSpacing: SpacerConfig.SPACER_10(),
                          // mainAxisSpacing: SpacerConfig.SPACER_10(),
                        ),
                        itemBuilder: (ctx, index) {
                          var model = state.list[index];
                          return EquipmentGridItem(
                            itemModel: model,
                            itemClick: (itemModel) {
                              //进入设备详情
                              String path = "${EQUIPMENT_DETAIL_PAGE}?serialnumber=${model.serialnumber}";
                              RouterManager.jump(
                                  context, path);
                            },
                          );
                        }),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
