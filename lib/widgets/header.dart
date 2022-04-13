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
      fontWeight: FontWeight.w500,
      fontSize: 18.0,
      fontFamily: "Poppins");

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Row(
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
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Image.asset("images/Graduation Cap.png"),
                  ),
                  Row(
                    children: <Widget>[
                      InkWell(
                          child: Text(
                        "Features",
                        textAlign: TextAlign.center,
                        style: _headerTextStyle,
                      )),
                      Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: 26,
                        color: active,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                          child: Text(
                        "Resources",
                        textAlign: TextAlign.center,
                        style: _headerTextStyle,
                      )),
                      Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: 26,
                        color: active,
                      )
                    ],
                  ),
                ])),

        //!RIGHT SIDE CONTAINER
        SizedBox(
            width: _screenSize.width * 0.23,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //!LOGIN
                InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (_) => const SignIn(),
                      ));
                    },
                    child: Container(
                      width: _screenSize.width * 0.1,
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Log in",
                        textAlign: TextAlign.center,
                        style: _headerTextStyle.copyWith(color: light),
                      ),
                      decoration: BoxDecoration(
                          color: active,
                          borderRadius: BorderRadius.circular(5.0)),
                    )),

                //!GET STARTED
                InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (_) => const SignUp(),
                      ));
                    },
                    child: Container(
                      width: _screenSize.width * 0.1,
                      padding: const EdgeInsets.all(12.0),
                      margin: const EdgeInsets.only(right: 16.0),
                      child: Text("Sign up",
                          textAlign: TextAlign.center,
                          style: _headerTextStyle.copyWith(color: active)),
                      decoration: BoxDecoration(
                          color: light,
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: active, width: 2.0)),
                    )),
              ],
            )),
      ],
    );
  }
}
