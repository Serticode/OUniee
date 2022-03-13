import 'package:flutter/material.dart';
import 'package:ouniee/constants/style.dart';
import 'package:ouniee/widgets/custom_text_widget.dart';

class StaffDetailsLectureData extends StatelessWidget {
  const StaffDetailsLectureData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color callColour = dark.withOpacity(0.8);
    double responseSize = 24.0;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
      decoration: BoxDecoration(
        color: Colors.teal.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //!TITLE
          CustomTextWidget(
            pageTitle: "Courses Taught",
            titleSize: 26,
            titleFontWeight: FontWeight.bold,
            titleColour: dark.withOpacity(0.5),
          ),

          const SizedBox(
            height: 20.0,
          ),

          //! STAFF COURSES

          //! RESPONSE
          Expanded(
            child: ListView.builder(
                itemCount: 7,
                itemBuilder: (_, __) {
                  return Container(
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: CustomTextWidget(
                      pageTitle: "Course $__",
                      titleSize: responseSize,
                      titleFontWeight: FontWeight.normal,
                      titleColour: callColour,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
