
class EquipmentModel {
  late String serialnumber;
  late String devicename;
  late String deviceenname;
  late String icon;
  late String dumpenergy;
  late int sort;
  late String status;

  EquipmentModel(
      {required String serialnumber,
      required String devicename,
      required String deviceenname,
      required String icon,
      required String dumpenergy,
      required int sort,
      required String status});

  static EquipmentModel fromJson(Map<String,dynamic> map){
    String serialnumber = (map["serialnumber"] ?? "") as String;
    String devicename = (map["devicename"] ?? "") as String;
    String deviceenname = (map["deviceenname"] ?? "") as String;
    String icon = (map["icon"] ?? "") as String;
    String dumpenergy = (map["dumpenergy"] ?? "") as String;
    int sort = (map["sort"] ?? 0) as int;
    String status = (map["status"] ?? "") as String;
    return EquipmentModel(serialnumber: serialnumber,deviceenname: devicename,devicename: deviceenname,icon: icon,dumpenergy: dumpenergy,sort: sort,status: status);
  }
}
