// ignore_for_file: unnecessary_new

class UserData {
  Data? data;
  String? msg;
  bool? success;

  UserData({this.data, this.msg, this.success});

  UserData.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
    msg = json['msg'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['msg'] = msg;
    data['success'] = success;
    return data;
  }
}

class Data {
  String? sId;
  String? fullname;
  String? rollno;
  String? branch;
  String? course;
  int? semester;
  String? contactno;
  String? usertype;

  Data(
      {this.sId,
      this.fullname,
      this.rollno,
      this.branch,
      this.course,
      this.semester,
      this.contactno,
      this.usertype});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullname = json['fullname'];
    rollno = json['rollno'];
    branch = json['branch'];
    course = json['course'];
    semester = json['semester'];
    contactno = json['contactno'];
    usertype = json['usertype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['fullname'] = fullname;
    data['rollno'] = rollno;
    data['branch'] = branch;
    data['course'] = course;
    data['semester'] = semester;
    data['contactno'] = contactno;
    data['usertype'] = usertype;
    return data;
  }
}
