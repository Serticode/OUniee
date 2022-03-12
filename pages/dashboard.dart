import 'package:flutter/material.dart';
import 'package:ouniee/constants/controllers.dart';
import 'package:ouniee/controllers/staff_data_controller.dart';
import 'package:ouniee/model/ouniee_staff_biodata_model.dart';
import 'package:ouniee/widgets/custom_app_bar.dart';
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
            return const Text('Something went wrong');
          }

          //!LOADING SNAPSHOTS?
          //!TODO: USE A CIRCULAR PROGRESS INDICATOR
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
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
