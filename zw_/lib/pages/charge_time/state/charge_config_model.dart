
class ChargeConfigModel {

  late String serialnumber;
  // late String model1;
  late int timeSwitch1;
  // late String model1Type;
  late String times1;
  // late String model2;
  late int timeSwitch2;
  // late String model2Type;
  late String times2;
  // late String model3;
  late int timeSwitch3;
  // late String model3Type;
  late String times3;
  // late String model4;
  late int timeSwitch4;
  // late String model4Type;
  late String times4;
  // late String model5;
  late int timeSwitch5;
  // late String model5Type;
  late String times5;
  // late String model6;
  late int timeSwitch6;
  // late String model6Type;
  late String times6;
  // late String model7;
  late int timeSwitch7;
  // late String model7Type;
  late String times7;
  // late String model8;
  late int timeSwitch8;
  // late String model8Type;
  late String times8;
  // late String model9;
  late int timeSwitch9=0;
  // late String model1Type;
  late String times9;
  // late String model10;
  late int timeSwitch10=0;
  // late String model2Type;
  late String times10;
  // late String model11;
  late int timeSwitch11=0;
  // late String model3Type;
  late String times11;
  // late String model12;
  late int timeSwitch12=0;
  // late String model4Type;
  late String times12;
  // late String model13;
  late int timeSwitch13=0;
  // late String model5Type;
  late String times13;
  // late String model14;
  late int timeSwitch14=0;
  // late String model6Type;
  late String times14;
  // late String model15;
  late int timeSwitch15=0;
  // late String model7Type;
  late String times15;
  // late String model16;
  late int timeSwitch16=0;
  // late String model8Type;
  late String times16;


  ChargeConfigModel(
      { required String serialnumber,
        // required String model1,
        required int timeSwitch1,
        // required String model1Type,
        required String times1,
        // required String model2,
        required int timeSwitch2,
        // required String model2Type,
        required String times2,
        // required String model3,
        required int timeSwitch3,
        // required String model3Type,
        required String times3,
        // required String model4,
        required int timeSwitch4,
        // required String model4Type,
        required String times4,
        // required String model5,
        required int timeSwitch5,
        // required String model5Type,
        required String times5,
        // required String model6,
        required int timeSwitch6,
        // required String model6Type,
        required String times6,
        // required String model7,
        required int timeSwitch7,
        // required String model7Type,
        required String times7,
        // required String model8,
        required int timeSwitch8,
        // required String model8Type,
        required String times8,
        // required String model9,
        required int timeSwitch9,
        // required String model1Type,
        required String times9,
        // required String model10,
        required int timeSwitch10,
        // required String model2Type,
        required String times10,
        // required String model11,
        required int timeSwitch11,
        // required String model3Type,
        required String times11,
        // required String model12,
        required int timeSwitch12,
        // required String model4Type,
        required String times12,
        // required String model13,
        required int timeSwitch13,
        // required String model5Type,
        required String times13,
        // required String model14,
        required int timeSwitch14,
        // required String model6Type,
        required String times14,
        // required String model15,
        required int timeSwitch15,
        // required String model7Type,
        required String times15,
        // required String model16,
        required int timeSwitch16,
        // required String model8Type,
        required String times16}) {
    this.serialnumber = serialnumber;
    // this.model1 = model1;
    this.timeSwitch1 = timeSwitch1;
    // this.model1Type = model1Type;
    this.times1 = times1;
    // this.model2 = model2;
    this.timeSwitch2 = timeSwitch2;
    // this.model2Type = model2Type;
    this.times2 = times2;
    // this.model3 = model3;
    this.timeSwitch3 = timeSwitch3;
    // this.model3Type = model3Type;
    this.times3 = times3;
    // this.model4 = model4;
    this.timeSwitch4 = timeSwitch4;
    // this.model4Type = model4Type;
    this.times4 = times4;
    // this.model5 = model5;
    this.timeSwitch5 = timeSwitch5;
    // this.model5Type = model5Type;
    this.times5 = times5;
    // this.model6 = model6;
    this.timeSwitch6 = timeSwitch6;
    // this.model6Type = model6Type;
    this.times6 = times6;
    // this.model7 = model7;
    this.timeSwitch7 = timeSwitch7;
    // this.model7Type = model7Type;
    this.times7 = times7;
    // this.model8 = model8;
    this.timeSwitch8 = timeSwitch8;
    // this.model8Type = model8Type;
    this.times8 = times8;
    // this.model9 = model9;
    this.timeSwitch9 = timeSwitch9;
    // this.model1Type = model1Type;
    this.times9 = times9;
    // this.model10 = model10;
    this.timeSwitch10 = timeSwitch10;
    // this.model2Type = model2Type;
    this.times10 = times10;
    // this.model11 = model11;
    this.timeSwitch11 = timeSwitch11;
    // this.model3Type = model3Type;
    this.times11 = times11;
    // this.model12 = model12;
    this.timeSwitch12 = timeSwitch12;
    // this.model4Type = model4Type;
    this.times12 = times12;
    // this.model13 = model13;
    this.timeSwitch13 = timeSwitch13;
    // this.model5Type = model5Type;
    this.times13 = times13;
    // this.model14 = model14;
    this.timeSwitch14 = timeSwitch14;
    // this.model6Type = model6Type;
    this.times14 = times14;
    // this.model15 = model15;
    this.timeSwitch15 = timeSwitch15;
    // this.model7Type = model7Type;
    this.times15 = times15;
    // this.model16 = model16;
    this.timeSwitch16 = timeSwitch16;
    // this.model8Type = model8Type;
    this.times16 = times16;
  }

