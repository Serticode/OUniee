import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ouniee/constants/style.dart';
import 'package:ouniee/pages/authenticate/sign_up/sign_up_page_two.dart';
import 'package:ouniee/pages/dashboard.dart';
import 'package:ouniee/pages/landing_page.dart';
import 'package:ouniee/services/auth/auth.dart';
import 'package:ouniee/widgets/custom_text_widget.dart';

class SignUpPageOne extends StatefulWidget {
  const SignUpPageOne({Key? key}) : super(key: key);

  @override
  State<SignUpPageOne> createState() => _SignUpPageOneState();
}

class _SignUpPageOneState extends State<SignUpPageOne> {
  //!KEY, AUTH & TEXT CONTROLLERS
  final _formKey = GlobalKey<FormState>();
  final _theAuthServiceInstance = AuthService();
  final _theNameController = TextEditingController();
  final _theStaffIDController = TextEditingController();
  final _theStaffDepartmentController = TextEditingController();
  final _theStaffEmailController = TextEditingController();
  final _theStaffPasswordController = TextEditingController();

  //!OTHER MEMBER VARIABLES
  double callSize = 18.0;
  Color callColour = dark.withOpacity(0.8);
  Color responseColour = dark.withOpacity(0.6);

  double responseSize = 20.0;
  MainAxisAlignment dataAlignment = MainAxisAlignment.spaceBetween;

