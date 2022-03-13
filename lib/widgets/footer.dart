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
      color: active,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.05,
      fontSize: 18.0,
      fontFamily: "Mohave-Regular");

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: _screenSize.height * 0.005,
        horizontal: _screenSize.width * 0.05,
      ),
      height: _screenSize.height * 0.08,
      child: Row(
        //!MAIN ROW
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //!LEFT SIDE CONTAINER
          SizedBox(
              width: _screenSize.width * 0.3,
              child: Row(children: <Widget>[
                const Icon(
                  Icons.copyright_outlined,
                  size: 28.0,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                InkWell(
                    child: Text(
                  "2021 " + widget.developerName + ". All rights reserved.",
                  style: _footerTextStyle,
                )),
              ])),

          //!RIGHT SIDE CONTAINER
          SizedBox(
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
                      iconSize: 32.0,
                      icon: const Icon(Icons.coffee_outlined),
                    ),
                    const SizedBox(
                      width: 20.0,
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
                      iconSize: 28.0,
                      icon: const FaIcon(
                        FontAwesomeIcons.github,
                        size: 28.0,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    IconButton(
                      onPressed: () {
                        _lunchURL("https://www.instagram.com/serticode/?hl=en");
                      },
                      iconSize: 28.0,
                      icon: const FaIcon(
                        FontAwesomeIcons.instagram,
                        size: 28.0,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    IconButton(
                      onPressed: () {
                        _lunchURL("https://twitter.com/serticode");
                      },
                      iconSize: 28.0,
                      icon: const FaIcon(
                        FontAwesomeIcons.twitter,
                        size: 28.0,
                      ),
                    ),
                  ])),
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
