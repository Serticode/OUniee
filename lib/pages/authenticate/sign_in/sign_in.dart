import 'package:flutter/material.dart';
import 'package:ouniee/constants/style.dart';
import 'package:ouniee/controllers/auth_controller.dart';
import 'package:ouniee/pages/authenticate/sign_up/sign_up.dart';
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
    contentPadding: const EdgeInsets.all(32.0),
    label: const CustomTextWidget(
        pageTitle: "Email Address ",
        titleColour: Color(0xFF474644),
        titleSize: 18.0,
        titleFontWeight: FontWeight.w500),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.5,
        color: Color(0xFF474644),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2.0,
        color: active,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: Colors.red.shade900,
      ),
    ),
  );

  final TextStyle _bodyTextStyle = const TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.05,
      fontSize: 36.0,
      fontFamily: "Poppins");

  @override
  void dispose() {
    //!DISPOSE ALL TEXT FIELD CONTROLLERS
    _theStaffEmailController.dispose();
    _theStaffPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 60.0),
          child: Stack(children: <Widget>[
            Container(
                decoration: BoxDecoration(
                  color: active,
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(color: active, width: 2.0),
                ),
                child: Row(
                  children: <Widget>[
                    //! IMAGE
                    const Expanded(
                        child: Padding(
                      padding: EdgeInsets.all(60.0),
                      child: Image(image: AssetImage("images/login_image.png")),
                    )),

                    //! FORM
                    Expanded(
                        child: Container(
                      color: light,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60.0, vertical: 30.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            //! IMAGE
                            CircleAvatar(
                              radius: 60.0,
                              backgroundColor:
                                  const Color(0XFFC4C4C4).withOpacity(0.8),
                              child: const CircleAvatar(
                                radius: 40.0,
                                backgroundColor: Colors.transparent,
                                backgroundImage:
                                    AssetImage("images/Graduation Cap.png"),
                              ),
                            ),

                            //! GREETING
                            Text(
                              "Hello Again!",
                              style: _bodyTextStyle,
                            ),

                            //! DO YOU THINK
                            Text(
                              "Do you think you meet the requirements for this seasons promotion?",
                              textAlign: TextAlign.center,
                              style: _bodyTextStyle.copyWith(
                                  fontSize: 21, color: Colors.black38),
                            ),

                            //! TEXT FIELDS
                            TextFormField(
                              controller: _theStaffEmailController,
                              keyboardType: TextInputType.emailAddress,
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
                              obscureText: true,
                              obscuringCharacter: "*",
                              decoration: _theTextFieldDecorator.copyWith(
                                label: const CustomTextWidget(
                                    pageTitle: "Password ",
                                    titleColour: Color(0xFF474644),
                                    titleSize: 18.0,
                                    titleFontWeight: FontWeight.w500),
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

                            //! LOG IN BUTTON
                            //!SUBMIT BUTTON
                            SizedBox(
                              width: _screenSize.width * 0.12,
                              child: ElevatedButton(
                                  onPressed: () {
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
                                  child: CustomTextWidget(
                                      pageTitle: "Login",
                                      titleColour: light,
                                      titleSize: 18.0,
                                      titleFontWeight: FontWeight.w500)),
                            ),

                            //! DO NOT HAVE AN ACCOUNT
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CustomTextWidget(
                                    pageTitle: "Don't have an account?",
                                    titleColour: Color(0xFF474644),
                                    titleSize: 18.0,
                                    titleFontWeight: FontWeight.w500),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                InkWell(
                                  onTap: (() => Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                          builder: ((context) =>
                                              const SignUp())))),
                                  child: CustomTextWidget(
                                      pageTitle: "Sign up",
                                      titleColour: active,
                                      titleSize: 18.0,
                                      titleFontWeight: FontWeight.w600),
                                )
                              ],
                            ),

                            //! CANCEL BUTTON
                            InkWell(
                              onTap: () => Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (_) => LandingPage(),
                              )),
                              child: CircleAvatar(
                                radius: 40.0,
                                backgroundColor:
                                    const Color(0XFFC4C4C4).withOpacity(0.3),
                                child: Material(
                                  elevation: 30.0,
                                  shadowColor: active.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(200),
                                  child: CircleAvatar(
                                    radius: 30.0,
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
                          ],
                        ),
                      ),
                    ))
                  ],
                )),
          ]),
        ),
      ),
    );
  }
}
