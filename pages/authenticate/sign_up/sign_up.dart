import 'package:flutter/material.dart';
import 'package:ouniee/constants/style.dart';
import 'package:ouniee/controllers/auth_controller.dart';
import 'package:ouniee/pages/dashboard.dart';
import 'package:ouniee/widgets/custom_text_widget.dart';

import '../../landing_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //!KEYS & CONTROLLER
  final _formKey = GlobalKey<FormState>();
  final _theNameController = TextEditingController();
  final _theStaffIDController = TextEditingController();
  final _theStaffDepartmentController = TextEditingController();
  final _theStaffEmailController = TextEditingController();
  final _theStaffPasswordController = TextEditingController();
  final _theStaffContactController = TextEditingController();
  final _theStaffAddressController = TextEditingController();
  final _theIsAdminController = TextEditingController();
  final _theStaffPublicationController = TextEditingController();
  final _theStaffQualificationController = TextEditingController();
  final _theStaffExperienceController = TextEditingController();
  final _theStaffLevelController = TextEditingController();

  //!INPUT DECORATION
  final InputDecoration _textFieldDecoration = InputDecoration(
    filled: true,
    enabledBorder: InputBorder.none,
    focusedBorder: InputBorder.none,
    contentPadding: const EdgeInsets.all(20.0),
    focusColor: Colors.white,
    floatingLabelStyle: TextStyle(color: active),
    hintStyle: const TextStyle(
      fontSize: 14.0,
    ),
  );

  //!IN-BUILT STATE MANAGEMENT METHODS
  @override
  void dispose() {
    //!DISPOSE ALL TEXT FIELD CONTROLLERS
    _theIsAdminController.dispose();
    _theNameController.dispose();
    _theStaffIDController.dispose();
    _theStaffDepartmentController.dispose();
    _theStaffEmailController.dispose();
    _theStaffPasswordController.dispose();
    _theStaffContactController.dispose();
    _theStaffAddressController.dispose();
    _theStaffPublicationController.dispose();
    _theStaffQualificationController.dispose();
    _theStaffExperienceController.dispose();
    _theStaffLevelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Container(
          height: _screenSize.height * 0.9,
          width: _screenSize.width * 0.9,
          padding: const EdgeInsets.all(12),
          color: active.withOpacity(0.2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //!FORM
              SizedBox(
                width: _screenSize.width * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //!SCHOOL NAME
                    Align(
                        alignment: Alignment.topLeft,
                        child: CustomTextWidget(
                            pageTitle: "OUniee",
                            titleColour: active,
                            titleSize: 42,
                            titleFontWeight: FontWeight.w700)),

                    const SizedBox(
                      height: 20.0,
                    ),

                    //!GREETING
                    const CustomTextWidget(
                        pageTitle: "Tell us a little about yourself.",
                        titleColour: Colors.black,
                        titleSize: 32,
                        titleFontWeight: FontWeight.w700),

                    const SizedBox(
                      height: 5.0,
                    ),

                    //!SHORT NOTE
                    const CustomTextWidget(
                        pageTitle:
                            "This is an initial information about you.\nYou can update it anytime.",
                        titleColour: Colors.black45,
                        titleSize: 16,
                        titleFontWeight: FontWeight.w700),

                    const SizedBox(
                      height: 30.0,
                    ),

                    //!FORM FIELD && BUTTONS
                    SizedBox(
                      height: _screenSize.height * 0.6,
                      width: _screenSize.width * 0.6,
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Form(
                              key: _formKey,
                              child: Column(
                                children: <Widget>[
                                  // ! IS THIS AN ADMIN / FULL NAME
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      SizedBox(
                                        width: _screenSize.width * 0.23,
                                        child: TextFormField(
                                          controller: _theIsAdminController,
                                          keyboardType: TextInputType.name,
                                          maxLength: 5,
                                          decoration:
                                              _textFieldDecoration.copyWith(
                                            labelText: "Admin account?",
                                            hintText:
                                                "Is this an admin account? true / false",
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Is this an admin?";
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),

                                      // ! STAFF FULL NAME
                                      SizedBox(
                                        width: _screenSize.width * 0.23,
                                        child: TextFormField(
                                          controller: _theNameController,
                                          keyboardType: TextInputType.name,
                                          maxLength: 32,
                                          decoration:
                                              _textFieldDecoration.copyWith(
                                                  labelText: "Your full name?",
                                                  hintText:
                                                      "Ciroma, Chukwuma Adekunle"),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Enter your full name";
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),

                                  //!STAFF ID
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      SizedBox(
                                        width: _screenSize.width * 0.23,
                                        child: TextFormField(
                                          controller: _theStaffIDController,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          maxLength: 32,
                                          decoration:
                                              _textFieldDecoration.copyWith(
                                            labelText: "Staff ID?",
                                            hintText: "00/SCES/SE/00",
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
                                      ),

                                      //!STAFF DEPARTMENT
                                      SizedBox(
                                        width: _screenSize.width * 0.23,
                                        child: TextFormField(
                                          controller:
                                              _theStaffDepartmentController,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          maxLength: 32,
                                          decoration:
                                              _textFieldDecoration.copyWith(
                                            labelText: "Assigned department?",
                                            hintText: "Software Engineering",
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Enter a Department";
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),

                                  //!STAFF EMAIL
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      SizedBox(
                                        width: _screenSize.width * 0.23,
                                        child: TextFormField(
                                          controller: _theStaffEmailController,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          maxLength: 32,
                                          decoration:
                                              _textFieldDecoration.copyWith(
                                            labelText:
                                                "Staff Account Registration Email?",
                                            hintText:
                                                "you@staff.babcock.edu.ng",
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Enter your e-mail address";
                                            } else if (value.contains("@") ==
                                                    false ||
                                                value.contains(
                                                        "staff.babcock.edu.ng") ==
                                                    false) {
                                              return "This is not a valid e-mail address";
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),

                                      //!STAFF PASSWORD
                                      SizedBox(
                                        width: _screenSize.width * 0.23,
                                        child: TextFormField(
                                          obscureText: true,
                                          controller:
                                              _theStaffPasswordController,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          maxLength: 32,
                                          decoration:
                                              _textFieldDecoration.copyWith(
                                            labelText: "Your account password",
                                            hintText: "******",
                                          ),
                                          validator: (value) {
                                            //!TODO ... ENSURE VERIFICATION FOR USER PASSWORD.
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Enter a password";
                                            } else if (value.length < 6) {
                                              return "Password must be at least 6 characters long";
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),

                                  //!STAFF MOBILE CONTACT
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      SizedBox(
                                        width: _screenSize.width * 0.23,
                                        child: TextFormField(
                                          controller:
                                              _theStaffContactController,
                                          keyboardType: TextInputType.phone,
                                          maxLength: 14,
                                          decoration:
                                              _textFieldDecoration.copyWith(
                                            labelText: "Staff contact?",
                                            hintText: "+2348012345678",
                                          ),
                                          validator: (value) {
                                            if (value!.length < 11 ||
                                                value.length > 14) {
                                              return "Enter a valid contact number";
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),

                                      //!STAFF HOUSE ADDRESS
                                      SizedBox(
                                        width: _screenSize.width * 0.23,
                                        child: TextFormField(
                                          controller:
                                              _theStaffAddressController,
                                          keyboardType: TextInputType.text,
                                          maxLength: 45,
                                          decoration:
                                              _textFieldDecoration.copyWith(
                                            labelText: "Residence address?",
                                            hintText:
                                                "1233 Serti Drive BLVD, Toronto, CA.",
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Enter an address";
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),

                                  //!STAFF QUALIFICATION & EXPERIENCE
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      SizedBox(
                                        width: _screenSize.width * 0.23,
                                        child: TextFormField(
                                          controller:
                                              _theStaffQualificationController,
                                          keyboardType: TextInputType.phone,
                                          maxLength: 45,
                                          decoration:
                                              _textFieldDecoration.copyWith(
                                            labelText: "Qualification",
                                            hintText:
                                                "What is the staff qualification? - MSC, PHD ...",
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Enter a qualification";
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),

                                      //!STAFF EXPERIENCE
                                      SizedBox(
                                        width: _screenSize.width * 0.23,
                                        child: TextFormField(
                                          controller:
                                              _theStaffExperienceController,
                                          keyboardType: TextInputType.text,
                                          maxLength: 45,
                                          decoration:
                                              _textFieldDecoration.copyWith(
                                            labelText: "Experience",
                                            hintText:
                                                "How many years of experience?",
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Enter a number of experience in years ... 6 months = 0.5 years";
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      //!PUBLICATIONS
                                      //!LIST OF PUBLICATIONS
                                      SizedBox(
                                        width: _screenSize.width * 0.23,
                                        child: TextFormField(
                                          controller:
                                              _theStaffPublicationController,
                                          keyboardType: TextInputType.text,
                                          maxLength: 350,
                                          decoration:
                                              _textFieldDecoration.copyWith(
                                            labelText: "List of publications?",
                                            hintText:
                                                "What publications have staff done?",
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Enter the publications of the staff. Each publication separated by a comma.";
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),

                                      //! CURRENT STAFF LEVEL
                                      SizedBox(
                                        width: _screenSize.width * 0.23,
                                        child: TextFormField(
                                          controller: _theStaffLevelController,
                                          keyboardType: TextInputType.text,
                                          maxLength: 20,
                                          decoration: _textFieldDecoration.copyWith(
                                              labelText: "Current Staff Level?",
                                              hintText:
                                                  "Assistant Lecturer, Lecturer 1, Lecturer 2, Assistant Professor, Professor"),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Enter a Staff Level as hinted";
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            //!BUTTONS
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                //!RETURN BUTTON
                                SizedBox(
                                  width: _screenSize.width * 0.15,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return const LandingPage();
                                        }));
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.all(16.0),
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
                                              titleSize: 16.0,
                                              titleFontWeight: FontWeight.w600),
                                        ],
                                      )),
                                ),

                                //!SUBMIT BUTTON
                                SizedBox(
                                  width: _screenSize.width * 0.15,
                                  child: ElevatedButton(
                                      onPressed: () async {
                                        /* Navigator.of(context)
                                            .pushReplacement(MaterialPageRoute(
                                          builder: ((context) => Dashboard()),
                                        )); */
                                        if (_formKey.currentState!.validate()) {
                                          //!FETCH CONTENT OF TEXT FORM FIELDS
                                          String _enteredEmail =
                                              _theStaffEmailController.text;
                                          String _enteredPassword =
                                              _theStaffPasswordController.text;
                                          String _isStaffAnAdmin =
                                              _theIsAdminController.text;
                                          String _fullName =
                                              _theNameController.text;
                                          String _id =
                                              _theStaffIDController.text;
                                          String _department =
                                              _theStaffDepartmentController
                                                  .text;
                                          String _contact =
                                              _theStaffContactController.text;
                                          String _residence =
                                              _theStaffAddressController.text;
                                          String _qualification =
                                              _theStaffQualificationController
                                                  .text;
                                          String _experience =
                                              _theStaffExperienceController
                                                  .text;
                                          String _publication =
                                              _theStaffPublicationController
                                                  .text;
                                          String _staffLevel =
                                              _theStaffLevelController.text;

                                          //!USE CONTENT TO REGISTER USER
                                          try {
                                            //!RUN REGISTRATION.
                                            await /* _theAuthServiceInstance
                                                .registerWithEmailAndPassword */
                                                AuthController.getXSignUp(
                                              email: _enteredEmail,
                                              password: _enteredPassword,
                                              isStaffAnAdmin: _isStaffAnAdmin
                                                      .contains("true")
                                                  ? true
                                                  : false,
                                              theStaffFullName: _fullName,
                                              theStaffID: _id,
                                              theStaffDepartment: _department,
                                              contact: _contact,
                                              experience: _experience,
                                              publication: _publication,
                                              qualification: _qualification,
                                              residence: _residence,
                                              theStaffLevel: _staffLevel,
                                            ).whenComplete(() {
                                              //!WHEN COMPLETE, PUSH TO DASHBOARD
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                      MaterialPageRoute(
                                                          builder: (context) {
                                                return Dashboard();
                                              }));
                                            });
                                          } catch (e) {
                                            //debugPrint(e.toString());
                                          }
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.all(16.0),
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
                                              pageTitle: "Submit",
                                              titleColour: light,
                                              titleSize: 16.0,
                                              titleFontWeight: FontWeight.w600),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //!DIVIDER
              Container(
                width: _screenSize.width * 0.01,
                color: active,
              ),

              //!IMAGE
              Column(
                children: <Widget>[
                  //!IMAGE
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    width: _screenSize.width * 0.3,
                    height: _screenSize.width * 0.3,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/landing_page_image.png"),
                            fit: BoxFit.contain)),
                  ),

                  //!GET REGISTERED
                  CustomTextWidget(
                    pageTitle: "Get\nRegistered.",
                    titleColour: active,
                    titleSize: 84,
                    titleFontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
