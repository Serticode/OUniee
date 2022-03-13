const rootRoute = "/";

const overviewPage = "Overview";
const overviewPageRoute = "/overview";

const staffDetails = "Staff Details";
const staffDetailsPageRoute = "/staff_details_page";

const applyForPromotion = "Apply for Promotion";
const applyForPromotionPageRoute = "/apply_for_promotion_page";

const promotionRequests = "Promotion Requests";
const promotionRequestPageRoute = "/promotion_requests_page";

const authenticationPage = "Log out";
const authenticationPageRoute = "/auth";

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}

List<MenuItem> sideMenuItemRoutesForAdmin = [
  MenuItem(overviewPage, overviewPageRoute),
  MenuItem(staffDetails, staffDetailsPageRoute),
  MenuItem(promotionRequests, promotionRequestPageRoute),
  MenuItem(authenticationPage, authenticationPageRoute),
];

List<MenuItem> sideMenuItemRoutes = [
  MenuItem(overviewPage, overviewPageRoute),
  MenuItem(staffDetails, staffDetailsPageRoute),
  MenuItem(applyForPromotion, applyForPromotionPageRoute),
  MenuItem(authenticationPage, authenticationPageRoute),
];
