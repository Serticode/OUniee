import 'package:flutter/material.dart';
import 'package:ouniee/widgets/custom_app_bar.dart';
import 'package:ouniee/widgets/large_screen.dart';
import 'package:ouniee/widgets/responsive_widget.dart';
import 'package:ouniee/widgets/small_screen.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> theScaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: theScaffoldKey,
      appBar: customAppBar(context, theScaffoldKey),
      drawer: const Drawer(),
      body: ResponsiveWidget(
        largeScreen: const LargeScreen(),
        mediumScreen: Container(
          color: Colors.purple.shade800,
        ),
        smallScreen: const SmallScreen(),
      ),
    );
  }
}
