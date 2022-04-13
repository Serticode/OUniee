import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouniee/constants/controllers.dart';
import 'package:ouniee/constants/style.dart';
import 'package:ouniee/controllers/staff_data_controller.dart';
import 'package:ouniee/controllers/submitted_application_controller.dart';
import 'package:ouniee/pages/overview/widgets/staff_biodata.dart';
import 'package:ouniee/pages/overview/widgets/staff_lecture_data.dart';
import 'package:ouniee/widgets/custom_text_widget.dart';
import 'package:ouniee/widgets/responsive_widget.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  final bool isAdmin = false;
  String isApplicationApproved =
      StaffDataController.usersData["applicationApproved"];

  String staffApplication = "";

  @override
  void didChangeDependencies() async {
    if (isAdmin == true) {
      await SubmittedApplicationsController.areThereApplicationsSubmitted() ==
              true
          ? setState(() {
              staffApplication = "Application Found !";
            })
          : setState(() {
              staffApplication = "No Application Found!";
            });
    } else {
      await SubmittedApplicationsController.didStaffApply() == true
          ? setState(() {
              staffApplication = "Application Found !";
            })
          : setState(() {
              staffApplication = "No Application Found!";
            });
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        //! TITLE
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.all(10.0),
                  margin: EdgeInsets.only(
                      top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                  child: CustomTextWidget(
                    pageTitle: menuController.activeItem.value,
                    titleSize: 21,
                    titleFontWeight: FontWeight.bold,
                    titleColour: dark.withOpacity(0.8),
                  )),
            ],
          ),
        ),

        //!CONTENTS
        Expanded(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //!TOP CONTAINER
                Container(
                  height: _screenSize.height * 0.6,
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          flex: isAdmin == true ? 4 : 2,
                          child: const StaffBioData()),
                      const SizedBox(
                        width: 30.0,
                      ),
                      const Expanded(flex: 2, child: StaffLectureData()),
                    ],
                  ),
                ),

                //!BOTTOM CONTAINER

                Container(
                  height: _screenSize.height * 0.2,
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      //!TITLE
                      CustomTextWidget(
                        pageTitle: isAdmin
                            ? "Applications Pending Approval"
                            : "Application for Promotion",
                        titleSize: 21,
                        titleFontWeight: FontWeight.bold,
                        titleColour: dark.withOpacity(0.5),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          //!CALL
                          Expanded(
                            flex: 1,
                            child: CustomTextWidget(
                              pageTitle: "Submissions",
                              titleSize: 21,
                              titleFontWeight: FontWeight.bold,
                              titleColour: dark,
                            ),
                          ),

                          //!RESPONSE
                          Expanded(
                            flex: 7,
                            child: isApplicationApproved == "true" &&
                                    staffApplication ==
                                        "No Application Found!" &&
                                    isAdmin == false
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      //! STATEMENT
                                      CustomTextWidget(
                                        pageTitle:
                                            "Your application has been approved; You have been PROMOTED!",
                                        titleSize: 18,
                                        titleFontWeight: FontWeight.w600,
                                        titleColour: dark.withOpacity(0.9),
                                      ),

                                      //!BUTTON
                                      ElevatedButton(
                                        onPressed: () {
                                          SubmittedApplicationsController
                                              .acknowledgeApplicationStatus();
                                          setState(() {
                                            isApplicationApproved = "";
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: active,
                                          padding: const EdgeInsets.all(21.0),
                                        ),
                                        child: const CustomTextWidget(
                                          pageTitle: "Acknowledge",
                                          titleSize: 21,
                                          titleFontWeight: FontWeight.normal,
                                          titleColour: Colors.white,
                                        ),
                                      )
                                    ],
                                  )
                                : isApplicationApproved == "false" &&
                                        staffApplication ==
                                            "No Application Found!" &&
                                        isAdmin == false
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          //! STATEMENT
                                          CustomTextWidget(
                                            pageTitle:
                                                "Your application has been declined; PROMOTION REJECTED!",
                                            titleSize: 18,
                                            titleFontWeight: FontWeight.w600,
                                            titleColour: dark.withOpacity(0.9),
                                          ),

                                          //!BUTTON
                                          ElevatedButton(
                                            onPressed: () {
                                              SubmittedApplicationsController
                                                  .acknowledgeApplicationStatus();

                                              setState(() {
                                                isApplicationApproved = "";
                                              });
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: active,
                                              padding:
                                                  const EdgeInsets.all(21.0),
                                            ),
                                            child: const CustomTextWidget(
                                              pageTitle: "Acknowledge",
                                              titleSize: 21,
                                              titleFontWeight:
                                                  FontWeight.normal,
                                              titleColour: Colors.white,
                                            ),
                                          )
                                        ],
                                      )
                                    : Center(
                                        child: CustomTextWidget(
                                          pageTitle: staffApplication,
                                          titleSize: 21,
                                          titleFontWeight: FontWeight.w600,
                                          titleColour: dark.withOpacity(0.9),
                                        ),
                                      ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