  static ChargeConfigModel fromJson(Map map) {
    String serialnumber =  (map["serialnumber"] ?? "") as String;
    // String model1 = (map["model1"] ?? "") as String;
    int timeSwitch1 = (map["timeSwitch1"] ?? 0) as int;
    // String model1Type = (map["model1Type"] ?? "") as String;
    String times1 = (map["times1"] ?? "") as String;
    // String model2 = (map["model2"] ?? "") as String;
    int timeSwitch2 = (map["timeSwitch2"] ?? 0) as int;
    // String model2Type = (map["model2Type"] ?? "") as String;
    String times2 = (map["times2"] ?? "") as String;
    // String model3 = (map["model3"] ?? "") as String;
    int timeSwitch3 = (map["timeSwitch3"] ?? 0) as int;
    // String model3Type = (map["model3Type"] ?? "") as String;
    String times3 = (map["times3"] ?? "") as String;
    // String model4 = (map["model4"] ?? "") as String;
    int timeSwitch4 = (map["timeSwitch4"] ?? 0) as int;
    // String model4Type = (map["model4Type"] ?? "") as String;
    String times4 = (map["times4"] ?? "") as String;
    // String model5 = (map["model5"] ?? "") as String;
    int timeSwitch5 = (map["timeSwitch5"] ?? 0) as int;
    // String model5Type = (map["model5Type"] ?? "") as String;
    String times5 = (map["times5"] ?? "") as String;
    // String model6 = (map["model6"] ?? "") as String;
    int timeSwitch6 = (map["timeSwitch6"] ?? 0) as int;
    // String model6Type = (map["model6Type"] ?? "") as String;
    String times6 = (map["times6"] ?? "") as String;
    // String model7 = (map["model7"] ?? "") as String;
    int timeSwitch7 = (map["timeSwitch7"] ?? 0) as int;
    // String model7Type = (map["model7Type"] ?? "") as String;
    String times7 = (map["times7"] ?? "") as String;
    // String model8 = (map["model8"] ?? "") as String;
    int timeSwitch8 = (map["timeSwitch8"] ?? 0) as int;
    // String model8Type = (map["model8Type"] ?? "") as String;
    String times8 = (map["times8"] ?? "") as String;
    // String model9 = (map["model9"] ?? "") as String;
    int timeSwitch9 = (map["timeSwitch9"] ?? 0) as int;
    // String model1Type = (map["model1Type"] ?? "") as String;
    String times9 = (map["times9"] ?? "") as String;
    // String model10 = (map["model10"] ?? "") as String;
    int timeSwitch10 = (map["timeSwitch10"] ?? 0) as int;
    // String model2Type = (map["model2Type"] ?? "") as String;
    String times10 = (map["times10"] ?? "") as String;
    // String model11 = (map["model11"] ?? "") as String;
    int timeSwitch11 = (map["timeSwitch11"] ?? 0) as int;
    // String model3Type = (map["model3Type"] ?? "") as String;
    String times11 = (map["times11"] ?? "") as String;
    // String model12 = (map["model12"] ?? "") as String;
    int timeSwitch12 = (map["timeSwitch12"] ?? 0) as int;
    // String model4Type = (map["model4Type"] ?? "") as String;
    String times12 = (map["times12"] ?? "") as String;
    // String model13 = (map["model13"] ?? "") as String;
    int timeSwitch13 = (map["timeSwitch13"] ?? 0) as int;
    // String model5Type = (map["model5Type"] ?? "") as String;
    String times13 = (map["times13"] ?? "") as String;
    // String model14 = (map["model14"] ?? "") as String;
    int timeSwitch14 = (map["timeSwitch14"] ?? 0) as int;
    // String model6Type = (map["model6Type"] ?? "") as String;
    String times14 = (map["times14"] ?? "") as String;
    // String model15 = (map["model15"] ?? "") as String;
    int timeSwitch15 = (map["timeSwitch15"] ?? 0) as int;
    // String model7Type = (map["model7Type"] ?? "") as String;
    String times15 = (map["times15"] ?? "") as String;
    // String model16 = (map["model16"] ?? "") as String;
    int timeSwitch16 = (map["timeSwitch16"] ?? 0) as int;
    // String model8Type = (map["model8Type"] ?? "") as String;
    String times16 = (map["times16"] ?? "") as String;


    return ChargeConfigModel(
        serialnumber:serialnumber,
      // model1: model1,
      timeSwitch1: timeSwitch1,
      // model1Type: model1Type,
      times1: times1,
      // model2: model2,
      timeSwitch2: timeSwitch2,
      // model2Type: model2Type,
      times2: times2,
      // model3: model3,
      timeSwitch3: timeSwitch3,
      // model3Type: model3Type,
      times3: times3,
      // model4: model4,
      timeSwitch4: timeSwitch4,
      // model4Type: model4Type,
      times4: times4,
      // model5: model5,
      timeSwitch5: timeSwitch5,
      // model5Type: model5Type,
      times5: times5,
      // model6: model6,
      timeSwitch6: timeSwitch6,
      // model6Type: model6Type,
      times6: times6,
      // model7: model7,
      timeSwitch7: timeSwitch7,
      // model7Type: model7Type,
      times7: times7,
      // model8: model8,
      timeSwitch8: timeSwitch8,
      // model8Type: model8Type,
      times8: times8,
        // model9: model9,
        timeSwitch9: timeSwitch9,
        // model7Type: model7Type,
        times9: times9,
        // model10: model10,
        timeSwitch10: timeSwitch10,
        // model8Type: model8Type,
        times10: times10,
        // model11: model11,
        timeSwitch11: timeSwitch11,
        // model1Type: model1Type,
        times11: times11,
        // model12: model12,
        timeSwitch12: timeSwitch12,
        // model2Type: model2Type,
        times12: times12,
        // model13: model13,
        timeSwitch13: timeSwitch13,
        // model3Type: model3Type,
        times13: times13,
        // model14: model14,
        timeSwitch14: timeSwitch14,
        // model4Type: model4Type,
        times14: times14,
        // model15: model15,
        timeSwitch15: timeSwitch15,
        // model5Type: model5Type,
        times15: times15,
        // model16: model16,
        timeSwitch16: timeSwitch16,
        // model6Type: model6Type,
        times16: times16,
        );


  }

