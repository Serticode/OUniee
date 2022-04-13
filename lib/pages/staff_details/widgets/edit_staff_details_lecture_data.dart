import 'package:flutter/material.dart';
import 'package:ouniee/constants/style.dart';
import 'package:ouniee/controllers/staff_data_controller.dart';
import 'package:ouniee/widgets/custom_text_widget.dart';

class EditStaffDetailsLectureData extends StatefulWidget {
  const EditStaffDetailsLectureData({Key? key}) : super(key: key);

  @override
  State<EditStaffDetailsLectureData> createState() =>
      _EditStaffDetailsLectureDataState();
}

class _EditStaffDetailsLectureDataState
    extends State<EditStaffDetailsLectureData> {
  Color callColour = dark.withOpacity(0.8);
  double responseSize = 16.0;
  final bool _isAdmin = StaffDataController.usersData["isAdmin"];

  List<dynamic>? _coursesStaffTeach = [];
  @override
  void didChangeDependencies() {
    setState(() {
      _coursesStaffTeach = StaffDataController.usersData["coursesStaffTeach"];
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
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
            pageTitle: "Edit Courses Taught",
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
                    padding: const EdgeInsets.all(12.0),
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
                                        0.05),
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
                                margin: const EdgeInsets.all(12.0),
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

          Container(
              height: 60.0,
              width: _screenSize.width * 0.5,
              padding:
                  const EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
              child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _isAdmin
                        ? <Widget>[
                            //!ADMINS DO NOT TAKE COURSES, THERE FORE, THEY CANNOT ADD A COURSE
                          ]
                        : <Widget>[
                            //!ADD COURSE
                            ElevatedButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const AddLectureDataDialogueBox();
                                    });
                              },
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Icon(
                                      Icons.add_outlined,
                                      size: 24,
                                      color: light,
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      "Add a course",
                                      style:
                                          TextStyle(fontSize: 20, color: light),
                                    ),
                                  ]),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(20.0),
                                primary: active,
                              ),
                            ),

                            //!REMOVE COURSE
                            ElevatedButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const DeleteLectureDataDialogueBox();
                                    });
                              },
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Icon(
                                      Icons.delete_outline,
                                      size: 24,
                                      color: light,
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      "Remove Course",
                                      style:
                                          TextStyle(fontSize: 20, color: light),
                                    ),
                                  ]),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(20.0),
                                primary: active,
                              ),
                            ),
                          ],
                  ))),
        ],
      ),
    );
  }
}

class AddLectureDataDialogueBox extends StatefulWidget {
  const AddLectureDataDialogueBox({Key? key}) : super(key: key);

  @override
  _AddLectureDataDialogueBoxState createState() =>
      _AddLectureDataDialogueBoxState();
}

class _AddLectureDataDialogueBoxState extends State<AddLectureDataDialogueBox> {
  final _formKey = GlobalKey<FormState>();
  Color callColour = dark.withOpacity(0.8);
  double callSize = 16.0;
  MainAxisAlignment dataAlignment = MainAxisAlignment.spaceEvenly;
  final TextEditingController _courseTitleController = TextEditingController();
  final TextEditingController _courseCodeController = TextEditingController();
  final TextEditingController _courseDescriptionController =
      TextEditingController();
  final TextEditingController _courseUnitController = TextEditingController();

