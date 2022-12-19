import 'dart:convert' as convert;

class DataConvert {

  static Map<String,dynamic> stringToJson(String jsonString){
    var result = convert.jsonDecode(jsonString) as Map<String,dynamic>;
    return result;
  }

  
  static String jsonToString(Map map){
    var result = convert.jsonEncode(map);
    return result;
  }
  
}