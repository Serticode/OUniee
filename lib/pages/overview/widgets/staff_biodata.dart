import 'package:flutter/material.dart';
import 'package:ouniee/constants/style.dart';
import 'package:ouniee/controllers/staff_data_controller.dart';
import 'package:ouniee/widgets/custom_text_widget.dart';

class StaffBioData extends StatelessWidget {
  const StaffBioData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double callSize = 21.0;
    final Color callColour = dark.withOpacity(0.8);
    final Color responseColour = dark.withOpacity(0.6);

    const double responseSize = 18.0;
    MainAxisAlignment dataAlignment = MainAxisAlignment.spaceBetween;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
      decoration: BoxDecoration(
        color: active.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //!TITLE
          CustomTextWidget(
            pageTitle: "Staff Bio Data",
            titleSize: 21,
            titleFontWeight: FontWeight.bold,
            titleColour: dark.withOpacity(0.5),
          ),

          //!OTHER STAFF DETAILS
          // ! STAFF FULL NAME
          Row(mainAxisAlignment: dataAlignment, children: <Widget>[
            //!CALL
            CustomTextWidget(
              pageTitle: "Full Name: ",
              titleSize: callSize,
              titleFontWeight: FontWeight.bold,
              titleColour: callColour,
            ),

            //! RESPONSE
            CustomTextWidget(
              pageTitle: StaffDataController.usersData["staffFullName"],
              titleSize: responseSize,
              titleFontWeight: FontWeight.normal,
              titleColour: responseColour,
            ),
          ]),

          //! STAFF ID
          Row(mainAxisAlignment: dataAlignment, children: <Widget>[
            //!CALL
            CustomTextWidget(
              pageTitle: "Staff ID: ",
              titleSize: callSize,
              titleFontWeight: FontWeight.bold,
              titleColour: callColour,
            ),

            //! RESPONSE
            CustomTextWidget(
              pageTitle: StaffDataController.usersData["staffId"],
              titleSize: responseSize,
              titleFontWeight: FontWeight.normal,
              titleColour: responseColour,
            ),
          ]),

          // ! STAFF MAIL
          Row(mainAxisAlignment: dataAlignment, children: <Widget>[
            //!CALL
            CustomTextWidget(
              pageTitle: "E-Mail: ",
              titleSize: callSize,
              titleFontWeight: FontWeight.bold,
              titleColour: callColour,
            ),

            //! RESPONSE
            CustomTextWidget(
              pageTitle: StaffDataController.usersData["staffEmail"],
              titleSize: responseSize,
              titleFontWeight: FontWeight.normal,
              titleColour: responseColour,
            ),
          ]),

          // ! STAFF DEPARTMENT
          Row(mainAxisAlignment: dataAlignment, children: <Widget>[
            //!CALL
            CustomTextWidget(
              pageTitle: "School & Department: ",
              titleSize: callSize,
              titleFontWeight: FontWeight.bold,
              titleColour: callColour,
            ),

            //! RESPONSE
            CustomTextWidget(
              pageTitle:
                  StaffDataController.usersData["staffAssignedDepartment"],
              titleSize: responseSize,
              titleFontWeight: FontWeight.normal,
              titleColour: responseColour,
            ),
          ]),

          // ! STAFF QUALIFICATION.
          Row(
            mainAxisAlignment: dataAlignment,
            children: <Widget>[
              //!CALL
              CustomTextWidget(
                pageTitle: "Qualification: ",
                titleSize: callSize,
                titleFontWeight: FontWeight.bold,
                titleColour: callColour,
              ),

              //! RESPONSE
              Flexible(
                child: CustomTextWidget(
                  pageTitle: "   " +
                      StaffDataController.usersData["staffQualification"],
                  titleSize: responseSize,
                  titleFontWeight: FontWeight.normal,
                  titleColour: responseColour,
                ),
              ),
            ],
          ),

          // ! STAFF LEVEL.
          Row(
            mainAxisAlignment: dataAlignment,
            children: <Widget>[
              //!CALL
              CustomTextWidget(
                pageTitle: "Staff Level: ",
                titleSize: callSize,
                titleFontWeight: FontWeight.bold,
                titleColour: callColour,
              ),

              //! RESPONSE
              Flexible(
                child: CustomTextWidget(
                  pageTitle: StaffDataController.usersData["currentStaffLevel"],
                  titleSize: responseSize,
                  titleFontWeight: FontWeight.normal,
                  titleColour: responseColour,
                ),
              ),
            ],
          ),

          // ! STAFF YEARS OF EXPERIENCE.
          Row(
            mainAxisAlignment: dataAlignment,
            children: <Widget>[
              //!CALL
              CustomTextWidget(
                pageTitle: "Years of Experience: ",
                titleSize: callSize,
                titleFontWeight: FontWeight.bold,
                titleColour: callColour,
              ),

              //! RESPONSE
              Flexible(
                child: CustomTextWidget(
                  pageTitle:
                      "   " + StaffDataController.usersData["staffExperience"],
                  titleSize: responseSize,
                  titleFontWeight: FontWeight.normal,
                  titleColour: responseColour,
                ),
              ),
            ],
          ),

          // ! STAFF PUBLICATIONS.
          Row(
            mainAxisAlignment: dataAlignment,
            children: <Widget>[
              //!CALL
              CustomTextWidget(
                pageTitle: "List of Publications: ",
                titleSize: callSize,
                titleFontWeight: FontWeight.bold,
                titleColour: callColour,
              ),

              //! RESPONSE
              Flexible(
                child: CustomTextWidget(
                  pageTitle:
                      "   " + StaffDataController.usersData["staffPublication"],
                  titleSize: responseSize,
                  titleFontWeight: FontWeight.normal,
                  titleColour: responseColour,
                ),
              ),
            ],
          ),

          // ! STAFF CONTACT
          Row(mainAxisAlignment: dataAlignment, children: <Widget>[
            //!CALL
            CustomTextWidget(
              pageTitle: "Contact: ",
              titleSize: callSize,
              titleFontWeight: FontWeight.bold,
              titleColour: callColour,
            ),

            //! RESPONSE
            CustomTextWidget(
              pageTitle: StaffDataController.usersData["staffMobileContact"],
              titleSize: responseSize,
              titleFontWeight: FontWeight.normal,
              titleColour: responseColour,
            ),
          ]),

          // ! STAFF HOME ADDRESS.
          Row(
            mainAxisAlignment: dataAlignment,
            children: <Widget>[
              //!CALL
              CustomTextWidget(
                pageTitle: "Residential Address: ",
                titleSize: callSize,
                titleFontWeight: FontWeight.bold,
                titleColour: callColour,
              ),

              //! RESPONSE
              CustomTextWidget(
                pageTitle: StaffDataController.usersData["staffHouseAddress"],
                titleSize: responseSize,
                titleFontWeight: FontWeight.normal,
                titleColour: responseColour,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
