import 'package:flutter/material.dart';
import 'package:ouniee/pages/dashboard.dart';

class MainBody extends StatefulWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  _MainBodyState createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  double containerTwoMargin = 700.0;
  Color getStartedButtonColour = Colors.black;

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
        containerTwoMargin = 0.0;
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

    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //!LEFT CONTAINER
          Container(
            height: _screenSize.height / 2,
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Promotion",
                  style: _bodyTextStyle,
                ),
                Text(
                  "Season ...",
                  style: _bodyTextStyle,
                ),
                Text(
                  "Do you think you meet the requirements"
                  "\nfor this seasons promotion?",
                  style: _bodyTextStyle.copyWith(
                    color: Colors.black38,
                    fontSize: 24.0,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => Dashboard(),
                    ));
                  },
                  onHover: (value) {
                    debugPrint("Hovered over $value");
                    value
                        ? setState(() {
                            getStartedButtonColour = Colors.blue.shade900;
                          })
                        : setState(() {
                            getStartedButtonColour = Colors.black;
                          });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "GET STARTED",
                      style: _bodyTextStyle.copyWith(
                          fontFamily: "poppins-Regular",
                          color: Colors.white,
                          fontSize: 16.0),
                    ),
                    decoration: BoxDecoration(
                        color: getStartedButtonColour,
                        borderRadius: BorderRadius.circular(30.0)),
                  ),
                ),
              ],
            ),
          ),

          //!RIGHT CONTAINER
          Expanded(
            child: ListView(children: <Widget>[
              AnimatedContainer(
                duration: const Duration(milliseconds: 2000),
                curve: Curves.decelerate,
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                margin: EdgeInsets.symmetric(vertical: containerTwoMargin),
                height: _screenSize.height / 1.5,
                width: _screenSize.width / 2.3,
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
        ]);
  }
}
