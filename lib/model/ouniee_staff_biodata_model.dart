import 'package:ouniee/model/ouniee_staff_courses_model.dart';

class OUnieeStaffBioDataModel {
  final bool isAdmin;
  final String staffFullName;
  final String staffId;
  final String staffAssignedDepartment;
  final String staffEmail;
  final String staffMobileContact;
  final String staffHouseAddress;
  final OUnieeStaffCoursesModel staffAssignedCourses;

  OUnieeStaffBioDataModel({
    required this.isAdmin,
    required this.staffFullName,
    required this.staffId,
    required this.staffAssignedDepartment,
    required this.staffEmail,
    required this.staffMobileContact,
    required this.staffHouseAddress,
    required this.staffAssignedCourses,
  });
}

class MyUser {
  final String? userId, email;
  MyUser({required this.userId, required this.email});
}
