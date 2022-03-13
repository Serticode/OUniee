import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ouniee/constants/firebase.dart';
import 'package:ouniee/model/ouniee_staff_biodata_model.dart';

class StaffDataController extends GetxController {
  //! CREATE STAFF DATA CONTROLLER INSTANCE
  static StaffDataController instance = Get.find();

  //! A LIST OF THE USERS DATA
  RxList<OUnieeStaffBioDataModel> staffDetails =
      RxList<OUnieeStaffBioDataModel>([]);

  //! USER DATA
  static Map<String, dynamic> usersData = {};

  //! OVERRIDE READY STATE AND POPULATE USER DATA ON LOG IN

  @override
  void onReady() {
    super.onReady();
    staffDetails.bindStream(getStaffDataFromFirebase());
  }

  //! METHOD TO FETCH USER DATA IN A STREAM
  Stream<List<OUnieeStaffBioDataModel>> getStaffDataFromFirebase() =>
      firebaseFirestore
          .collection("User Data")
          .snapshots()
          .map((query) => query.docs
              .where((element) {
                element.data().containsValue(auth.currentUser?.email)
                    ? usersData.addAll(element.data())
                    : element.data();
                return element.isBlank!;
              })
              .map((item) => OUnieeStaffBioDataModel.fromMap(item.data()))
              .toList());

  static addCourseToCourseList(
      {required String courseTitle,
      required String courseUnits,
      required String courseDescription,
      required String courseCode}) async {
    //!FETCH THE DATA SNAPSHOT IN CURRENTLY STORED IN FIREBASE
    DocumentSnapshot<Map<String, dynamic>>? _theDataSnapshot =
        await firebaseFirestore
            .collection("User Data")
            .doc(auth.currentUser!.email)
            .get();

    //! EXTRACT THE MAP DATA
    Map<String, dynamic>? _theData = _theDataSnapshot.data();

    //! FETCH THE VALUE OF THE NEEDED KEY
    List<dynamic>? _theListOfCourses = [];
    _theListOfCourses = _theData!["coursesStaffTeach"];

    //! UPDATE THE VALUE WITH THE NEW LIST OF COURSES.
    if (_theListOfCourses?.isEmpty == true || _theListOfCourses == null) {
      _theListOfCourses?.clear();
      _theListOfCourses!.add({
        "courseCode": courseCode,
        "courseUnits": courseUnits,
        "courseTitle": courseTitle,
        "courseDescription": courseDescription
      });
    } else {
      _theListOfCourses.add({
        "courseCode": courseCode,
        "courseUnits": courseUnits,
        "courseTitle": courseTitle,
        "courseDescription": courseDescription
      });
    }

    //! UPDATE THE FIRESTORE DOCUMENT
    firebaseFirestore
        .collection("User Data")
        .doc(auth.currentUser!.email)
        .update({
      "coursesStaffTeach": _theListOfCourses,
    });
  }

  static removeCourseFromCourseList({
    required String courseTitle,
  }) async {
    //!FETCH THE DATA SNAPSHOT IN CURRENTLY STORED IN FIREBASE
    DocumentSnapshot<Map<String, dynamic>>? _theDataSnapshot =
        await firebaseFirestore
            .collection("User Data")
            .doc(auth.currentUser!.email)
            .get();

    //! EXTRACT THE MAP DATA
    Map<String, dynamic>? _theData = _theDataSnapshot.data();

    //! FETCH THE VALUE OF THE NEEDED KEY
    List<dynamic>? _theListOfCourses = [];
    _theListOfCourses = _theData!["coursesStaffTeach"];

    //! UPDATE THE VALUE WITH THE NEW LIST OF COURSES.

    _theListOfCourses!.removeWhere((item) => item.containsValue(courseTitle));

    //! UPDATE THE FIRESTORE DOCUMENT
    firebaseFirestore
        .collection("User Data")
        .doc(auth.currentUser!.email)
        .update({
      "coursesStaffTeach": _theListOfCourses,
    });
  }
}
