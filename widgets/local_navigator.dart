import 'package:flutter/cupertino.dart';
import 'package:ouniee/constants/controllers.dart';
import 'package:ouniee/routing/router.dart';
import 'package:ouniee/routing/routes.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: overviewPageRoute,
    );
