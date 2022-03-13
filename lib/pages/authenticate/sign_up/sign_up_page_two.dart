import 'package:flutter/material.dart';
import 'package:ouniee/constants/style.dart';
import 'package:ouniee/pages/authenticate/sign_up/sign_up_page_two.dart';
import 'package:ouniee/pages/dashboard.dart';
import 'package:ouniee/widgets/custom_text_widget.dart';

class SignUpPageTwo extends StatefulWidget {
  const SignUpPageTwo({Key? key}) : super(key: key);

  @override
  State<SignUpPageTwo> createState() => _SignUpPageTwoState();
}

class _SignUpPageTwoState extends State<SignUpPageTwo> {
  final _formKey = GlobalKey<FormState>();
  double callSize = 18.0;
  Color callColour = dark.withOpacity(0.8);
  Color responseColour = dark.withOpacity(0.6);

  double responseSize = 20.0;
  MainAxisAlignment dataAlignment = MainAxisAlignment.spaceBetween;

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          height: _screenSize.height / 2.5,
          width: _screenSize.width / 3,
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 20.0,
          ),
          margin: const EdgeInsets.only(left: 120.0),
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

              //!SIGN UP FORM FIELD.
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
                          keyboardType: TextInputType.name,
                          maxLength: 32,
                          decoration: theTextFieldDecorator.copyWith(
                            label: CustomTextWidget(
                                pageTitle: "Residential address: ",
                                titleColour: active,
                                titleSize: 18.0,
                                titleFontWeight: FontWeight.w600),
                          ),
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

                        //!SUBMIT BUTTON
                        SizedBox(
                          width: ((_screenSize.width / 2) / 3) / 2,
                          child: ElevatedButton(
                              onPressed: () {
                                /* // Validate returns true if the form is valid, or false otherwise.
                                if (_formKey.currentState!.validate()) {
                                  // If the form is valid, display a snackbar. In the real world,
                                  // you'd often call a server or save the information in a database.
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpPageTwo()));
                                } */
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Dashboard()));
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
                                      pageTitle: "Next",
                                      titleColour: light,
                                      titleSize: 18.0,
                                      titleFontWeight: FontWeight.w600),
                                ],
                              )),
                        )
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