  //!IN-BUILT STATE MANAGEMENT METHODS
  @override
  void dispose() {
    //!DISPOSE ALL TEXT FIELD CONTROLLERS
    _theNameController.dispose();
    _theStaffIDController.dispose();
    _theStaffDepartmentController.dispose();
    _theStaffEmailController.dispose();
    _theStaffPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          height: _screenSize.height / 1.5,
          width: _screenSize.width / 2,
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 20.0,
          ),
          margin: const EdgeInsets.only(
            left: 120.0,
          ),
          decoration: BoxDecoration(
            color: light,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black26.withOpacity(0.2),
                offset: const Offset(
                  1.0,
                  1.0,
                ),
                blurRadius: 90.0,
                spreadRadius: 3.0,
              ),
              BoxShadow(
                color: Colors.black12.withOpacity(0.1),
                offset: const Offset(
                  1.0,
                  1.0,
                ),
                blurRadius: 75.0,
                spreadRadius: 1.0,
              )
            ],
          ),
          child: Row(
            children: <Widget>[
              //!IMAGE
              Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  radius: 45.0,
                  backgroundColor: active,
                  child: CircleAvatar(
                    radius: 40.0,
                    backgroundImage:
                        const AssetImage("images/landing_page_image.png"),
                    backgroundColor: lightGrey,
                  ),
                ),
              ),

              //!SPACER
              const SizedBox(
                width: 20.0,
              ),

              //!IGN UP FORM FIELD.
              Expanded(
                child: SizedBox(
                  height: _screenSize.height / 1.6,
                  width: (_screenSize.width / 2) / 3,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //!TITLE
                        CustomTextWidget(
                            pageTitle: "Sign Up !",
                            titleColour: active,
                            titleSize: 32.0,
                            titleFontWeight: FontWeight.w600),

                        //!DATA FIELDS
                        // ! STAFF FULL NAME
                        TextFormField(
                          controller: _theNameController,
                          keyboardType: TextInputType.name,
                          maxLength: 32,
                          decoration: theTextFieldDecorator,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter your full name";
                            } else {
                              return null;
                            }
                          },
                        ),

                        //!STAFF ID
                        TextFormField(
                          controller: _theStaffIDController,
                          keyboardType: TextInputType.emailAddress,
                          maxLength: 32,
                          decoration: theTextFieldDecorator.copyWith(
                            label: CustomTextWidget(
                                pageTitle: "Staff ID: ",
                                titleColour: active,
                                titleSize: 18.0,
                                titleFontWeight: FontWeight.w600),
                          ),
                          validator: (value) {
                            if (value!.contains("/") == false ||
                                value.length < 12) {
                              return "Enter a valid Staff ID";
                            } else {
                              return null;
                            }
                          },
                        ),

                        //!STAFF DEPARTMENT
                        TextFormField(
                          controller: _theStaffDepartmentController,
                          keyboardType: TextInputType.emailAddress,
                          maxLength: 32,
                          decoration: theTextFieldDecorator.copyWith(
                            label: CustomTextWidget(
                                pageTitle: "Department: ",
                                titleColour: active,
                                titleSize: 18.0,
                                titleFontWeight: FontWeight.w600),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter a Department";
                            } else {
                              return null;
                            }
                          },
                        ),

                        //!STAFF EMAIL
                        TextFormField(
                          controller: _theStaffEmailController,
                          keyboardType: TextInputType.emailAddress,
                          maxLength: 32,
                          decoration: theTextFieldDecorator.copyWith(
                            label: CustomTextWidget(
                                pageTitle: "Email: ",
                                titleColour: active,
                                titleSize: 18.0,
                                titleFontWeight: FontWeight.w600),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter your e-mail address";
                            } else if (value.contains("@") == false ||
                                value.contains("staff.babcock.edu.ng") ==
                                    false) {
                              return "This is not a valid e-mail address";
                            } else {
                              return null;
                            }
                          },
                        ),

                        //!STAFF PASSWORD
                        TextFormField(
                          controller: _theStaffPasswordController,
                          keyboardType: TextInputType.emailAddress,
                          maxLength: 32,
                          decoration: theTextFieldDecorator.copyWith(
                            label: CustomTextWidget(
                                pageTitle: "Password: ",
                                titleColour: active,
                                titleSize: 18.0,
                                titleFontWeight: FontWeight.w600),
                          ),
                          validator: (value) {
                            //!TODO ... ENSURE VERIFICATION FOR USER PASSWORD.
                            if (value == null || value.isEmpty) {
                              return "Enter a password";
                            } else if (value.length < 6) {
                              return "Password must be at least 6 characters long";
                            } else {
                              return null;
                            }
                          },
                        ),

                        //!BUTTONS
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            //!RETURN BUTTON
                            SizedBox(
                              width: ((_screenSize.width / 2) / 3) / 2,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(builder: (context) {
                                      return const LandingPage();
                                    }));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(20.0),
                                    primary: active,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      //!ICON
                                      Icon(
                                        Icons.navigate_before_outlined,
                                        size: 28.0,
                                        color: light,
                                      ),

                                      //!TEXT
                                      CustomTextWidget(
                                          pageTitle: "Homepage",
                                          titleColour: light,
                                          titleSize: 18.0,
                                          titleFontWeight: FontWeight.w600),
                                    ],
                                  )),
                            ),

                            //!SUBMIT BUTTON
                            SizedBox(
                              width: ((_screenSize.width / 2) / 3) / 2,
                              child: ElevatedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      //!FETCH CONTENT OF TEXT FORM FIELDS
                                      String _enteredEmail =
                                          _theStaffEmailController.text;
                                      String _enteredPassword =
                                          _theStaffPasswordController.text;

                                      //!USE CONTENT TO REGISTER USER
                                      try {
                                        //!RUN REGISTRATION.
                                        await _theAuthServiceInstance
                                            .registerWithEmailAndPassword(
                                                email: _enteredEmail,
                                                password: _enteredPassword)
                                            .whenComplete(() {
                                          //!WHEN COMPLETE, PUSH TO DASHBOARD
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return Dashboard();
                                          }));
                                        });
                                      } on FirebaseAuthException catch (e) {
                                        if (e.code == 'weak-password') {
                                          debugPrint(
                                              'The password provided is too weak.');
                                        } else if (e.code ==
                                            'email-already-in-use') {
                                          debugPrint(
                                              'The account already exists for that email.');
                                        }
                                      } catch (e) {
                                        debugPrint(e.toString());
                                      }

                                      //!CHECK IF USER HAS BEEN REGISTERED.
                                      //!PUSH TO DASHBOARD IF USER IS REGISTERED.

                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(20.0),
                                    primary: active,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      //!ICON
                                      Icon(
                                        Icons.navigate_next_outlined,
                                        size: 28.0,
                                        color: light,
                                      ),

                                      //!TEXT
                                      CustomTextWidget(
                                          pageTitle: "Login",
                                          titleColour: light,
                                          titleSize: 18.0,
                                          titleFontWeight: FontWeight.w600),
                                    ],
                                  )),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
