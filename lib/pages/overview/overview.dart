import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouniee/constants/controllers.dart';
import 'package:ouniee/constants/style.dart';
import 'package:ouniee/pages/overview/widgets/staff_biodata.dart';
import 'package:ouniee/pages/overview/widgets/staff_lecture_data.dart';
import 'package:ouniee/widgets/custom_text_widget.dart';
import 'package:ouniee/widgets/responsive_widget.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double responseSize = 24.0;
    double callSize = 24.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        //! TITLE
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.all(10.0),
                  margin: EdgeInsets.only(
                      top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                  child: CustomTextWidget(
                    pageTitle: menuController.activeItem.value,
                    titleSize: 28,
                    titleFontWeight: FontWeight.bold,
                    titleColour: dark.withOpacity(0.8),
                  )),
            ],
          ),
        ),

        //!CONTENTS
        Expanded(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //!TOP CONTAINER
                Container(
                  height: MediaQuery.of(context).size.height / 1.8,
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const <Widget>[
                      Expanded(child: StaffBioData()),
                      SizedBox(
                        width: 30.0,
                      ),
                      Expanded(child: StaffLectureData()),
                    ],
                  ),
                ),

                //!BOTTOM CONTAINER
                Container(
                  height: MediaQuery.of(context).size.height / 3.6,
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 40.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      //!TITLE
                      CustomTextWidget(
                        pageTitle: "Application for Promotion",
                        titleSize: 28,
                        titleFontWeight: FontWeight.bold,
                        titleColour: dark.withOpacity(0.5),
                      ),

                      Row(
                        children: <Widget>[
                          //!CALL
                          Expanded(
                            child: CustomTextWidget(
                              pageTitle: "Submissions",
                              titleSize: callSize,
                              titleFontWeight: FontWeight.bold,
                              titleColour: dark,
                            ),
                          ),

                          //!RESPONSE
                          Expanded(
                            child: CustomTextWidget(
                              pageTitle: "No submissions found",
                              titleSize: responseSize,
                              titleFontWeight: FontWeight.normal,
                              titleColour: dark.withOpacity(0.9),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
