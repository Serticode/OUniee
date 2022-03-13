import 'package:flutter/material.dart';
import 'package:ouniee/widgets/local_navigator.dart';
import 'package:ouniee/widgets/side_menu.dart';

class LargeScreen extends StatelessWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Expanded(flex: 1, child: SideMenu()),
        Expanded(
            flex: 5,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: localNavigator(),
            ))
      ],
    );
  }
}
