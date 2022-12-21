class LoginToken {
  String? msg;
  bool? success;
  String? token;

  LoginToken({this.msg, this.success, this.token});

  LoginToken.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    success = json['success'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['msg'] = msg;
    data['success'] = success;
    data['token'] = token;
    return data;
  }
}