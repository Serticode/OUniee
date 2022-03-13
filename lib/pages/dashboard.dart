import 'package:flutter/material.dart';
import 'package:ouniee/constants/controllers.dart';
import 'package:ouniee/constants/style.dart';
import 'package:ouniee/controllers/staff_data_controller.dart';
import 'package:ouniee/model/ouniee_staff_biodata_model.dart';
import 'package:ouniee/widgets/custom_app_bar.dart';
import 'package:ouniee/widgets/custom_text_widget.dart';
import 'package:ouniee/widgets/large_screen.dart';
import 'package:ouniee/widgets/responsive_widget.dart';
import 'package:ouniee/widgets/small_screen.dart';

class Dashboard extends StatelessWidget {
  final GlobalKey<ScaffoldState> theScaffoldKey = GlobalKey();

  Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<OUnieeStaffBioDataModel>>(
        stream: staffDataController.getStaffDataFromFirebase(),
        builder: (context, snapshot) {
          //!SNAPSHOT WITH ERRORS?
          if (snapshot.hasError) {
            //!TODO: SHOW AN ANIMATED PAGE FOR ERRORS
            return Container(
                padding: const EdgeInsets.all(21.0),
                child: Center(
                    child: CustomTextWidget(
                        pageTitle: "Something Went Wrong",
                        titleColour: dark.withOpacity(0.8),
                        titleSize: 21.0,
                        titleFontWeight: FontWeight.w600)));
          }

          //!LOADING SNAPSHOTS?
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //! PROGRESS INDICATOR
                Transform.scale(
                  scale: 7.0,
                  child: CircularProgressIndicator(
                    backgroundColor: dark.withOpacity(0.8),
                    color: active,
                    strokeWidth: 4.0,
                  ),
                ),

                //!TEXT
                CustomTextWidget(
                    pageTitle: "Loading",
                    titleColour: dark.withOpacity(0.8),
                    titleSize: 28.0,
                    titleFontWeight: FontWeight.w600),
              ],
            );
          }

          return Scaffold(
            key: theScaffoldKey,
            appBar: customAppBar(context, theScaffoldKey,
                userEmail: MyUser().email,
                userName: StaffDataController.usersData["staffFullName"]),
            drawer: const Drawer(),
            body: ResponsiveWidget(
              largeScreen: const LargeScreen(),
              mediumScreen: Container(
                color: Colors.purple.shade800,
              ),
              smallScreen: const SmallScreen(),
            ),
          );
        });
  }
}
