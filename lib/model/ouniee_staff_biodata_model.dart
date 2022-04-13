class MyUser {
  final String? userId, email;
  MyUser({this.userId, this.email});
}

class OUnieeStaffBioDataModel {
  bool? isAdmin;
  String? staffFullName;
  String? staffId;
  String? staffAssignedDepartment;
  String? staffEmail;
  String? staffMobileContact;
  String? currentStaffLevel;
  String? staffHouseAddress;
  String? staffQualification;
  String? staffPublication;
  String? staffExperience;
  List<Map<String, dynamic>>? coursesStaffTeach;

  OUnieeStaffBioDataModel({
    this.isAdmin,
    this.staffFullName,
    this.staffId,
    this.staffAssignedDepartment,
    this.staffEmail,
    this.staffMobileContact,
    this.currentStaffLevel,
    this.staffHouseAddress,
    this.staffQualification,
    this.staffExperience,
    this.staffPublication,
    this.coursesStaffTeach,
  });

  //! FUNCTION TO MAP JSON
  OUnieeStaffBioDataModel.fromMap(Map<String, dynamic> json) {
    isAdmin = json["isAdmin"];
    staffFullName = json["staffFullName"];
    staffId = json["staffID"];
    staffAssignedDepartment = json["staffAssignedDepartment"];
    staffEmail = json["staffEmail"];
    staffMobileContact = json["staffMobileContact"];
    currentStaffLevel = json["currentStaffLevel"];
    staffHouseAddress = json["staffHouseAddress"];
    staffExperience = json["staffExperience"];
    staffPublication = json["staffPublication"];
    staffQualification = json["staffQualification"];
    coursesStaffTeach = json["staffCoursesList"];
  }

  //! Convert a BIO DATA object into a Map object
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = <String, dynamic>{};

    map['isAdmin'] = isAdmin ?? false;
    map['staffFullName'] = staffFullName ?? "defaultName";
    map['staffID'] = staffId ?? "defaultId";
    map['staffEmail'] = staffEmail ?? "defaultEmail";
    map['staffAssignedDepartment'] =
        staffAssignedDepartment ?? "defaultDepartment";
    map['staffMobileContact'] = staffMobileContact ?? "defaultMobileContact";
    map['currentStaffLevel'] = currentStaffLevel ?? "defaultStaffLevel";
    map['staffHouseAddress'] = staffHouseAddress ?? "defaultAddress";
    map['staffExperience'] = staffExperience ?? "defaultStaffExperience";
    map['staffPublication'] = staffPublication ?? "defaultStaffPublication";
    map['staffQualification'] =
        staffQualification ?? "defaultStaffQualification";

    return map;
  }
}
