import 'package:flutter/material.dart';
import 'package:ouniee/constants/style.dart';
import 'package:ouniee/controllers/staff_data_controller.dart';
import 'package:ouniee/widgets/custom_text_widget.dart';

class StaffLectureData extends StatefulWidget {
  const StaffLectureData({Key? key}) : super(key: key);

  @override
  State<StaffLectureData> createState() => _StaffLectureDataState();
}

class _StaffLectureDataState extends State<StaffLectureData> {
  final bool _isAdmin = StaffDataController.usersData["isAdmin"];

  List<dynamic>? _coursesStaffTeach = [];
  @override
  void didChangeDependencies() {
    /* List? /* <Map<String, dynamic>> */ theCourses =
        StaffDataController.usersData["coursesStaffTeach"];
    StaffDataController.usersData["coursesStaffTeach"];
     */
    setState(() {
      _coursesStaffTeach = StaffDataController.usersData["coursesStaffTeach"];
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Color callColour = dark.withOpacity(0.8);
    double responseSize = 21.0;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
      decoration: BoxDecoration(
        color: active.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //!TITLE
          CustomTextWidget(
            pageTitle: "Courses Taught",
            titleSize: 21,
            titleFontWeight: FontWeight.bold,
            titleColour: dark.withOpacity(0.5),
          ),

          //! STAFF COURSES

          //! RESPONSE
          Expanded(
            child: _isAdmin
                ? Container(
                    margin: const EdgeInsets.all(10.0),
                    padding: const EdgeInsets.all(21.0),
                    child: Center(
                      child: CustomTextWidget(
                        pageTitle: "Professors do not take courses",
                        titleSize: 21,
                        titleFontWeight: FontWeight.w600,
                        titleColour: callColour,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: (_coursesStaffTeach == null ||
                            _coursesStaffTeach!.isEmpty)
                        ? 1
                        : _coursesStaffTeach?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.all(10.0),
                        margin: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: (_coursesStaffTeach == null ||
                                _coursesStaffTeach!.isEmpty)
                            ? Container(
                                margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.2),
                                alignment: Alignment.center,
                                child: Center(
                                  child: CustomTextWidget(
                                    pageTitle: "Not Handling Any Course",
                                    titleSize: 18.0,
                                    titleFontWeight: FontWeight.w600,
                                    titleColour: callColour,
                                  ),
                                ),
                              )
                            : Card(
                                elevation: 5.0,
                                margin: const EdgeInsets.all(6.0),
                                child: ListTile(
                                  contentPadding: const EdgeInsets.all(20.0),
                                  isThreeLine: true,
                                  //! TITLE
                                  title: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    child: CustomTextWidget(
                                      pageTitle: _coursesStaffTeach![index]
                                          ["courseTitle"],
                                      titleSize: responseSize,
                                      titleFontWeight: FontWeight.w600,
                                      titleColour: active,
                                    ),
                                  ),

                                  //! SUBTITLE
                                  subtitle: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          //! COURSE DESCRIPTION
                                          CustomTextWidget(
                                            pageTitle:
                                                _coursesStaffTeach![index]
                                                        ["courseDescription"] +
                                                    " Units",
                                            titleSize: 18,
                                            titleFontWeight: FontWeight.w600,
                                            titleColour: dark.withOpacity(0.6),
                                          ),

                                          //! COURSE UNITS
                                          CustomTextWidget(
                                            pageTitle:
                                                _coursesStaffTeach![index]
                                                        ["courseUnits"] +
                                                    " Units",
                                            titleSize: 16,
                                            titleFontWeight: FontWeight.w600,
                                            titleColour: dark.withOpacity(0.6),
                                          ),
                                        ]),
                                  ),

                                  //! COURSE CODE
                                  trailing: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: CustomTextWidget(
                                      pageTitle: _coursesStaffTeach![index]
                                          ["courseCode"],
                                      titleSize: 18,
                                      titleFontWeight: FontWeight.w600,
                                      titleColour: active,
                                    ),
                                  ),
                                ),
                              ),
                      );
                    }),
          ),
        ],
      ),
    );
  }
}
