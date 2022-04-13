import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouniee/constants/style.dart';
import 'package:ouniee/controllers/auth_controller.dart';
import 'package:ouniee/pages/authenticate/sign_in/sign_in.dart';
import 'package:ouniee/pages/dashboard.dart';
import 'package:ouniee/pages/landing_page.dart';
import 'package:ouniee/widgets/custom_text_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //! CHECKED BOX VALUE
  bool _isChecked = false;
  //!KEYS & CONTROLLER
  final _formKey = GlobalKey<FormState>();
  final _theNameController = TextEditingController();
  final _theStaffIDController = TextEditingController();
  final _theStaffDepartmentController = TextEditingController();
  final _theStaffEmailController = TextEditingController();
  final _theStaffPasswordController = TextEditingController();
  final _theStaffContactController = TextEditingController();
  final _theStaffAddressController = TextEditingController();
  final _theStaffPublicationController = TextEditingController();
  final _theStaffQualificationController = TextEditingController();
  final _theStaffExperienceController = TextEditingController();
  final _theStaffLevelController = TextEditingController();

  //!INPUT DECORATION
  final InputDecoration _textFieldDecoration = InputDecoration(
    enabledBorder: const UnderlineInputBorder(),
    focusedBorder: const UnderlineInputBorder(),
    contentPadding: const EdgeInsets.all(12.0),
    focusColor: active,
    floatingLabelStyle: TextStyle(color: active),
    hintStyle: const TextStyle(
      fontSize: 14.0,
    ),
  );

  //! TEXT STYLE
  final TextStyle _bodyTextStyle = const TextStyle(
      color: Color(0xFF474644),
      fontWeight: FontWeight.w500,
      fontSize: 42.0,
      fontFamily: "Poppins");

  final TextStyle _spanTextStyle = TextStyle(
    color: Colors.transparent,
    fontWeight: FontWeight.w500,
    fontSize: 14.0,
    fontFamily: "Poppins",
    decoration: TextDecoration.underline,
    decorationColor: active,
    decorationThickness: 1.5,
    shadows: [Shadow(color: active, offset: const Offset(0, -5))],
  );

  //!IN-BUILT STATE MANAGEMENT METHODS
  @override
  void dispose() {
    //!DISPOSE ALL TEXT FIELD CONTROLLERS
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
      backgroundColor: light,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 120.0, vertical: 40.0),
        child: Material(
          elevation: 30.0,
          shadowColor: active.withOpacity(0.5),
          child: Container(
            width: _screenSize.width * 0.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(width: 3.0, color: active),
              color: light,
            ),
            padding:
                const EdgeInsets.symmetric(horizontal: 60.0, vertical: 20.0),
            child: Stack(children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //! IMAGE
                  CircleAvatar(
                    radius: 40.0,
                    backgroundColor: const Color(0XFFC4C4C4).withOpacity(0.8),
                    child: const CircleAvatar(
                      radius: 20.0,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage("images/Graduation Cap.png"),
                    ),
                  ),

                  //! REGISTER
                  Text("Register",
                      style: _bodyTextStyle.copyWith(color: active)),

                  //! LETS GET YOU SET
                  Text("Let's get you set for promotion!",
                      style: _bodyTextStyle.copyWith(
                        fontSize: 21.0,
                      )),

                  //! FORM
                  Container(
                    height: _screenSize.height * 0.5,
                    width: _screenSize.width * 0.5,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            // !  FULL NAME / EMAIL
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                // ! STAFF FULL NAME
                                SizedBox(
                                  width: _screenSize.width * 0.23,
                                  child: TextFormField(
                                    controller: _theNameController,
                                    keyboardType: TextInputType.name,
                                    maxLength: 32,
                                    decoration: _textFieldDecoration.copyWith(
                                        labelText: "Full name",
                                        hintText: "Ciroma, Chukwuma Adekunle"),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Enter your full name";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),

                                //! EMAIL
                                SizedBox(
                                  width: _screenSize.width * 0.23,
                                  child: TextFormField(
                                    controller: _theStaffEmailController,
                                    keyboardType: TextInputType.emailAddress,
                                    maxLength: 32,
                                    decoration: _textFieldDecoration.copyWith(
                                      labelText: "Email",
                                      hintText: "you@staff.babcock.edu.ng",
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Enter your e-mail address";
                                      } else if (value.contains("@") == false ||
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
                              ],
                            ),

                            //!STAFF MOBILE CONTACT
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                SizedBox(
                                  width: _screenSize.width * 0.23,
                                  child: TextFormField(
                                    controller: _theStaffContactController,
                                    keyboardType: TextInputType.phone,
                                    maxLength: 14,
                                    decoration: _textFieldDecoration.copyWith(
                                      labelText: "Phone number",
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
                                    controller: _theStaffAddressController,
                                    keyboardType: TextInputType.text,
                                    maxLength: 45,
                                    decoration: _textFieldDecoration.copyWith(
                                      labelText: "Address?",
                                      hintText:
                                          "1233 Serti Drive BLVD, Toronto, CA.",
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Enter an address";
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                //!STAFF PASSWORD
                                SizedBox(
                                  width: _screenSize.width * 0.23,
                                  child: TextFormField(
                                    obscureText: true,
                                    controller: _theStaffPasswordController,
                                    keyboardType: TextInputType.emailAddress,
                                    maxLength: 32,
                                    decoration: _textFieldDecoration.copyWith(
                                      labelText: "Password",
                                      hintText: "******",
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
                                ),

                                SizedBox(
                                  width: _screenSize.width * 0.23,
                                  child: TextFormField(
                                    controller: _theStaffIDController,
                                    keyboardType: TextInputType.emailAddress,
                                    maxLength: 32,
                                    decoration: _textFieldDecoration.copyWith(
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
                              ],
                            ),

                            //!STAFF EMAIL
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                //!STAFF DEPARTMENT
                                SizedBox(
                                  width: _screenSize.width * 0.23,
                                  child: TextFormField(
                                    controller: _theStaffDepartmentController,
                                    keyboardType: TextInputType.emailAddress,
                                    maxLength: 32,
                                    decoration: _textFieldDecoration.copyWith(
                                      labelText: "Department?",
                                      hintText: "Software Engineering",
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Enter a Department";
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
                                        labelText: "Level?",
                                        hintText:
                                            "Assistant Lecturer, Lecturer 1, Lecturer 2, Assistant Professor, Professor"),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Enter a Staff Level as hinted";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),

                            //!STAFF PUBLICATIONS && QUALIFICATION
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                //!PUBLICATIONS
                                //!LIST OF PUBLICATIONS
                                SizedBox(
                                  width: _screenSize.width * 0.23,
                                  child: TextFormField(
                                    controller: _theStaffPublicationController,
                                    keyboardType: TextInputType.text,
                                    maxLength: 350,
                                    decoration: _textFieldDecoration.copyWith(
                                      labelText: "List of publications?",
                                      hintText:
                                          "What publications have staff done?",
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Enter the publications of the staff. Each publication separated by a comma.";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: _screenSize.width * 0.23,
                                  child: TextFormField(
                                    controller:
                                        _theStaffQualificationController,
                                    keyboardType: TextInputType.phone,
                                    maxLength: 45,
                                    decoration: _textFieldDecoration.copyWith(
                                      labelText: "Qualification",
                                      hintText:
                                          "What is the staff qualification? - MSC, PHD ...",
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Enter a qualification";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                //!STAFF EXPERIENCE
                                SizedBox(
                                  width: _screenSize.width * 0.23,
                                  child: TextFormField(
                                    controller: _theStaffExperienceController,
                                    keyboardType: TextInputType.text,
                                    maxLength: 45,
                                    decoration: _textFieldDecoration.copyWith(
                                      labelText: "Experience",
                                      hintText: "How many years of experience?",
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Enter a number of experience in years ... 6 months = 0.5 years";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),

                                //! AGREE TO TERMS AND CONDITIONS
                                SizedBox(
                                  width: _screenSize.width * 0.23,
                                  child: Row(
                                    children: <Widget>[
                                      Transform.scale(
                                        scale: 1.5,
                                        child: Checkbox(
                                          value: _isChecked,
                                          onChanged: (currentValue) =>
                                              setState(() {
                                            _isChecked = currentValue!;
                                          }),
                                          checkColor: active,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      const CustomTextWidget(
                                          pageTitle: "I agree to the ",
                                          titleColour: Color(0xFF474644),
                                          titleSize: 16.0,
                                          titleFontWeight: FontWeight.w500),
                                      Text("Terms and Conditions ",
                                          style: _spanTextStyle),
                                      const CustomTextWidget(
                                          pageTitle: "and ",
                                          titleColour: Color(0xFF474644),
                                          titleSize: 16.0,
                                          titleFontWeight: FontWeight.w500),
                                      Text(
                                        "Privacy Policy",
                                        style: _spanTextStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  //! REGISTER BUTTON
                  SizedBox(
                    width: _screenSize.width * 0.09,
                    child: ElevatedButton(
                        onPressed: () async {
                          //! IS CHECKED
                          if (_isChecked == false) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Do you accept our Terms and Conditions?")));
                          }

                          if (_formKey.currentState!.validate()) {
                            //!FETCH CONTENT OF TEXT FORM FIELDS
                            String _enteredEmail =
                                _theStaffEmailController.text;
                            String _enteredPassword =
                                _theStaffPasswordController.text;
                            String _fullName = _theNameController.text;
                            String _id = _theStaffIDController.text;
                            String _department =
                                _theStaffDepartmentController.text;
                            String _contact = _theStaffContactController.text;
                            String _residence = _theStaffAddressController.text;
                            String _qualification =
                                _theStaffQualificationController.text;
                            String _experience =
                                _theStaffExperienceController.text;
                            String _publication =
                                _theStaffPublicationController.text;
                            String _staffLevel = _theStaffLevelController.text;

                            //!USE CONTENT TO REGISTER USER
                            try {
                              //!RUN REGISTRATION.
                              await AuthController.getXSignUp(
                                email: _enteredEmail,
                                password: _enteredPassword,
                                isStaffAnAdmin: false,
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
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (context) {
                                  return Dashboard();
                                }));
                              });
                            } catch (e) {
                              //debugPrint(e.toString());
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(21.0),
                          primary: active,
                        ),
                        child: CustomTextWidget(
                            pageTitle: "Sign up",
                            titleColour: light,
                            titleSize: 18.0,
                            titleFontWeight: FontWeight.w500)),
                  ),

                  //! DO NOT HAVE AN ACCOUNT
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CustomTextWidget(
                          pageTitle: "Already have an account?",
                          titleColour: Color(0xFF474644),
                          titleSize: 21.0,
                          titleFontWeight: FontWeight.w500),
                      const SizedBox(
                        width: 20.0,
                      ),
                      InkWell(
                        onTap: (() => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: ((context) => const SignIn())))),
                        child: CustomTextWidget(
                            pageTitle: "Sign in",
                            titleColour: active,
                            titleSize: 21.0,
                            titleFontWeight: FontWeight.w600),
                      )
                    ],
                  )
                ],
              ),

              //! CANCEL BUTTON
              Positioned(
                top: 0.0,
                left: _screenSize.width * 0.5,
                child: InkWell(
                  onTap: () =>
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (_) => LandingPage(),
                  )),
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundColor: const Color(0XFFC4C4C4).withOpacity(0.3),
                    child: Material(
                      elevation: 20.0,
                      shadowColor: active.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(200),
                      child: CircleAvatar(
                        radius: 20.0,
                        backgroundColor: Colors.transparent,
                        child: Icon(
                          Icons.cancel_outlined,
                          size: 28,
                          color: active,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
