import 'package:flutter/material.dart';
import 'package:ouniee/pages/authenticate/sign_in/sign_in.dart';
import 'package:ouniee/pages/authenticate/sign_up/sign_up_page_one.dart';

class Header extends StatefulWidget {
  final String landingPageTitle;
  const Header({Key? key, required this.landingPageTitle}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final TextStyle _headerTextStyle = const TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.05,
      fontSize: 18.0,
      fontFamily: "Mohave-Regular");

  Color getStartedButtonColour = Colors.black;
  Color getStartedButtonColour2 = Colors.black;

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: _screenSize.width / 7),
      height: _screenSize.height / 10,
      width: _screenSize.width / 1.5,
      child: Row(
        //!MAIN ROW
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //!LEFT SIDE CONTAINER
          SizedBox(
              width: _screenSize.width / 5,
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
                      "FEATURES",
                      style: _headerTextStyle,
                    )),
                    InkWell(
                        child: Text(
                      "RESOURCES",
                      style: _headerTextStyle,
                    )),
                  ])),

          //!RIGHT SIDE CONTAINER
          SizedBox(
              width: _screenSize.width / 6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //!LOGIN
                  InkWell(
                      onHover: (value) {
                        value
                            ? setState(() {
                                getStartedButtonColour = Colors.blue.shade900;
                              })
                            : setState(() {
                                getStartedButtonColour = Colors.black;
                              });
                      },
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_) => const SignIn(),
                        ));
                      },
                      child: Container(
                        width: 120.0,
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "LOG IN",
                          textAlign: TextAlign.center,
                          style: _headerTextStyle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: getStartedButtonColour,
                            borderRadius: BorderRadius.circular(30.0)),
                      )),

                  //!GET STARTED
                  InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_) => const SignUpPageOne(),
                        ));
                      },
                      onHover: (value) {
                        value
                            ? setState(() {
                                getStartedButtonColour2 = Colors.blue.shade900;
                              })
                            : setState(() {
                                getStartedButtonColour2 = Colors.black;
                              });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("GET STARTED",
                            style: _headerTextStyle.copyWith(
                              color: Colors.white,
                            )),
                        decoration: BoxDecoration(
                            color: getStartedButtonColour2,
                            borderRadius: BorderRadius.circular(30.0)),
                      )),
                ],
              )),
        ],
      ),
    );
  }
}