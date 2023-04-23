class Data {
  Data({
    required this.url,
    required this.fileName,
    required this.createTime,
  });

  String url;
  String fileName;
  String createTime;


  Map<String, dynamic> toJson() => {
    "url": url,
    "fileName": fileName,
    "createTime": createTime,
  };

  static Data fromJson(Map map) {
    String url =  (map["url"] ?? "") as String;
    String fileName = (map["fileName"] ?? "") as String;
    String createTime = (map["createTime"] ?? "") as String;

    return Data(
      url:url,
      fileName: fileName,
      createTime: createTime,
    );

  }
}