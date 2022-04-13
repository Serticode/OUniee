import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouniee/constants/controllers.dart';
import 'package:ouniee/constants/firebase.dart';
import 'package:ouniee/constants/style.dart';
import 'package:ouniee/controllers/staff_data_controller.dart';
import 'package:ouniee/controllers/staff_level_controller.dart';
import 'package:ouniee/controllers/submitted_application_controller.dart';
import 'package:ouniee/widgets/custom_text_widget.dart';
import 'package:ouniee/widgets/responsive_widget.dart';

class ApplicationsPage extends StatefulWidget {
  const ApplicationsPage({Key? key}) : super(key: key);

  @override
  State<ApplicationsPage> createState() => _ApplicationsPageState();
}

class _ApplicationsPageState extends State<ApplicationsPage> {
  List<String> selectedCriteria = [];
  final List<String> _criteriaList = StaffLevelController.availableCriteria(
      theCurrentStaffLevel: StaffDataController.usersData["currentStaffLevel"]);
  String? attachedFileName;
  File? theAttachedFile;
  final TextEditingController _coverLetterController = TextEditingController();
  final TextEditingController _leadershipSkillController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool? _isStaffPromoted;

  @override
  void didChangeDependencies() async {
    _isStaffPromoted;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _coverLetterController.dispose();
    _leadershipSkillController.dispose();
    super.dispose();
  }

