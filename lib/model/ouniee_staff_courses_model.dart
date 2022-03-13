class OUnieeStaffCoursesModel {
  String courseTitle;
  String courseCode;
  String courseDescription;
  String courseUnits;

  OUnieeStaffCoursesModel(
      {required this.courseTitle,
      required this.courseCode,
      required this.courseDescription,
      required this.courseUnits});

  //!FACTORY FUNCTION TO GET DATA FROM MAP
  factory OUnieeStaffCoursesModel.fromMap(Map<String, dynamic> json) {
    return OUnieeStaffCoursesModel(
      courseTitle: json["courseTitle"] ?? "defaultCourseTitle",
      courseCode: json["courseCode"] ?? "defaultCourseCode",
      courseDescription:
          json["courseDescription"] ?? "defaultCourseDescription",
      courseUnits: json["courseUnits"] ?? "defaultCourseUnits",
    );
  }
}