  @override
  void dispose() {
    _courseCodeController.dispose();
    _courseDescriptionController.dispose();
    _courseTitleController.dispose();
    _courseUnitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 10,
      backgroundColor: Colors.transparent,
      child: theBox(theBuildContext: context),
    );
  }

  theBox({required theBuildContext}) {
    Size _screenSize = MediaQuery.of(context).size;

    return Container(
      height: _screenSize.height * 0.5,
      width: _screenSize.width * 0.4,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: light,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //!TITLE
            CustomTextWidget(
                pageTitle: "Add a course",
                titleColour: dark.withOpacity(0.8),
                titleSize: 21.0,
                titleFontWeight: FontWeight.w600),

            //!CONTENT
            //!COURSE TITLE
            Row(mainAxisAlignment: dataAlignment, children: <Widget>[
              //!CALL
              CustomTextWidget(
                pageTitle: "Course Title: ",
                titleSize: 16.0,
                titleFontWeight: FontWeight.bold,
                titleColour: callColour,
              ),

              //! RESPONSE
              SizedBox(
                width: _screenSize.width * 0.2,
                child: TextFormField(
                  controller: _courseTitleController,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  maxLength: 24,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Kindly fill in your Course Title";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Course Title",
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 2.0, color: dark)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 2.0, color: active)),
                      errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              width: 2.0, color: Colors.red.shade900))),
                ),
              ),
            ]),

            //!COURSE CODE
            Row(mainAxisAlignment: dataAlignment, children: <Widget>[
              //!CALL
              CustomTextWidget(
                pageTitle: "Course Code: ",
                titleSize: 16.0,
                titleFontWeight: FontWeight.bold,
                titleColour: callColour,
              ),

              //! RESPONSE
              SizedBox(
                width: _screenSize.width * 0.2,
                child: TextFormField(
                  controller: _courseCodeController,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  maxLength: 24,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Kindly fill in the course code";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Course code",
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 2.0, color: dark)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 2.0, color: active)),
                      errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              width: 2.0, color: Colors.red.shade900))),
                ),
              ),
            ]),

            //!COURSE UNITS
            Row(mainAxisAlignment: dataAlignment, children: <Widget>[
              //!CALL
              CustomTextWidget(
                pageTitle: "Course Unit: ",
                titleSize: 16.0,
                titleFontWeight: FontWeight.bold,
                titleColour: callColour,
              ),

              //! RESPONSE
              SizedBox(
                width: _screenSize.width * 0.2,
                child: TextFormField(
                  controller: _courseUnitController,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  maxLength: 24,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Kindly fill the course unit load";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Course Units",
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 2.0, color: dark)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 2.0, color: active)),
                      errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              width: 2.0, color: Colors.red.shade900))),
                ),
              ),
            ]),

            //!COURSE DESCRIPTION
            Row(mainAxisAlignment: dataAlignment, children: <Widget>[
              //!CALL
              CustomTextWidget(
                pageTitle: "Course Description: ",
                titleSize: 16.0,
                titleFontWeight: FontWeight.bold,
                titleColour: callColour,
              ),

              //! RESPONSE
              SizedBox(
                width: _screenSize.width * 0.2,
                child: TextFormField(
                  controller: _courseDescriptionController,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  maxLength: 45,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Kindly fill in your Course Description";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Course Description",
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 2.0, color: dark)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 2.0, color: active)),
                      errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              width: 2.0, color: Colors.red.shade900))),
                ),
              ),
            ]),

            //!BUTTONS
            SizedBox(
              width: _screenSize.width * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //!CANCEL
                  SizedBox(
                    width: _screenSize.width * 0.13,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(fontSize: 16, color: dark),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(20.0),
                        primary: light,
                      ),
                    ),
                  ),

                  //!SAVE
                  SizedBox(
                    width: _screenSize.width * 0.13,
                    child: ElevatedButton(
                      onPressed: () {
                        String _courseCode = _courseCodeController.text;
                        String _courseTitle = _courseTitleController.text;
                        String _courseUnits = _courseUnitController.text;
                        String _courseDescription =
                            _courseDescriptionController.text;

                        StaffDataController.addCourseToCourseList(
                            courseTitle: _courseTitle,
                            courseUnits: _courseUnits,
                            courseDescription: _courseDescription,
                            courseCode: _courseCode);

                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "Save",
                        style: TextStyle(fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(20.0),
                        primary: active,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DeleteLectureDataDialogueBox extends StatefulWidget {
  const DeleteLectureDataDialogueBox({Key? key}) : super(key: key);

  @override
  State<DeleteLectureDataDialogueBox> createState() =>
      _DeleteLectureDataDialogueBoxState();
}

class _DeleteLectureDataDialogueBoxState
    extends State<DeleteLectureDataDialogueBox> {
  final _formKey = GlobalKey<FormState>();
  Color callColour = dark.withOpacity(0.8);
  double callSize = 16.0;
  MainAxisAlignment dataAlignment = MainAxisAlignment.spaceEvenly;
  final TextEditingController _courseTitleController = TextEditingController();

  @override
  void dispose() {
    _courseTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 10,
      backgroundColor: Colors.transparent,
      child: theBox(theBuildContext: context),
    );
  }

  theBox({required theBuildContext}) {
    Size _screenSize = MediaQuery.of(context).size;

    return Container(
      height: _screenSize.height * 0.5,
      width: _screenSize.width * 0.4,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: light,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //!TITLE
            CustomTextWidget(
                pageTitle: "Stopped taking a course? Remove it!",
                titleColour: dark.withOpacity(0.8),
                titleSize: 21.0,
                titleFontWeight: FontWeight.w600),

            //!CONTENT
            //!COURSE TITLE
            Row(mainAxisAlignment: dataAlignment, children: <Widget>[
              //!CALL
              CustomTextWidget(
                pageTitle: "Course Title: ",
                titleSize: 16.0,
                titleFontWeight: FontWeight.bold,
                titleColour: callColour,
              ),

              //! RESPONSE
              SizedBox(
                width: _screenSize.width * 0.2,
                child: TextFormField(
                  controller: _courseTitleController,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  maxLength: 24,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Kindly fill in your Course Title";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Course Title",
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 2.0, color: dark)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 2.0, color: active)),
                      errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              width: 2.0, color: Colors.red.shade900))),
                ),
              ),
            ]),

            //!BUTTONS
            SizedBox(
              width: _screenSize.width * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //!CANCEL
                  SizedBox(
                    width: _screenSize.width * 0.13,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(fontSize: 16, color: dark),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(20.0),
                        primary: light,
                      ),
                    ),
                  ),

                  //!DELETE COURSE
                  SizedBox(
                    width: _screenSize.width * 0.13,
                    child: ElevatedButton(
                      onPressed: () {
                        String _courseTitle = _courseTitleController.text;

                        StaffDataController.removeCourseFromCourseList(
                          courseTitle: _courseTitle,
                        );

                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "Remove Course",
                        style: TextStyle(fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(20.0),
                        primary: active,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
