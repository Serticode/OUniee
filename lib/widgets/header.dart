import 'package:flutter/material.dart';
import 'package:ouniee/constants/style.dart';
import 'package:ouniee/pages/authenticate/sign_in/sign_in.dart';
import 'package:ouniee/pages/authenticate/sign_up/sign_up.dart';

class Header extends StatefulWidget {
  final String landingPageTitle;
  const Header({Key? key, required this.landingPageTitle}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final TextStyle _headerTextStyle = TextStyle(
      color: active,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.05,
      fontSize: 18.0,
      fontFamily: "Mohave-Regular");

  Color _getStartedButtonColour = active;
  Color _getStartedButtonColour2 = active;
  bool _isHoveringButton1 = false;
  bool _isHoveringButton2 = false;

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: _screenSize.height * 0.005,
        horizontal: _screenSize.width * 0.05,
      ),
      child: Row(
        //!MAIN ROW
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //!LEFT SIDE CONTAINER
          SizedBox(
              width: _screenSize.width * 0.3,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      iconSize: 32.0,
                      icon: const Icon(Icons.school_outlined),
                    ),
                    InkWell(
                        child: Text(
                      "Features",
                      textAlign: TextAlign.center,
                      style: _headerTextStyle,
                    )),
                    InkWell(
                        child: Text(
                      "Resources",
                      textAlign: TextAlign.center,
                      style: _headerTextStyle,
                    )),
                  ])),

          //!RIGHT SIDE CONTAINER
          SizedBox(
              width: _screenSize.width * 0.25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //!LOGIN
                  InkWell(
                      onHover: (value) {
                        value
                            ? setState(() {
                                _isHoveringButton1 = value;
                                _getStartedButtonColour = Colors.white;
                              })
                            : setState(() {
                                _getStartedButtonColour = active;
                                _isHoveringButton1 = false;
                              });
                      },
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_) => const SignIn(),
                        ));
                      },
                      child: Container(
                        width: _screenSize.width * 0.1,
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Log In",
                          textAlign: TextAlign.center,
                          style: _headerTextStyle.copyWith(
                            color: _isHoveringButton1 == true
                                ? active
                                : Colors.white,
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: _getStartedButtonColour,
                            borderRadius: BorderRadius.circular(30.0)),
                      )),

                  //!GET STARTED
                  InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_) => const SignUp(),
                        ));
                      },
                      onHover: (value) {
                        value
                            ? setState(() {
                                _isHoveringButton2 = value;
                                _getStartedButtonColour2 = Colors.white;
                              })
                            : setState(() {
                                _getStartedButtonColour2 = active;
                                _isHoveringButton2 = false;
                              });
                      },
                      child: Container(
                        width: _screenSize.width * 0.1,
                        padding: const EdgeInsets.all(12.0),
                        child: Text("Get Started",
                            textAlign: TextAlign.center,
                            style: _headerTextStyle.copyWith(
                              color: _isHoveringButton2 == true
                                  ? active
                                  : Colors.white,
                            )),
                        decoration: BoxDecoration(
                            color: _getStartedButtonColour2,
                            borderRadius: BorderRadius.circular(30.0)),
                      )),
                ],
              )),
        ],
      ),
    );
  }
}
