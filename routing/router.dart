import 'package:flutter/material.dart';
import 'package:ouniee/pages/applications/application_page.dart';
import 'package:ouniee/pages/applications/submitted_applications_page.dart';
import 'package:ouniee/pages/overview/overview.dart';
import 'package:ouniee/pages/staff_details/widgets/edit_staff_details.dart';
import 'package:ouniee/routing/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case overviewPageRoute:
      return _getPageRoute(const OverviewPage());
    case staffDetailsPageRoute:
      return _getPageRoute(const EditStaffDetailsPage());
    case applyForPromotionPageRoute:
      return _getPageRoute(const ApplicationsPage());
    case promotionRequestPageRoute:
      return _getPageRoute(const SubmittedApplications());
    case authenticationPageRoute:
      return _getPageRoute(const OverviewPage());
    default:
      return _getPageRoute(const OverviewPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
