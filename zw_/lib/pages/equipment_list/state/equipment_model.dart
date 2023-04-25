/*
		deviceTempf: 0.0,
		deviceTempc: 0.0,
		batteryCellTempf: 0.0,
		batteryCellTempc: 0.0,
		inputPower: 220.0,
		outPower: 10.0,
		acPower: 0.0,
		usbPower: 70.0,
		typecPower: 60.0,
		ledPower: 0.0,
		dcPower: 80.0,
		pvInputPower: 50.0,
		pvInputVoltage: 40.0,
		totalInputPower: 0.0,
		totalOutputPower: 0.0,
*/
class EquipmentModel {
  late String serialnumber;
  late String devicename;
  late String deviceenname;
  late String icon;
  late double dumpenergy;
  late double sort;
  late double status;
  late double deviceTempf;
  late double deviceTempc;
  late double batteryCellTempf;
  late double batteryCellTempc;
  late double inputPower;
  late double outPower;
  late double acPower;
  late double usbPower;
  late double typecPower;
  late double ledPower;
  late double dcPower;
  late double pvInputPower;
  late double pvInputVoltage;
  late double totalInputPower;
  late double totalOutputPower;
  EquipmentModel(
      {required String serialnumber,
      required String devicename,
      required String deviceenname,
      required String icon,
      required double dumpenergy,
      required double sort,
      required double status,
      double deviceTempf = 0.0,
      double deviceTempc = 0.0,
      double batteryCellTempf = 0.0,
      double batteryCellTempc = 0.0,
      double inputPower = 0.0,
      double outPower = 0.0,
      double acPower = 0.0,
      double usbPower = 0.0,
      double typecPower = 0.0,
      double ledPower = 0.0,
      double dcPower = 0.0,
      double pvInputPower = 0.0,
      double pvInputVoltage = 0.0,
      double totalInputPower = 0.0,
      double totalOutputPower = 0.0}) {
    this.serialnumber = serialnumber;
    this.deviceenname = deviceenname;
    this.devicename = devicename;
    this.icon = icon;
    this.dumpenergy = dumpenergy;
    this.sort = sort;
    this.status = status;
    this.deviceTempc = deviceTempc;
    this.deviceTempf = deviceTempf;
    this.batteryCellTempf = batteryCellTempf;
    this.batteryCellTempc = batteryCellTempc;
    this.inputPower = inputPower;
    this.outPower = outPower;
    this.acPower = acPower;
    this.usbPower = usbPower;
    this.typecPower = typecPower;
    this.ledPower = ledPower;
    this.dcPower = dcPower;
    this.pvInputPower = pvInputPower;
    this.pvInputVoltage = pvInputVoltage;
    this.totalInputPower = totalInputPower;
    this.totalOutputPower = totalOutputPower;
  }

  static EquipmentModel fromJson(Map map) {
    String serialnumber = (map["serialnumber"] ?? "") as String;
    String devicename = (map["devicename"] ?? "") as String;
    String deviceenname = (map["deviceenname"] ?? "") as String;
    String icon = (map["icon"] ?? "") as String;
    double dumpenergy = (map["dumpenergy"] ?? 0.0) as double;
    double sort = (map["sort"] ?? 0.0) as double;
    double status = (map["status"] ?? 0.0) as double;
    double deviceTempc = (map["deviceTempc"] ?? 0.0) as double;
    double deviceTempf = (map["deviceTempf"] ?? 0.0) as double;
    double batteryCellTempf = (map["batteryCellTempf"] ?? 0.0) as double;
    double batteryCellTempc = (map["batteryCellTempc"] ?? 0.0) as double;
    double inputPower = (map["inputPower"] ?? 0.0) as double;
    double outPower = (map["outPower"] ?? 0.0) as double;
    double acPower = (map["acPower"] ?? 0.0) as double;
    double usbPower = (map["usbPower"] ?? 0.0) as double;
    double typecPower = (map["typecPower"] ?? 0.0) as double;
    double ledPower = (map["ledPower"] ?? 0.0) as double;
    double dcPower = (map["dcPower"] ?? 0.0) as double;
    double pvInputPower = (map["pvInputPower"] ?? 0.0) as double;
    double pvInputVoltage = (map["pvInputVoltage"] ?? 0.0) as double;
    double totalInputPower = (map["totalInputPower"] ?? 0.0) as double;
    double totalOutputPower = (map["totalOutputPower"] ?? 0.0) as double;
    return EquipmentModel(
        serialnumber: serialnumber,
        deviceenname: devicename,
        devicename: deviceenname,
        icon: icon,
        dumpenergy: dumpenergy,
        sort: sort,
        status: status,
        deviceTempc: deviceTempc,
        deviceTempf: deviceTempf,
        batteryCellTempc: batteryCellTempc,
        batteryCellTempf: batteryCellTempf,
        inputPower: inputPower,
        outPower: outPower,
        acPower: acPower,
        usbPower: usbPower,
        typecPower: typecPower,
        ledPower: ledPower,
        dcPower: dcPower,
        pvInputPower: pvInputPower,
        pvInputVoltage: pvInputVoltage,
        totalInputPower: totalInputPower,
        totalOutputPower: totalOutputPower
        );
  }


  Map<String, dynamic> toJson() =>
      <String, dynamic>{
        'serialnumber': serialnumber,
        'devicename':devicename,
        'deviceenname':deviceenname,
        'icon':icon,
        'dumpenergy':dumpenergy,
        'sort':sort,
        'status':status,
        'deviceTempf':deviceTempf,
        'deviceTempc':deviceTempc,
        'batteryCellTempf':batteryCellTempf,
        'batteryCellTempc':batteryCellTempc,
        'inputPower':inputPower,
        'outPower':outPower,
        'acPower':acPower,
        'usbPower':usbPower,
        'typecPower':typecPower,
        'ledPower':ledPower,
        'dcPower':dcPower,
        'pvInputPower':pvInputPower,
        'pvInputVoltage':pvInputVoltage,
        'totalInputPower':totalInputPower,
        'totalOutputPower':totalOutputPower,
  };

}
