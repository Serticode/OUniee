import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouniee/constants/controllers.dart';
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
  List<String> selectedPosition = [];
  List<String> selectedCriteria = [];
  final List<String> _criteriaList = StaffLevelController.availableCriteria(
      theCurrentStaffLevel: StaffDataController.usersData["currentStaffLevel"]);

  final List<String> _jobPositionsList =
      StaffLevelController.availablePositionDecider(
          theCurrentStaffLevel:
              StaffDataController.usersData["currentStaffLevel"]);

  bool _didStaffApply = false;

  @override
  void didChangeDependencies() async {
    await SubmittedApplicationsController.didStaffApply() == true
        ? setState(() => _didStaffApply = true)
        : setState(() => _didStaffApply = false);
    super.didChangeDependencies();
  }

  //! this function will build and return the choice list
  _buildPositionChoiceList({required List<String>? itemsToBuild}) {
    List<Widget> choices = [];
    for (var item in itemsToBuild!) {
      choices.add(
        ChoiceChip(
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
          selected: selectedPosition.contains(item),
          onSelected: (selected) {
            setState(() {
              selectedPosition.contains(item)
                  ? selectedPosition.remove(item)
                  : selectedPosition.add(item);
            });
          },
        ),
      );
    }
    return choices;
  }

  _buildCriteriaChoiceList({required List<String>? itemsToBuild}) {
    List<Widget> choices = [];
    for (var item in itemsToBuild!) {
      choices.add(
        ChoiceChip(
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
        _didStaffApply
            ? Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: _screenSize.width * 0.1),
                  child: Center(
                    child: CustomTextWidget(
                      pageTitle: "Your Application is being REVIEWED!",
                      titleSize: 21,
                      titleFontWeight: FontWeight.bold,
                      titleColour: dark.withOpacity(0.8),
                    ),
                  ),
                ),
              )
            : Expanded(
                child: Container(
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: _buildCriteriaChoiceList(
                                itemsToBuild: _criteriaList),
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.all(8.0),
                          child: CustomTextWidget(
                            pageTitle: "What position are you applying for? ",
                            titleSize: 16,
                            titleFontWeight: FontWeight.w600,
                            titleColour: dark.withOpacity(0.7),
                          ),
                        ),

                        Container(
                          height: _screenSize.height * 0.1,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: lightGrey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: _buildPositionChoiceList(
                                itemsToBuild: _jobPositionsList),
                          ),
                        ),

                        //!COVER LETTER SECTION

                        //!INSTRUCTION
                        Container(
                          margin: const EdgeInsets.all(8.0),
                          child: CustomTextWidget(
                            pageTitle: "Type an optional cover letter.",
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
                            maxLines: 15,
                            maxLength: 10000,
                            style: TextStyle(
                                color: dark,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0),
                            decoration: InputDecoration(
                              hintText: "Type an optional cover letter.",
                              contentPadding: const EdgeInsets.all(20.0),
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
                            onTap: () {
                              fetchFileAttachment();
                            },
                            onHover: (value) {},
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2.0,
                                  color: lightGrey,
                                  style: BorderStyle.solid,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                    pageTitle: "Attach Credentials",
                                    titleSize: 20,
                                    titleFontWeight: FontWeight.normal,
                                    titleColour: dark.withOpacity(0.9),
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
                            onPressed: (() {
                              if (selectedCriteria.isNotEmpty &&
                                  selectedPosition.isNotEmpty) {
                                SubmittedApplicationsController
                                    .submitStaffApplication(
                                        theCriteriaMet: selectedCriteria.first,
                                        thePositionAppliedFor:
                                            selectedPosition.first);

                                Get.snackbar(
                                  "Application Submitted!",
                                  "Your application to be promoted is being reviewed",
                                  snackPosition: SnackPosition.BOTTOM,
                                );
                              } else if (selectedCriteria.isEmpty ||
                                  selectedPosition.isEmpty) {
                                Get.snackbar("Criteria and Position!",
                                    "Select one Criteria you meet and the Position you are applying for",
                                    snackPosition: SnackPosition.BOTTOM,
                                    duration: const Duration(seconds: 6));
                              }

                              setState(() {
                                _didStaffApply = true;
                              });

                              selectedCriteria.clear();
                              selectedPosition.clear();
                            }),
                            style:
                                ElevatedButton.styleFrom(primary: Colors.white),
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
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: true,
      allowedExtensions: [
        'docx',
        'pdf',
        'doc',
        'txt',
      ],
    );

    if (result != null) {
      List<File> files = [];
      for (var item in result.files) {
        Uint8List? fileBytes = item.bytes; //result.files.first.bytes;

        files.add(File.fromRawPath(fileBytes!));
      }

      //= result.paths.map((path) => File(path!)).toList();
      debugPrint("THE FILES INCLUDE \n\n $files");
    } else {
      // User canceled the picker
    }
  }
}
