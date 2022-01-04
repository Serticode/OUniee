const rootRoute = "/";

const overviewPage = "Overview";
const overviewPageRoute = "/overview";

const staffDetails = "Staff Details";
const staffDetailsPageRoute = "/staff_details_page";

const applyForPromotion = "Apply for Promotion";
const applyForPromotionPageRoute = "/apply_for_promotion_page";

const authenticationPage = "Log out";
const authenticationPageRoute = "/auth";

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}

List<MenuItem> sideMenuItemRoutes = [
  MenuItem(overviewPage, overviewPageRoute),
  MenuItem(staffDetails, staffDetailsPageRoute),
  MenuItem(applyForPromotion, applyForPromotionPageRoute),
  MenuItem(authenticationPage, authenticationPageRoute),
];
