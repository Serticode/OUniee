import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:ouniee/constants/firebase.dart';
import 'package:ouniee/pages/dashboard.dart';
import 'package:ouniee/pages/landing_page.dart';

class AuthController extends GetxController {
  //!CONTROLLER INSTANCE
  static AuthController instance = Get.find();
  Rx<User?>? firebaseUser;
  RxBool isLoggedIn = false.obs;

  @override
  void onReady() {
    super.onReady();

    //!INSTANTIATE FIREBASE USER
    firebaseUser = Rx<User?>(auth.currentUser);

    //!BIND FIREBASE USER TO USER CHANGES.
    firebaseUser!.bindStream(auth.userChanges());

    //!SET EVENT TRIGGER CALLED EVER ...
    //!EVERY TIME A CHANGE IS MADE DUE TO THE EVENT LISTENER, RUN A CALL BACK FUNCTION
    ever(firebaseUser!, setUpInitialScreen);
  }

  //!SHOW INITIAL SCREEN
  //!IF THERE IS NO USER, SHOW SIGN IN ELSE SHOW DASHBOARD
  static setUpInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const LandingPage());
    } else {
      Get.offAll(() => Dashboard());
    }
  }

  //! CREATE A STAFF ACCOUNT
  static getXSignUp({
    required String email,
    required String password,
    required bool isStaffAnAdmin,
    required String theStaffFullName,
    required String theStaffID,
    required String theStaffDepartment,
    required String contact,
    required String residence,
    required String qualification,
    required String publication,
    required String experience,
    required String theStaffLevel,
  }) async {
    try {
      //! CREATE USER ACCOUNT
      await auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then(
        ///! ADD THE USER FIRESTORE DOCUMENTS AS PROVIDED
        (UserCredential result) {
          String? theCreatedUserEmail = result.user!.email;
          _addUserDataToFirestore(
              theCreatedUserEmail: theCreatedUserEmail,
              isStaffAnAdmin: isStaffAnAdmin,
              theStaffFullName: theStaffFullName,
              theStaffId: theStaffID,
              theStaffDepartment: theStaffDepartment,
              theStaffEmail: email,
              theStaffContact: contact,
              theStaffResidence: residence,
              theStaffQualification: qualification,
              theStaffPublication: publication,
              theStaffExperience: experience,
              theStaffLevel: theStaffLevel,
              theStaffListOfCourses: null);
        },
      ).whenComplete(() => Get.snackbar(
              "Account Created", "The staff account has been created",
              snackPosition: SnackPosition.BOTTOM));
    }
    //! FIREBASE AUTH EXCEPTION
    on FirebaseAuthException catch (e) {
      //! WEAK PASSWORD?
      if (e.code == "weak-password") {
        Get.snackbar("Weak password", e.code);
      }
      //! EMAIL ALREADY IN USE?
      else if (e.code == "email-already-in-use") {
        Get.snackbar("Account Exists!", e.code);
      }
    }
    //! OTHER EXCEPTIONS
    catch (e) {
      Get.snackbar(
        "Create account failed!",
        "Failed to create staff account, kindly try again.",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  //! ADD USER DATA TO FIRESTORE
  static _addUserDataToFirestore({
    required String? theCreatedUserEmail,
    required bool? isStaffAnAdmin,
    required String? theStaffFullName,
    required String? theStaffId,
    required String? theStaffDepartment,
    required String? theStaffEmail,
    required String? theStaffContact,
    required String? theStaffResidence,
    required String? theStaffQualification,
    required String? theStaffPublication,
    required String? theStaffExperience,
    required String? theStaffListOfCourses,
    required String? theStaffLevel,
  }) =>
      firebaseFirestore.collection("User Data").doc(theCreatedUserEmail).set({
        "isAdmin": isStaffAnAdmin,
        "staffFullName": theStaffFullName,
        "staffId": theStaffId,
        "staffAssignedDepartment": theStaffDepartment,
        "staffEmail": theStaffEmail,
        "staffMobileContact": theStaffContact,
        "staffHouseAddress": theStaffResidence,
        "staffExperience": theStaffExperience,
        "staffPublication": theStaffPublication,
        "staffQualification": theStaffQualification,
        "currentStaffLevel": theStaffLevel,
        "coursesStaffTeach": [],
        "applicationApproved": "",
      });

  //! SIGN IN
  static void getXSignIn({
    required String userEmail,
    required String userPassword,
  }) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: userEmail, password: userPassword);
    }
    //! EXCEPTIONS
    catch (e) {
      Get.snackbar(
        "Sign in failed!",
        "Staff sign in failed, kindly try again.",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  //! SIGN OUT
  static void getXSignOut() => auth.signOut().then(
        //! SHOW NOTIFYING SNACK BAR
        (value) => Get.snackbar(
          "Log Out!",
          "User has been logged out",
          snackPosition: SnackPosition.BOTTOM,
        ),
      );
}
