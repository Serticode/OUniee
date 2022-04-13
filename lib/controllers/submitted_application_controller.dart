import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ouniee/constants/firebase.dart';
import 'package:ouniee/controllers/staff_data_controller.dart';
import 'package:ouniee/controllers/staff_level_controller.dart';

class SubmittedApplicationsController extends GetxController {
  static SubmittedApplicationsController instance = Get.find();

  static List<Map<String, dynamic>> usersData = [];

  @override
  void onReady() {
    super.onReady();

    getStaffApplicationDataFromFirebase();
  }

  //! CREATE SUBMIT FUNCTION TO ...
  //!COLLECT ABOVE INFO, ACCESS FIREBASE AND CREATE DATA TABLE
  static submitStaffApplication(
      {required String theCriteriaMet,
      required String thePositionAppliedFor,
      String? staffCoverLetter,
      String? theStaffAttachment}) {
    //!ACCESS FIRESTORE
    firebaseFirestore
        .collection("Staff Applications")
        .doc(auth.currentUser!.email)
        .set({
      "criteriaMet": theCriteriaMet,
      "positionAppliedFor": thePositionAppliedFor,
      "coverLetter": staffCoverLetter ?? "no cover letter added",
      //!TODO:  CHANGE THE BELOW TO THE ATTACHED DOCUMENT URL
      "attachedDocumentURL": "staffAttachedDocument",
      "staffFullName": StaffDataController.usersData["staffFullName"],
      "staffId": StaffDataController.usersData["staffId"],
      "staffAssignedDepartment":
          StaffDataController.usersData["staffAssignedDepartment"],
      "staffEmail": StaffDataController.usersData["staffEmail"],
      "staffExperience": StaffDataController.usersData["staffExperience"],
      "staffPublication": StaffDataController.usersData["staffPublication"],
      "staffQualification": StaffDataController.usersData["staffQualification"],
    });
  }

  static Future<bool> applicationDecider(
      {required String staffEmail,
      required String staffCoverLetter,
      required String leadershipSkillRating,
      required File theAttachedFile}) async {
    //! BOOL TO BE RETURNED.
    bool promotedOrNot;

    //!PULL STAFF DETAILS
    DocumentSnapshot<Map<String, dynamic>> staffData =
        await firebaseFirestore.collection("User Data").doc(staffEmail).get();

    //! GET STAFF CURRENT EXPERIENCE
    String currentStaffExperience = staffData.data()!["staffExperience"];

    //! GET STAFF CURRENT PUBLICATION
    String currentStaffPublication = staffData.data()!["staffPublication"];

    //! STAFF COVER LETTER
    //String coverLetter = staffCoverLetter;

    //! FIND CURRENT STAFF LEVEL INDEX
    int currentLevelIndex = StaffLevelController.attainableStaffLevels
        .indexOf(staffData.data()!["currentStaffLevel"]);

    //! ASSIGN NEXT LEVEL INDEX
    int nextLevelIndex = ++currentLevelIndex;

    //! GET REQUIREMENTS FOR THE POSITION APPLIED FOR.
    int noOfExperienceYearsForNextLevel =
        StaffLevelController.numberOfExpectedExperienceYears[nextLevelIndex];

    int numberOfPublicationsForNextLevel =
        StaffLevelController.numberOfExpectedStaffPublications[nextLevelIndex];

    int expectedLeadershipRating =
        StaffLevelController.expectedLeadershipSkillRating[nextLevelIndex];

    //! STAFF FILE UPLOAD
    File? attachedFile = theAttachedFile;

    //! DECIDER
    //!CONVERT CURRENT STAFF VALUES TO INT FROM STRING STORED TYPE
    int staffExperienceInYears = int.parse(currentStaffExperience);

    //! CURRENT STAFF PUBLICATION IN INT.
    List<String> thePublications = currentStaffPublication.split(",");
    int staffPublicationInInt = thePublications.length;
    debugPrint(staffPublicationInInt.toString());

    //! LEADERSHIP SKILL RATING IN INT.
    int _leadershipSkillRating = int.parse(leadershipSkillRating);

    //! IF THE CURRENT STAFF VALUES, MEET THE APPLIED LEVEL REQUIREMENTS, PROMOTE
    if ((staffExperienceInYears >= noOfExperienceYearsForNextLevel) &&
        (staffPublicationInInt >= numberOfPublicationsForNextLevel) &&
        (_leadershipSkillRating >= expectedLeadershipRating) &&
        (attachedFile != null)) {
      promotedOrNot = true;
      applicationApproved(staffEmail: staffEmail);

      SubmittedApplicationsController.submitStaffApplication(
          theCriteriaMet: StaffLevelController.criteria[nextLevelIndex],
          thePositionAppliedFor:
              StaffLevelController.attainableStaffLevels[nextLevelIndex]);
    } else {
      promotedOrNot = false;
      applicationDenied(staffEmail: staffEmail);
    }

    return promotedOrNot;
  }

