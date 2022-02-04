import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ouniee/constants/controllers.dart';
import 'package:ouniee/constants/style.dart';
import 'package:ouniee/pages/landing_page.dart';
import 'package:ouniee/services/auth/auth.dart';
import 'package:ouniee/widgets/custom_text_widget.dart';
import 'package:ouniee/widgets/responsive_widget.dart';

AppBar customAppBar(BuildContext context, GlobalKey<ScaffoldState> key,
    {String? userName}) {
  final _theAuthServiceInstance = AuthService();

  return AppBar(
    leading: ResponsiveWidget.isSmallScreen(context)
        ? IconButton(
            icon: FaIcon(
              FontAwesomeIcons.elementor,
              size: 28.0,
              color: Colors.black87.withOpacity(0.8),
            ),
            onPressed: () {
              key.currentState!.openDrawer();
            })
        : Container(
            padding: const EdgeInsets.only(left: 5),
            child: Image.asset("images/landing_page_image.png"),
          ),
    title: Row(
      //!APP BAR IMAGE
      children: <Widget>[
        //!APP BAR TITLE
        CustomTextWidget(
          pageTitle: "Ouniee",
          titleSize: 22.0,
          titleColour: Colors.grey.shade700,
          titleFontWeight: FontWeight.w600,
        ),

        const SizedBox(
          width: 20.0,
        ),

        //!MIDDLE SPACE
        Expanded(
          child: Center(
            child: ResponsiveWidget.isSmallScreen(context)
                ? CustomTextWidget(
                    pageTitle: "Dashboard",
                    titleSize: 18.0,
                    titleColour: Colors.grey.shade700,
                    titleFontWeight: FontWeight.w600,
                  )
                : CustomTextWidget(
                    pageTitle: "Your Dashboard",
                    titleSize: 22.0,
                    titleColour: Colors.grey.shade700,
                    titleFontWeight: FontWeight.w600,
                  ),
          ),
        ),

        //!OTHER SETTINGS OPTIONS
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const SizedBox(width: 20.0),
            //! LOGOUT BUTTON
            IconButton(
              onPressed: () {
                _theAuthServiceInstance.signOut().whenComplete(() {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return const LandingPage();
                  }));
                });
              },
              icon: FaIcon(
                FontAwesomeIcons.signOutAlt,
                size: 28.0,
                color: Colors.black87.withOpacity(0.8),
              ),
            ),
            const SizedBox(width: 20.0),

            //!NOTIFICATION BUTTON
            Stack(
              children: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.bell,
                    size: 28.0,
                    color: Colors.black87.withOpacity(0.8),
                  ),
                ),
                Positioned(
                    top: 7,
                    right: 7,
                    child: Container(
                      width: 12,
                      height: 12,
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                          color: active,
                          //shape: BoxShape.circle,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: light, width: 2)),
                    )),
              ],
            ),
            const SizedBox(width: 20.0),

            //!DIVIDER & LOGGED IN USER NAME
            Container(
              width: 1,
              height: 24.0,
              color: Colors.grey.shade700,
            ),
            const SizedBox(width: 20.0),

            ResponsiveWidget.isSmallScreen(context)
                ? const SizedBox(width: 1)
                : CustomTextWidget(
                    pageTitle: "Akujor, Samuel O",
                    titleSize: 18.0,
                    titleColour: Colors.grey.shade700,
                    titleFontWeight: FontWeight.w600,
                  ),
            const SizedBox(width: 20.0),

            //!USER PROFILE ICON
            IconButton(
              onPressed: () {},
              icon: FaIcon(
                FontAwesomeIcons.user,
                size: 28.0,
                color: Colors.black87.withOpacity(0.8),
              ),
            ),
            const SizedBox(width: 20.0),
          ],
        ),
      ],
    ),
    automaticallyImplyLeading: false,
    elevation: 0,
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: dark),
  );
}
