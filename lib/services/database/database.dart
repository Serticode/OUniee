import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ouniee/model/ouniee_staff_biodata_model.dart';
import 'package:ouniee/model/ouniee_staff_courses_model.dart';

class DatabaseService {
  final String uid;
  final String email;
  DatabaseService({required this.uid, required this.email});

  //!COLLECTION REFERENCE
  final userCollection = FirebaseFirestore.instance.collection("User Data");

  /* //!FUNCTION TO CONVERT ASSET IMAGE TO FILE
  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load(path);

    final file =
        File('${(await getTemporaryDirectory()).path}/default_user.png');
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  } */

  Future updateUserData({
    required String staffDetailsInJSON,
  }) async {
    DocumentReference userReference = userCollection.doc(email);
    FirebaseFirestore.instance.runTransaction(
      (transaction) async {
        try {
          DocumentSnapshot snapshot = await transaction.get(userReference);
          if (!snapshot.exists) {
            await userReference.set({
              "default_staff_model ": jsonEncode(OUnieeStaffBioDataModel(
                  isAdmin: false,
                  staffFullName: "Ciroma Chukwuma Adekunle",
                  staffId: "01/SCES/SE/0001",
                  staffAssignedDepartment: "SCES - Software Engineering",
                  staffEmail: "defaultMail@staff.babcock.edu.ng",
                  staffMobileContact: "staffMobileContact",
                  staffHouseAddress: "staffHouseAddress",
                  staffAssignedCourses: OUnieeStaffCoursesModel(
                      courseTitle: "courseTitle",
                      courseCode: "courseCode",
                      courseDescription: "courseDescription",
                      courseUnits: "courseUnits"))),
            });

            /* //!CONVERT ASSET IMAGE TO FILE AND UPLOAD AS DEFAULT USER IMAGE.
            File defaultImage =
                await getImageFileFromAssets("images/default_user.png");

            await StorageService()
                .uploadImage(email: email, file: defaultImage); */
          } else {
            if (staffDetailsInJSON != null) {
              transaction
                  .update(userReference, {"StaffDetails ": staffDetailsInJSON});
            }
          }
        } catch (e) {
          debugPrint("FIRESTORE TRANSACTION ERROR: $e");
        }
      },
    );
  }

  Future updateDownloadLinks({required String fileDownloadLink}) async {
    DocumentReference userReference =
        userCollection.doc("$email\_downloadLinks");
    FirebaseFirestore.instance.runTransaction(
      (transaction) async {
        try {
          DocumentSnapshot snapshot = await transaction.get(userReference);
          if (!snapshot.exists) {
            userReference.set({"File DownloadLinks ": fileDownloadLink});
          } else {
            if (fileDownloadLink != null) {
              //snapshot.data().clear();

              transaction.update(
                  userReference, {"Image DownloadLinks ": fileDownloadLink});
            }
          }
        } catch (e) {
          debugPrint("FIRESTORE TRANSACTION ERROR: $e");
        }
      },
    );
  }

  /* listDownloadLinks({String email}) async {
    String urls;
    Map<String, dynamic> _theUserData;

    final userCollection = FirebaseFirestore.instance.collection("User Data");
    DocumentReference downloadLinkRef =
        userCollection.doc("$email\_downloadLinks");

    downloadLinkRef.get();
    await downloadLinkRef.snapshots().first.then((value) async {
      try {
        _theUserData = value.data();
        urls = _theUserData.values.first;
      } catch (e) {
        debugdebugPrint("DOWNLOAD LINK REF CAUGHT ERROR: $e ");
      }
    });

    return urls;
  } */

  //!GET USER DOWNLOAD LINKS STREAM
  Stream<QuerySnapshot> get getDownloadLinks {
    final userDownloadCollection =
        FirebaseFirestore.instance.collection("$email\_downloadLinks");
    return userDownloadCollection.snapshots();
  }
}
