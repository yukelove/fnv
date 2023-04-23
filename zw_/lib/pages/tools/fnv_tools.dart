
class FnvTools {

  static String addStr(String targetStr,String addStr){
    String strPrefix  =  targetStr.substring(0,2);
    String strSuffix  =  targetStr.substring(2);
    return strPrefix+addStr+strSuffix;
  }

  static String replaceStr(String targetStr,String replaceStr){
    return  targetStr.replaceAll(":", "");
  }

  static String strRepair(int hour, int mini, int sec,String splitStr) {
    if(hour.isNaN || mini.isNaN || hour<0 || mini<0){
      return "00"+splitStr+"00";
    }else{
      String hourStr  = hour>=10?hour.toString():"0"+hour.toString();
      String miniStr  = mini>=10?mini.toString():"0"+mini.toString();
      if(sec.isNaN || sec<0){
        return hourStr+splitStr+miniStr;
      }else{
        String secStr  = sec>=10?sec.toString():"0"+sec.toString();
        return hourStr+splitStr+miniStr+splitStr+secStr;
      }
    }
  }
}