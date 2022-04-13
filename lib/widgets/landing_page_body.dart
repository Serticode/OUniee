import 'package:flutter/material.dart';
import 'package:ouniee/constants/style.dart';
import 'package:ouniee/pages/authenticate/sign_up/sign_up.dart';

class LandingPageBody extends StatefulWidget {
  const LandingPageBody({Key? key}) : super(key: key);

  @override
  _LandingPageBody createState() => _LandingPageBody();
}

class _LandingPageBody extends State<LandingPageBody> {
  final TextStyle _bodyTextStyle = const TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.w800,
      letterSpacing: 1.05,
      fontSize: 75.0,
      fontFamily: "Poppins");

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;

    return Container(
        padding: const EdgeInsets.all(12.0),
        margin: EdgeInsets.symmetric(
          vertical: _screenSize.height * 0.02,
          horizontal: _screenSize.width * 0.01,
        ),
        child: Stack(
          children: <Widget>[
            //! RIGHT SIDE AT THE BASE
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: _screenSize.width * 0.5,
                decoration: BoxDecoration(
                    color: light,
                    image: const DecorationImage(
                        image: AssetImage("images/landing_page_image.png"))),
              ),
            ),

            //! LEFT SIDE ON TOP
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: _screenSize.width * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Promotion\nSeason",
                      style: _bodyTextStyle,
                    ),
                    SizedBox(
                      height: _screenSize.height * 0.05,
                    ),
                    Text(
                      "Do you think you meet the requirements"
                      "\nfor this seasons promotion?",
                      style: _bodyTextStyle.copyWith(
                          color: Colors.black45,
                          fontSize: 30.0,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: _screenSize.height * 0.05,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_) => const SignUp(),
                        ));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(18.0),
                        width: _screenSize.width * 0.1,
                        child: Text(
                          "Get Started",
                          textAlign: TextAlign.center,
                          style: _bodyTextStyle.copyWith(
                              fontFamily: "poppins",
                              color: light,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500),
                        ),
                        decoration: BoxDecoration(
                            color: active,
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
