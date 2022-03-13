import 'package:flutter/material.dart';
import 'package:ouniee/constants/style.dart';
import 'package:ouniee/controllers/auth_controller.dart';
import 'package:ouniee/pages/landing_page.dart';
import 'package:ouniee/widgets/custom_text_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //!KEY, AUTH & TEXT CONTROLLERS
  final _formKey = GlobalKey<FormState>();
  final _theStaffEmailController = TextEditingController();
  final _theStaffPasswordController = TextEditingController();

  final InputDecoration _theTextFieldDecorator = InputDecoration(
    label: CustomTextWidget(
        pageTitle: "Email: ",
        titleColour: active,
        titleSize: 18.0,
        titleFontWeight: FontWeight.w600),
    filled: true,
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        width: 2.0,
        color: active,
      ),
    ),
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        width: 2.0,
        color: Colors.red.shade900,
      ),
    ),
  );

  @override
  void dispose() {
    //!DISPOSE ALL TEXT FIELD CONTROLLERS
    /* _theNameController.dispose();
    _theStaffIDController.dispose();
    _theStaffDepartmentController.dispose();
     */
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
          height: _screenSize.height * 0.5,
          width: _screenSize.width * 0.4,
          padding: const EdgeInsets.all(
            20.0,
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

              //!LOGIN FORM FIELD.
              Expanded(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //!TITLE
                      CustomTextWidget(
                          pageTitle: "Login",
                          titleColour: active,
                          titleSize: 32.0,
                          titleFontWeight: FontWeight.w600),

                      //!TEXT FORM FIELD
                      //!EMAIL

                      TextFormField(
                        controller: _theStaffEmailController,
                        keyboardType: TextInputType.emailAddress,
                        maxLength: 32,
                        decoration: _theTextFieldDecorator,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter your e-mail address";
                          } else if (value.contains("@") == false) {
                            return "This is not a valid e-mail address";
                          } else {
                            return null;
                          }
                        },
                      ),

                      //!PASSWORD
                      TextFormField(
                        controller: _theStaffPasswordController,
                        keyboardType: TextInputType.emailAddress,
                        maxLength: 32,
                        obscureText: true,
                        obscuringCharacter: "*",
                        decoration: _theTextFieldDecorator.copyWith(
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

                      //!SUBMIT BUTTON
                      //!BUTTONS
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          //!RETURN BUTTON
                          SizedBox(
                            width: _screenSize.width * 0.12,
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                            width: _screenSize.width * 0.12,
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
                                      AuthController.getXSignIn(
                                          userEmail: _enteredEmail,
                                          userPassword: _enteredPassword);

                                      /* await _theAuthServiceInstance
                                          .signInWithEmailAndPassword(
                                              email: _enteredEmail,
                                              password: _enteredPassword)
                                          .whenComplete(() {
                                        //!WHEN COMPLETE, PUSH TO DASHBOARD
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return Dashboard();
                                        }));
                                      }); */
                                    } catch (e) {
                                      //debugPrint(e.toString());
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
