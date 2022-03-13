import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouniee/constants/controllers.dart';
import 'package:ouniee/constants/style.dart';
import 'package:ouniee/pages/staff_details/widgets/staff_details_bio_data.dart';
import 'package:ouniee/pages/staff_details/widgets/staff_details_lecture_data.dart';
import 'package:ouniee/widgets/custom_text_widget.dart';
import 'package:ouniee/widgets/responsive_widget.dart';

class StaffDetailsPage extends StatelessWidget {
  const StaffDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const <Widget>[
                      //!LEFT CONTAINER
                      Expanded(child: StaffDetailsBioData()),
                      SizedBox(
                        width: 30.0,
                      ),
                      //!RIGHT CONTAINER
                      Expanded(child: StaffDetailsLectureData()),
                    ],
                  ),
                ),

                //!BOTTOM CONTAINER
                Container(
                    height: 60.0,
                    width: MediaQuery.of(context).size.width / 12,
                    padding: const EdgeInsets.symmetric(
                        vertical: 3.0, horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border:
                          Border.all(width: 3, color: dark.withOpacity(0.5)),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: TextButton(
                          onPressed: () {
                            debugPrint("TEXT BUTTON - EDIT PRESSED.");
                          },
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(20.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(
                                Icons.edit_outlined,
                                size: callSize,
                                color: dark.withOpacity(0.8),
                              ),
                              Text(
                                "Edit",
                                style: TextStyle(
                                    fontSize: callSize,
                                    color: dark.withOpacity(0.8)),
                              ),
                            ],
                          )),
                    )),
              ],
            ))
      ],
    );
  }
}
