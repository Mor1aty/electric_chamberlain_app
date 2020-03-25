class UserInfo {
  String phone;
  String nickname;
  int money;
  Portrait portrait;
  int type;
  String token;
  Map toJson() {
    Map map = new Map();
    map["phone"] = this.phone;
    map["nickname"] = this.nickname;
    map["money"] = this.money;
    map["portrait"] = this.portrait;
    map["type"] = this.type;
    map["token"] = this.token;
    return map;
  }
  static UserInfo fromMap(Map<String, dynamic> map) {
    UserInfo userInfo = new UserInfo();
    userInfo.phone = map['phone'];
    userInfo.nickname = map['nickname'];
    userInfo.money = map['money'];
    userInfo.type = map['type'];
    userInfo.token = map['token'];
    return userInfo;
  }
}

class Portrait {
  String fileLocation;
  String context;
  Map toJson() {
    Map map = new Map();
    map["fileLocation"] = this.fileLocation;
    map["context"] = this.context;
    return map;
  }
  static Portrait fromMap(Map<String, dynamic> map) {
    Portrait portrait = new Portrait();
    portrait.fileLocation = map['fileLocation'];
    portrait.context = map['context'];
    return portrait;
  }
}
