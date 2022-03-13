import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouniee/constants/controllers.dart';
import 'package:ouniee/constants/style.dart';
import 'package:ouniee/controllers/staff_level_controller.dart';
import 'package:ouniee/controllers/submitted_application_controller.dart';
import 'package:ouniee/pages/applications/accept_staff_application.dart';
import 'package:ouniee/pages/applications/reject_staff_application.dart';
import 'package:ouniee/widgets/custom_text_widget.dart';
import 'package:ouniee/widgets/responsive_widget.dart';

class SubmittedApplications extends StatefulWidget {
  const SubmittedApplications({Key? key}) : super(key: key);

  @override
  State<SubmittedApplications> createState() => _SubmittedApplicationsState();
}

class _SubmittedApplicationsState extends State<SubmittedApplications> {
  //!SORTING MEMBERS
  //int? _sortColumnIndex;
  bool isAscending = false;
  bool areThereApplicationsSubmitted = false;
  final double tableDataFontSize = 18.0;

  //!TABLE MEMBERS
  final List<String> _tableTitles = StaffLevelController.tableTitles;

  @override
  void didChangeDependencies() async {
    await SubmittedApplicationsController.areThereApplicationsSubmitted() ==
            true
        ? setState(() => areThereApplicationsSubmitted = true)
        : setState((() => areThereApplicationsSubmitted = false));

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      child: Column(
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

          //!THE BODY
          Expanded(
              child: Container(
            width: _screenSize.width * 0.8,
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
                color: active.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20.0)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //!TITLE
                  SizedBox(
                    height: _screenSize.height * 0.05,
                    child: CustomTextWidget(
                        pageTitle: "Applications submitted by academic staffs.",
                        titleColour: lightGrey,
                        titleSize: 21.0,
                        titleFontWeight: FontWeight.w600),
                  ),

                  //!TABLE
                  SizedBox(
                    width: _screenSize.width * 0.8,
                    height: _screenSize.height * 0.8,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: areThereApplicationsSubmitted == false
                          ? Container(
                              margin: EdgeInsets.only(
                                  left: _screenSize.width * 0.35),
                              alignment: Alignment.center,
                              child: CustomTextWidget(
                                  pageTitle: "No Promotion Applications!",
                                  titleColour: dark.withOpacity(0.8),
                                  titleSize: 21.0,
                                  titleFontWeight: FontWeight.w600),
                            )
                          : DataTable(
                              columnSpacing: 32.0,
                              horizontalMargin: 0.0,
                              sortColumnIndex: 0,
                              sortAscending: true,
                              dividerThickness: 1.5,
                              dataRowHeight:
                                  MediaQuery.of(context).size.height * 0.08,
                              columns: _getColumns(columnTitle: _tableTitles),
                              rows: _buildTableData(
                                itemsToBuild:
                                    SubmittedApplicationsController.usersData,
                              ),
                            ),
                    ),
                  ),
                ]),
          ))
        ],
      ),
    );
  }

  //! BUILD ROW
  _buildTableData({
    required List<Map<String, dynamic>>? itemsToBuild,
  }) {
    List<DataRow> dataCells = [];
    for (int index = 0; index < itemsToBuild!.length; index++) {
      dataCells.add(
        DataRow(
          cells: <DataCell>[
            DataCell(CustomTextWidget(
                pageTitle: itemsToBuild[index]["staffFullName"],
                titleColour: dark,
                titleSize: tableDataFontSize,
                titleFontWeight: FontWeight.normal)),
            DataCell(CustomTextWidget(
                pageTitle: itemsToBuild[index]["staffId"],
                titleColour: dark,
                titleSize: tableDataFontSize,
                titleFontWeight: FontWeight.normal)),
            DataCell(Row(
              children: [
                Expanded(
                  child: CustomTextWidget(
                      pageTitle: itemsToBuild[index]["staffEmail"],
                      titleColour: dark,
                      titleSize: tableDataFontSize,
                      titleFontWeight: FontWeight.normal),
                ),
              ],
            )),
            DataCell(CustomTextWidget(
                pageTitle: itemsToBuild[index]["staffAssignedDepartment"],
                titleColour: dark,
                titleSize: tableDataFontSize,
                titleFontWeight: FontWeight.normal)),
            DataCell(CustomTextWidget(
                pageTitle: itemsToBuild[index]["staffQualification"],
                titleColour: dark,
                titleSize: tableDataFontSize,
                titleFontWeight: FontWeight.normal)),
            DataCell(CustomTextWidget(
                pageTitle: itemsToBuild[index]["staffExperience"],
                titleColour: dark,
                titleSize: tableDataFontSize,
                titleFontWeight: FontWeight.normal)),
            DataCell(CustomTextWidget(
                pageTitle: itemsToBuild[index]["staffPublication"],
                titleColour: dark,
                titleSize: tableDataFontSize,
                titleFontWeight: FontWeight.normal)),
            DataCell(CustomTextWidget(
                pageTitle: itemsToBuild[index]["positionAppliedFor"],
                titleColour: dark,
                titleSize: tableDataFontSize,
                titleFontWeight: FontWeight.normal)),
            DataCell(CustomTextWidget(
                pageTitle: itemsToBuild[index]["coverLetter"],
                titleColour: dark,
                titleSize: tableDataFontSize,
                titleFontWeight: FontWeight.normal)),
            DataCell(CustomTextWidget(
                pageTitle: itemsToBuild[index]["criteriaMet"],
                titleColour: dark,
                titleSize: tableDataFontSize,
                titleFontWeight: FontWeight.normal)),
            DataCell(CustomTextWidget(
                pageTitle: itemsToBuild[index]["attachedDocumentURL"],
                titleColour: dark,
                titleSize: tableDataFontSize,
                titleFontWeight: FontWeight.normal)),
            DataCell(
              Container(
                width: MediaQuery.of(context).size.width * 0.15,
                height: MediaQuery.of(context).size.height * 0.8,
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    //! ACCEPT
                    ElevatedButton(
                        onPressed: (() {
                          //!APPROVE APPLICATION AND PROMOTE STAFF
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AcceptStaffApplicationDialogue(
                                    theStaffEmail: itemsToBuild[index]
                                        ["staffEmail"]);
                              });
                        }),
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(21.0),
                            primary: active),
                        child: const CustomTextWidget(
                          pageTitle: "Approve",
                          titleColour: Colors.white,
                          titleFontWeight: FontWeight.w600,
                          titleSize: 21.0,
                        )),

                    //! DECLINE
                    ElevatedButton(
                        onPressed: (() {
                          //! DECLINE PROMOTION APPLICATION
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return RejectStaffApplicationDialogue(
                                    theStaffEmail: itemsToBuild[index]
                                        ["staffEmail"]);
                              });
                        }),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(21.0),
                          primary: Colors.red.shade900,
                        ),
                        child: const CustomTextWidget(
                          pageTitle: "Decline",
                          titleColour: Colors.white,
                          titleFontWeight: FontWeight.w600,
                          titleSize: 21.0,
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
    return dataCells;
  }

  List<DataColumn> _getColumns({required List<String> columnTitle}) =>
      columnTitle
          .map((_theColumn) => DataColumn(
              onSort: (int columnIndex, bool ascending) {
                if (isAscending) {
                  SubmittedApplicationsController.usersData.sort((item1,
                          item2) =>
                      item1["staffFullName"].compareTo(item2["staffFullName"]));
                } else {
                  SubmittedApplicationsController.usersData.sort((item1,
                          item2) =>
                      item2["staffFullName"].compareTo(item1["staffFullName"]));
                }

                setState(() {
                  //_sortColumnIndex = columnIndex;
                  isAscending = ascending;
                });
              },
              label: CustomTextWidget(
                pageTitle: _theColumn,
                titleColour: dark,
                titleFontWeight: FontWeight.w600,
                titleSize: 21.0,
              )))
          .toList();
/* 
  List<DataRow> _getRows({required List<dynamic> dataToBeDisplayed}) =>
      dataToBeDisplayed.map((_theData) {
        return DataRow(cells: _getCells(theCellsData: dataToBeDisplayed));
      }).toList();

  List<DataCell> _getCells({required List<dynamic> theCellsData}) =>
      theCellsData
          .map((_theData) => DataCell(
                CustomTextWidget(
                    pageTitle: _theData.toString(),
                    titleColour: dark,
                    titleSize: tableDataFontSize,
                    titleFontWeight: FontWeight.normal),
              ))
          .toList(); */
}
