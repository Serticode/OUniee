import 'package:flutter/material.dart';
import 'package:ouniee/constants/style.dart';
import 'package:ouniee/pages/authenticate/sign_up/sign_up.dart';

class LandingPageBody extends StatefulWidget {
  const LandingPageBody({Key? key}) : super(key: key);

  @override
  _LandingPageBody createState() => _LandingPageBody();
}

class _LandingPageBody extends State<LandingPageBody> {
  double containerTwoMargin = 700.0;
  Color _getStartedButtonColour = active;
  bool _isHovering = false;

  final TextStyle _bodyTextStyle = const TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.w800,
      letterSpacing: 1.05,
      fontSize: 112.0,
      fontFamily: "Mohave-Regular");

  animateMarginTwo() {
    Future.delayed(
      const Duration(milliseconds: 700),
    ).then((value) {
      setState(() {
        containerTwoMargin = 30.0;
      });
    });
  }

  @override
  void initState() {
    animateMarginTwo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(12.0),
      margin: EdgeInsets.symmetric(
        vertical: _screenSize.height * 0.02,
        horizontal: _screenSize.width * 0.01,
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //!LEFT CONTAINER
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    color: Colors.black38,
                    fontSize: 24.0,
                  ),
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
                  onHover: (value) {
                    value
                        ? setState(() {
                            _isHovering = value;
                            _getStartedButtonColour = Colors.white;
                          })
                        : setState(() {
                            _isHovering = false;
                            _getStartedButtonColour = active;
                          });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    width: _screenSize.width * 0.1,
                    child: Text(
                      "Get Started",
                      textAlign: TextAlign.center,
                      style: _bodyTextStyle.copyWith(
                          fontFamily: "poppins-Regular",
                          color: _isHovering ? active : Colors.white,
                          fontSize: 16.0),
                    ),
                    decoration: BoxDecoration(
                        color: _getStartedButtonColour,
                        borderRadius: BorderRadius.circular(30.0)),
                  ),
                ),
              ],
            ),

            //!RIGHT CONTAINER
            Expanded(
              child: ListView(children: <Widget>[
                AnimatedContainer(
                  duration: const Duration(seconds: 2),
                  curve: Curves.decelerate,
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  margin: EdgeInsets.symmetric(vertical: containerTwoMargin),
                  height: _screenSize.height * 0.6,
                  width: _screenSize.width * 0.6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade200,
                    image: const DecorationImage(
                      image: AssetImage("images/landing_page_image.png"),
                      fit: BoxFit.contain,
                    ),
                    boxShadow: [
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
                ),
              ]),
            ),
          ]),
    );
  }
}
