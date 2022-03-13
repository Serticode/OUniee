import 'package:flutter/material.dart';
import 'package:ouniee/constants/style.dart';
import 'package:ouniee/widgets/custom_text_widget.dart';

class StaffBioData extends StatelessWidget {
  const StaffBioData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double callSize = 22.0;
    Color callColour = dark.withOpacity(0.8);
    Color responseColour = dark.withOpacity(0.6);

    double responseSize = 20.0;
    MainAxisAlignment dataAlignment = MainAxisAlignment.spaceBetween;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
      decoration: BoxDecoration(
        color: Colors.purple.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //!TITLE
          CustomTextWidget(
            pageTitle: "Staff Bio Data",
            titleSize: 26,
            titleFontWeight: FontWeight.bold,
            titleColour: dark.withOpacity(0.5),
          ),

          const SizedBox(
            height: 20.0,
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
              pageTitle: "Akujor Samuel O",
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
              pageTitle: "19/SCES/SE/1234",
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
              pageTitle: "SCES - Software Engineering",
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
              pageTitle: "helpdeskforserticode@gmail.com",
              titleSize: responseSize,
              titleFontWeight: FontWeight.normal,
              titleColour: responseColour,
            ),
          ]),

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
              pageTitle: "+2349030779735",
              titleSize: responseSize,
              titleFontWeight: FontWeight.normal,
              titleColour: responseColour,
            ),
          ]),

          // ! STAFF HOME ADDRESS.
          Row(mainAxisAlignment: dataAlignment, children: <Widget>[
            //!CALL
            CustomTextWidget(
              pageTitle: "Residential Address: ",
              titleSize: callSize,
              titleFontWeight: FontWeight.bold,
              titleColour: callColour,
            ),

            //! RESPONSE
            CustomTextWidget(
              pageTitle: "1233 Serti Drive BLVD, Toronto, CA.",
              titleSize: responseSize,
              titleFontWeight: FontWeight.normal,
              titleColour: responseColour,
            ),
          ]),
        ],
      ),
    );
  }
}
