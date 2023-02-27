
class EquipmentModel {
  late String serialnumber;
  late String devicename;
  late String deviceenname;
  late String icon;
  late double dumpenergy;
  late double sort;
  late String status;

  EquipmentModel(
      {required String serialnumber,
      required String devicename,
      required String deviceenname,
      required String icon,
      required double dumpenergy,
      required double sort,
      required double status});

  static EquipmentModel fromJson(Map map){
    String serialnumber = (map["serialnumber"] ?? "") as String;
    String devicename = (map["devicename"] ?? "") as String;
    String deviceenname = (map["deviceenname"] ?? "") as String;
    String icon = (map["icon"] ?? "") as String;
    double dumpenergy = (map["dumpenergy"] ?? 0.0) as double;
    double sort = (map["sort"] ?? 0.0) as double;
    double status = (map["status"] ?? 0.0) as double;
    return EquipmentModel(serialnumber: serialnumber,deviceenname: devicename,devicename: deviceenname,icon: icon,dumpenergy: dumpenergy,sort: sort,status: status);
  }
}