   Map<String, dynamic> toJson() =>
      <String, dynamic>{
        'serialnumber': serialnumber,
        // 'model1': model1,
        'timeSwitch1': timeSwitch1,
        // 'model7Type': model7Type,
        'times1': times1,
        // 'model10': model10,
        'timeSwitch2': timeSwitch2,
        // 'model8Type': model8Type,
        'times2': times2,
        // 'model11': model11,
        'timeSwitch3': timeSwitch3,
        // 'model1Type': model1Type,
        'times3': times3,
        // 'model12': model12,
        'timeSwitch4': timeSwitch4,
        // 'model2Type': model2Type,
        'times4': times4,
        // 'model16': model16,
        'timeSwitch5': timeSwitch5,
        // 'model6Type': model6Type,
        'times5': times5,
        // 'model13': model13,
        'timeSwitch6': timeSwitch6,
        // 'model3Type': model3Type,
        'times6': times6,
        // 'model14': model14,
        'timeSwitch7': timeSwitch7,
        // 'model4Type': model4Type,
        'times7': times7,
        // 'model15': model15,
        'timeSwitch8': timeSwitch8,
        // 'model5Type': model5Type,
        'times8': times8,

        // 'model9': model9,
        'timeSwitch9': timeSwitch9,
        // 'model7Type': model7Type,
        'times9': times9,
        // 'model10': model10,
        'timeSwitch10': timeSwitch10,
        // 'model8Type': model8Type,
        'times10': times10,
        // 'model11': model11,
        'timeSwitch11': timeSwitch11,
        // 'model1Type': model1Type,
        'times11': times11,
        // 'model12': model12,
        'timeSwitch12': timeSwitch12,
        // 'model2Type': model2Type,
        'times12': times12,
        // 'model13': model13,
        'timeSwitch13': timeSwitch13,
        // 'model3Type': model3Type,
        'times13': times13,
        // 'model14': model14,
        'timeSwitch14': timeSwitch14,
        // 'model4Type': model4Type,
        'times14': times14,
        // 'model15': model15,
        'timeSwitch15': timeSwitch15,
        // 'model5Type': model5Type,
        'times15': times15,
        // 'model16': model16,
        'timeSwitch16': timeSwitch16,
        // 'model6Type': model6Type,
        'times16': times16,
      };
}
