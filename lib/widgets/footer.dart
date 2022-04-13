import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ouniee/constants/style.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatefulWidget {
  final String developerName;
  const Footer({Key? key, required this.developerName}) : super(key: key);

  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  final TextStyle _footerTextStyle = TextStyle(
      color: light,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.05,
      fontSize: 16.0,
      fontFamily: "Poppins");

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.red,
      height: _screenSize.height * 0.08,
      child: Row(
        //!MAIN ROW
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //!LEFT SIDE CONTAINER
          Expanded(
            child: Container(
                color: light,
                width: _screenSize.width * 0.3,
                child: Row(children: <Widget>[
                  Icon(
                    Icons.copyright_outlined,
                    size: 28.0,
                    color: active,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  InkWell(
                      child: Text(
                    "2021 " + widget.developerName + ". All rights reserved.",
                    style: _footerTextStyle.copyWith(color: active),
                  )),
                ])),
          ),

          //!RIGHT SIDE CONTAINER
          Expanded(
            child: Container(
                color: active,
                width: _screenSize.width * 0.4,
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
                    ])),
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