  //! CHECK IF STAFF HAS APPLIED FOR JOB AND SHOW THE JOB LISTING.
  static didStaffApply() async {
    late bool _isStaffApplicationFound;

    var _theCollection = await firebaseFirestore
        .collection("Staff Applications")
        .doc(auth.currentUser!.email)
        .get();

    if (_theCollection.exists) {
      _isStaffApplicationFound =
          _theCollection.data()!.containsValue(auth.currentUser!.email);
    } else {
      _isStaffApplicationFound = false;
    }

    return _isStaffApplicationFound;
  }

  //! CHECK IF THERE ARE APPLICATIONS ON THE LIST.
  static areThereApplicationsSubmitted() async {
    late bool _isStaffApplicationFound;

    var _theCollection =
        await firebaseFirestore.collection("Staff Applications").get();

    if (_theCollection.size == 0) {
      _isStaffApplicationFound = false;
    } else {
      _isStaffApplicationFound = true;
    }

    return _isStaffApplicationFound;
  }

  //! FETCH STAFF APPLICATION DATA IN A STREAM
  static getStaffApplicationDataFromFirebase() =>
      firebaseFirestore.collection("Staff Applications").get().then((value) {
        for (var item in value.docs) {
          usersData.add(item.data());
        }
      });

  //! WHEN APPLICATION IS APPROVED
  static applicationApproved({required String staffEmail}) async {
    //!PULL STAFF DETAILS
    DocumentSnapshot<Map<String, dynamic>> staffData =
        await firebaseFirestore.collection("User Data").doc(staffEmail).get();

    //! FIND CURRENT STAFF LEVEL INDEX
    int currentLevelIndex = StaffLevelController.attainableStaffLevels
        .indexOf(staffData.data()!["currentStaffLevel"]);

    //! ASSIGN NEXT LEVEL INDEX
    int nextLevelIndex = ++currentLevelIndex;

    //! FETCH CONTENT OF NEXT LEVEL
    String promotedLevel =
        StaffLevelController.attainableStaffLevels[nextLevelIndex];

    //! CHANGE STAFF LEVEL
    if (nextLevelIndex >= 5) {
      firebaseFirestore.collection("User Data").doc(staffEmail).update({
        "isAdmin": true,
        "currentStaffLevel": promotedLevel,
        "applicationApproved": "true",
      }).then((value) => deleteApplicationFromDatabase(staffEmail: staffEmail));
    } else {
      firebaseFirestore.collection("User Data").doc(staffEmail).update({
        "currentStaffLevel": promotedLevel,
        "applicationApproved": "true"
      }).then((value) => deleteApplicationFromDatabase(staffEmail: staffEmail));
    }
  }

  //! WHEN APPLICATION IS DENIED
  static applicationDenied({required String staffEmail}) {
    firebaseFirestore
        .collection("User Data")
        .doc(staffEmail)
        .update({"applicationApproved": "false"}).then(
            (value) => deleteApplicationFromDatabase(staffEmail: staffEmail));
  }

  //! WHEN APPLICATION IS DENIED OR APPROVED, CLEAN THE APPLICATION DOCUMENT FROM FIREBASE.
  static deleteApplicationFromDatabase({required String staffEmail}) {
    firebaseFirestore.collection("Staff Applications").doc(staffEmail).delete();
  }

  //! ACKNOWLEDGE APPLICATION STATUS
  static acknowledgeApplicationStatus() => firebaseFirestore
      .collection("User Data")
      .doc(auth.currentUser!.email)
      .update({"applicationApproved": ""});
}
