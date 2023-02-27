import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:zw_/components/app_bar.dart';
import 'package:zw_/router/router_manager.dart';
import 'package:zw_/utils/zw_hud.dart';

class EquipmentAddPage extends StatefulWidget {
  EquipmentAddPage({Key? key}) : super(key: key);

  @override
  State<EquipmentAddPage> createState() => _EquipmentAddPageState();
}

class _EquipmentAddPageState extends State<EquipmentAddPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? qrController;
  Barcode? result;
  bool isOpen = false; //是否打开
  bool isJump = false; //是否已跳转

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    if (Platform.isAndroid) {
      qrController!.pauseCamera();
    } else if (Platform.isIOS) {
      qrController!.resumeCamera();
    }
  }

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
      body: Column(
        children: [
          Expanded(
            child: QRView(
              key: qrKey,
              overlay: QrScannerOverlayShape(borderColor: Colors.white),
              onQRViewCreated: (contrller) {
                this.qrController = contrller;
                if (!this.isOpen) {
                  this.qrController?.resumeCamera();
                }
                this.qrController?.scannedDataStream.listen((scanData) {
                  this.result = scanData;
                  String code = scanData.code ?? "";
                  code = code.replaceAll("MD", "");
                  code = code.replaceAll("&", "");
                  if(code.length > 10 && !this.isJump){
                    var param = {"qrcode":code};
                    this.isJump = true;
                    RouterManager.goBackWithParam(context, param);
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    qrController?.dispose();
    super.dispose();
  }
}
