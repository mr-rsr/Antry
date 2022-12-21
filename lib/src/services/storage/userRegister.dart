class UserRegister {
  UserRegister(
      {required this.id,
      required this.fullname,
      required this.branch,
      required this.course,
      required this.semester,
      required this.contact});
  String id;
  String fullname;
  String branch;
  String course;
  int semester;
  String contact;
  String getId() => id;
  String getFullname() => fullname;
  String getBranch() => branch;
  String getCourse() => course;
  int getSemester() => semester;
  String getContact() => contact;
}
