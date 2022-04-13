//! BUILD TO RUN LOG IN / LOG OUT.
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouniee/constants/controllers.dart';
import 'package:ouniee/constants/style.dart';
import 'package:ouniee/controllers/auth_controller.dart';
import 'package:ouniee/pages/dashboard.dart';
import 'package:ouniee/widgets/custom_text_widget.dart';
import 'package:ouniee/widgets/responsive_widget.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;

    return Container(
      width: _screenSize.width * 0.8,
      height: _screenSize.height * 0.8,
      margin: EdgeInsets.all(_screenSize.width * 0.03),
      decoration: BoxDecoration(
        color: active,
        border: Border.all(color: active, width: 2.0),
      ),
      child: Row(
        children: [
          //! IMAGE
          const Expanded(
              child: Padding(
            padding: EdgeInsets.all(150.0),
            child: Image(image: AssetImage("images/login_image.png")),
          )),

          //! RIGHT SIDE CONTENT
          Expanded(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(42.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //! TITLE
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            padding: const EdgeInsets.all(12.0),
                            margin: EdgeInsets.only(
                                top: ResponsiveWidget.isSmallScreen(context)
                                    ? 56
                                    : 6),
                            child: CustomTextWidget(
                              pageTitle: menuController.activeItem.value,
                              titleSize: 36,
                              titleFontWeight: FontWeight.bold,
                              titleColour: dark.withOpacity(0.7),
                            )),
                      ],
                    ),
                  ),

                  //! CONTENTS
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          //! STATEMENT
                          CustomTextWidget(
                            pageTitle: "Would you like to logout?",
                            titleSize: 18,
                            titleFontWeight: FontWeight.w600,
                            titleColour: dark.withOpacity(0.9),
                          ),

                          const SizedBox(
                            width: 40.0,
                          ),

                          //!BUTTON
                          ElevatedButton(
                            onPressed: () {
                              AuthController.getXSignOut();
                            },
                            style: ElevatedButton.styleFrom(
                              primary: active,
                              padding: const EdgeInsets.all(21.0),
                            ),
                            child: const CustomTextWidget(
                              pageTitle: "Logout",
                              titleSize: 21,
                              titleFontWeight: FontWeight.normal,
                              titleColour: Colors.white,
                            ),
                          ),

                          const SizedBox(
                            width: 40.0,
                          ),

//!BUTTON
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Dashboard()));
                            },
                            style: ElevatedButton.styleFrom(
                              primary: active,
                              padding: const EdgeInsets.all(21.0),
                            ),
                            child: const CustomTextWidget(
                              pageTitle: "Dashboard",
                              titleSize: 21,
                              titleFontWeight: FontWeight.normal,
                              titleColour: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