  _buildCriteriaChoiceList({required List<String>? itemsToBuild}) {
    List<Widget> choices = [];
    for (var item in itemsToBuild!) {
      choices.add(
        Container(
          color: Colors.transparent,
          margin: const EdgeInsets.all(21.0),
          child: ChoiceChip(
            padding: const EdgeInsets.all(21.0),
            elevation: 4.0,
            pressElevation: 8.0,
            backgroundColor: active.withOpacity(0.1),
            label: CustomTextWidget(
              pageTitle: item,
              titleSize: 14.0,
              titleFontWeight: FontWeight.bold,
              titleColour: active,
            ),
            selectedColor: Colors.white,
            selected: selectedCriteria.contains(item),
            onSelected: (selected) {
              setState(() {
                selectedCriteria.contains(item)
                    ? selectedCriteria.remove(item)
                    : selectedCriteria.add(item);
              });
            },
          ),
        ),
      );
    }
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        //! TITLE
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.all(12.0),
                  margin: EdgeInsets.only(
                      top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                  child: CustomTextWidget(
                    pageTitle: menuController.activeItem.value,
                    titleSize: 21,
                    titleFontWeight: FontWeight.bold,
                    titleColour: dark.withOpacity(0.7),
                  )),
            ],
          ),
        ),

        //!CONTENTS

        //! IS PROMOTION DECLINED?
        (_isStaffPromoted != null && _isStaffPromoted == false)
            ? Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: _screenSize.width * 0.1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CustomTextWidget(
                        pageTitle: "Your Application is Declined!",
                        titleSize: 21,
                        titleFontWeight: FontWeight.bold,
                        titleColour: dark.withOpacity(0.8),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          //! STATEMENT
                          CustomTextWidget(
                            pageTitle:
                                "Your application has been declined; You have NOT been PROMOTED!",
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
                                _isStaffPromoted = null;
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
                    ],
                  ),
                ),
              )
            :

            //! IS PROMOTION APPROVED?
            (_isStaffPromoted != null && _isStaffPromoted == true)
                ? Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: _screenSize.width * 0.1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CustomTextWidget(
                            pageTitle: "Your Application is Approved!",
                            titleSize: 21,
                            titleFontWeight: FontWeight.bold,
                            titleColour: dark.withOpacity(0.8),
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                    _isStaffPromoted = null;
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
                        ],
                      ),
                    ),
                  )
                :

                //! REGULAR VIEW
                Expanded(
                    child: StaffDataController.usersData["isAdmin"]
                        ? Container(
                            margin:
                                EdgeInsets.only(left: _screenSize.width * 0.1),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CustomTextWidget(
                                  pageTitle: "You are a Professor",
                                  titleSize: 21,
                                  titleFontWeight: FontWeight.bold,
                                  titleColour: dark.withOpacity(0.8),
                                ),
                                const SizedBox(
                                  height: 40.0,
                                ),

                                //! STATEMENT
                                CustomTextWidget(
                                  pageTitle:
                                      "You are already at the peak Tutor position. You cannot apply further.",
                                  titleSize: 18,
                                  titleFontWeight: FontWeight.w600,
                                  titleColour: dark.withOpacity(0.9),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            margin: const EdgeInsets.all(10.0),
                            padding: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 20.0),
                            width: _screenSize.width * 0.8,
                            decoration: BoxDecoration(
                                color: active.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20.0)),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  //!INSTRUCTIONS
                                  Container(
                                    margin: const EdgeInsets.all(8.0),
                                    child: CustomTextWidget(
                                      pageTitle: "Basic Requirements",
                                      titleSize: 21,
                                      titleFontWeight: FontWeight.bold,
                                      titleColour: dark.withOpacity(0.8),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(8.0),
                                    child: CustomTextWidget(
                                      pageTitle:
                                          "Select the options that apply to you.    What criteria do you meet?",
                                      titleSize: 16,
                                      titleFontWeight: FontWeight.w600,
                                      titleColour: dark.withOpacity(0.7),
                                    ),
                                  ),

                                  //!CHOICES
                                  Container(
                                      height: _screenSize.height * 0.1,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: lightGrey.withOpacity(0.1),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: _buildCriteriaChoiceList(
                                            itemsToBuild: _criteriaList),
                                      )),

                                  Container(
                                    margin: const EdgeInsets.all(8.0),
                                    child: CustomTextWidget(
                                      pageTitle:
                                          "Rate your Leadership skill on a scale of 1 - 10.",
                                      titleSize: 16,
                                      titleFontWeight: FontWeight.w600,
                                      titleColour: dark.withOpacity(0.7),
                                    ),
                                  ),

                                  Container(
                                      height: _screenSize.height * 0.07,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: lightGrey.withOpacity(0.1),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      alignment: Alignment.center,
                                      child: Form(
                                          key: _formKey,
                                          child: TextFormField(
                                            keyboardType: TextInputType.number,
                                            controller:
                                                _leadershipSkillController,
                                            style: TextStyle(
                                                color: dark,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16.0),
                                            decoration: InputDecoration(
                                              hintText:
                                                  "Leadership skill rating - scale 1 - 10",
                                              contentPadding:
                                                  const EdgeInsets.all(20.0),
                                              hintStyle: TextStyle(
                                                color: dark.withOpacity(0.8),
                                                fontWeight: FontWeight.w500,
                                                fontSize: 21.0,
                                              ),
                                              fillColor: Colors.white,
                                              border: InputBorder.none,
                                            ),
                                            validator: (val) {
                                              if (val!.isEmpty) {
                                                return "Leadership skill rating cannot be empty";
                                              } else {
                                                return null;
                                              }
                                            },
                                          )) /* ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: _buildPositionChoiceList(
                                            itemsToBuild: _jobPositionsList),
                                      ) */
                                      ),

                                  //!COVER LETTER SECTION

                                  //!INSTRUCTION
                                  Container(
                                    margin: const EdgeInsets.all(8.0),
                                    child: CustomTextWidget(
                                      pageTitle:
                                          "Type an optional cover letter.",
                                      titleSize: 16,
                                      titleFontWeight: FontWeight.w600,
                                      titleColour: dark.withOpacity(0.7),
                                    ),
                                  ),

                                  //!COVER LETTER TEXT BOX
                                  Container(
                                    margin: const EdgeInsets.all(8.0),
                                    padding: const EdgeInsets.all(40.0),
                                    height: _screenSize.height * 0.3,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: active.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: TextFormField(
                                      keyboardType: TextInputType.multiline,
                                      controller: _coverLetterController,
                                      maxLines: 15,
                                      maxLength: 10000,
                                      style: TextStyle(
                                          color: dark,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.0),
                                      decoration: InputDecoration(
                                        hintText:
                                            "Type an optional cover letter.",
                                        contentPadding:
                                            const EdgeInsets.all(20.0),
                                        hintStyle: TextStyle(
                                          color: dark.withOpacity(0.8),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 21.0,
                                        ),
                                        fillColor: Colors.white,
                                        border: InputBorder.none,
                                      ),
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "Email cannot be empty";
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ),

                                  //!UPLOAD DOCUMENT
                                  Container(
                                    height: _screenSize.height * 0.1,
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.0),
                                      color: active.withOpacity(0.1),
                                    ),
                                    child: InkWell(
                                      onTap: () async {
                                        await fetchFileAttachment();
                                      },
                                      onHover: (value) {},
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 2.0,
                                            color: lightGrey,
                                            style: BorderStyle.solid,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(
                                              Icons.attach_file_outlined,
                                              size: 32,
                                              color: dark.withOpacity(0.9),
                                            ),
                                            const SizedBox(
                                              width: 20.0,
                                            ),
                                            CustomTextWidget(
                                              pageTitle:
                                                  attachedFileName != null
                                                      ? attachedFileName!
                                                      : "Attach Credentials",
                                              titleSize: 20,
                                              titleFontWeight:
                                                  FontWeight.normal,
                                              titleColour:
                                                  dark.withOpacity(0.9),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                                  //!SUBMIT
                                  Container(
                                    height: _screenSize.height * 0.1,
                                    width: _screenSize.width * 0.15,
                                    padding: const EdgeInsets.all(10.0),
                                    margin: const EdgeInsets.only(top: 12.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(21.0),
                                      color: active.withOpacity(0.1),
                                    ),
                                    child: ElevatedButton(
                                      onPressed: (() async {
                                        String _coverLetter =
                                            _coverLetterController.text;
                                        _coverLetterController.clear();
                                        String _leadershipSkillRating =
                                            _leadershipSkillController.text;
                                        _leadershipSkillController.clear();

                                        if (selectedCriteria.isNotEmpty) {
                                          bool isPromoted =
                                              await SubmittedApplicationsController
                                                  .applicationDecider(
                                                      staffEmail: auth
                                                          .currentUser!.email!,
                                                      staffCoverLetter:
                                                          _coverLetter,
                                                      leadershipSkillRating:
                                                          _leadershipSkillRating,
                                                      theAttachedFile:
                                                          theAttachedFile!);

                                          setState(() {
                                            _isStaffPromoted = isPromoted;
                                          });

                                          Get.snackbar(
                                            "Application Submitted!",
                                            "Your application to be promoted is being reviewed",
                                            snackPosition: SnackPosition.BOTTOM,
                                          );

                                          //! SHOW PROMOTION DETAILS
                                          isPromoted
                                              ? Get.snackbar(
                                                  "Promoted",
                                                  "Your application to be promoted is Successful",
                                                  duration: const Duration(
                                                      seconds: 4),
                                                  snackPosition:
                                                      SnackPosition.BOTTOM,
                                                )
                                              : Get.snackbar(
                                                  "Declined",
                                                  "Your application to be promoted has been Declined",
                                                  duration: const Duration(
                                                      seconds: 4),
                                                  snackPosition:
                                                      SnackPosition.BOTTOM,
                                                );
                                        } else if (selectedCriteria.isEmpty) {
                                          Get.snackbar("Empty Criteria!",
                                              "Select one Criteria you meet",
                                              snackPosition:
                                                  SnackPosition.BOTTOM,
                                              duration:
                                                  const Duration(seconds: 6));
                                        }

                                        selectedCriteria.clear();
                                      }),
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.white),
                                      child: CustomTextWidget(
                                        pageTitle: "Submit Application",
                                        titleSize: 21,
                                        titleFontWeight: FontWeight.w600,
                                        titleColour: active,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ),
      ],
    );
  }

  fetchFileAttachment() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    File? theFile;

    if (result != null) {
      Uint8List? fileBytes = result.files.first.bytes;
      String fileName = result.files.first.name;
      theFile = File.fromRawPath(fileBytes!);

      setState(() {
        attachedFileName = fileName;
        theAttachedFile = theFile;
      });
    }
  }
}
