import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouniee/constants/controllers.dart';
import 'package:ouniee/constants/style.dart';
import 'package:ouniee/pages/staff_details/widgets/edit_staff_details_bio_data.dart';
import 'package:ouniee/pages/staff_details/widgets/edit_staff_details_lecture_data.dart';
import 'package:ouniee/pages/staff_details/widgets/staff_details_bio_data.dart';
import 'package:ouniee/pages/staff_details/widgets/staff_details_lecture_data.dart';
import 'package:ouniee/widgets/custom_text_widget.dart';
import 'package:ouniee/widgets/responsive_widget.dart';

class EditStaffDetailsPage extends StatelessWidget {
  const EditStaffDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  height: MediaQuery.of(context).size.height / 1.2,
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const <Widget>[
                      //!LEFT CONTAINER
                      Expanded(child: EditStaffDetailsBioData()),
                      SizedBox(
                        width: 30.0,
                      ),
                      //!RIGHT CONTAINER
                      Expanded(child: EditStaffDetailsLectureData()),
                    ],
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
