import 'dart:convert';

class Data {
    Data({
        required this.id,
        required this.fullname,
        required this.rollno,
        required this.branch,
        required this.course,
        required this.semester,
        required this.contact,
    });
  

    String id;
    String fullname;
    String rollno;
    String branch;
    String course;
    int semester;
    String contact;

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());
    
    factory Data.fromJson(Map<String, dynamic>? json) => Data(
        id: json?["_id"],
        fullname: json?["fullname"],
        rollno: json?["rollno"],
        branch: json?["branch"],
        course: json?["course"],
        semester: json?["semester"],
        contact: json?["contactno"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "fullname": fullname,
        "rollno": rollno,
        "branch": branch,
        "course": course,
        "semester": semester,
        "contactno": contact,
    };
}