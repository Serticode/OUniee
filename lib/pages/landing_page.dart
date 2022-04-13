import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ouniee/constants/style.dart';
import 'package:ouniee/widgets/landing_page_body.dart';
import 'package:ouniee/widgets/footer.dart';
import 'package:ouniee/widgets/header.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key? key}) : super(key: key);
  final TextStyle _footerTextStyle = TextStyle(
      color: light,
      fontWeight: FontWeight.w500,
      fontSize: 18.0,
      fontFamily: "Poppins");

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: light,
      //!APP BAR
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(_screenSize.height * 0.08),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: _screenSize.width / 18,
          ),
          child: AppBar(
            flexibleSpace: const Header(landingPageTitle: "OUniee"),
            elevation: 0.0,
            backgroundColor: Colors.transparent,
          ),
        ),
      ),

      //!THE BODY
      body: SizedBox(
        child: Stack(alignment: Alignment.center, children: <Widget>[
          //! BACKGROUND CONTAINERS WITH COLOURS
          Row(
            children: <Widget>[
              //! RIGHT SIDE
              Expanded(
                  child: Container(
                color: light,
              )),
              //! LEFT SIDE
              Expanded(
                  child: Container(
                color: active,
              ))
            ],
          ),

          //! THE BODY
          SizedBox(
            width: _screenSize.width * 0.9,
            height: _screenSize.height * 0.80,
            child: const LandingPageBody(),
          ),
        ]),
      ),
      bottomNavigationBar: Row(
        //!MAIN ROW
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //!LEFT SIDE CONTAINER
          Expanded(
            child: Wrap(children: [
              Container(
                  color: light,
                  padding: EdgeInsets.symmetric(
                    horizontal: _screenSize.width / 18,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: Row(children: <Widget>[
                      const Icon(
                        Icons.copyright_outlined,
                        size: 26.0,
                        color: Color(0xFF474644),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      InkWell(
                          child: Text(
                        "2021 Serticode. All Rights Reserved",
                        style: _footerTextStyle.copyWith(
                            color: const Color(0xFF474644)),
                      )),
                    ]),
                  )),
            ]),
          ),

          //!RIGHT SIDE CONTAINER
          Expanded(
            child: Container(
                color: active,
                padding: EdgeInsets.only(
                  right: _screenSize.width / 18,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: SizedBox(
                    width: _screenSize.width * 0.5,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "Buy us coffee ? ",
                            style: _footerTextStyle,
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          IconButton(
                            onPressed: () {},
                            iconSize: 26.0,
                            icon: Icon(
                              Icons.coffee_outlined,
                              color: light,
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "Connect with us: ",
                            style: _footerTextStyle,
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          IconButton(
                            onPressed: () {
                              _lunchURL("https://github.com/Serticode");
                            },
                            iconSize: 26.0,
                            icon: FaIcon(
                              FontAwesomeIcons.github,
                              size: 26.0,
                              color: light,
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          IconButton(
                            onPressed: () {
                              _lunchURL(
                                  "https://www.instagram.com/serticode/?hl=en");
                            },
                            iconSize: 26.0,
                            icon: FaIcon(
                              FontAwesomeIcons.instagram,
                              size: 26.0,
                              color: light,
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          IconButton(
                            onPressed: () {
                              _lunchURL("https://twitter.com/serticode");
                            },
                            iconSize: 26.0,
                            icon: FaIcon(
                              FontAwesomeIcons.twitter,
                              size: 26.0,
                              color: light,
                            ),
                          ),
                        ]),
                  ),
                )),
          ),
        ],
      ),
    );
  }

  Future<void> _lunchURL(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }
}
