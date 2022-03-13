import 'package:flutter/material.dart';
import 'package:ouniee/widgets/landing_page_body.dart';
import 'package:ouniee/widgets/footer.dart';
import 'package:ouniee/widgets/header.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFADA5A0).withAlpha(60),
      //!APP BAR
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(_screenSize.height * 0.08),
        child: AppBar(
          flexibleSpace: const Header(landingPageTitle: "OUniee"),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
      ),

      //!THE BODY
      body: Container(
        width: _screenSize.width * 0.9,
        height: _screenSize.height * 0.9,
        padding: const EdgeInsets.all(12.0),
        margin: EdgeInsets.symmetric(
          vertical: _screenSize.height * 0.02,
          horizontal: _screenSize.width * 0.05,
        ),
        child: const LandingPageBody(),
      ),
      bottomNavigationBar: const Footer(
        developerName: 'Serticode',
      ),
    );
  }
}
