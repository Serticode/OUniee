import 'package:flutter/material.dart';
import 'package:ouniee/constants/style.dart';
import 'package:ouniee/widgets/custom_text_widget.dart';

class EditStaffDetailsLectureData extends StatefulWidget {
  const EditStaffDetailsLectureData({Key? key}) : super(key: key);

  @override
  State<EditStaffDetailsLectureData> createState() =>
      _EditStaffDetailsLectureDataState();
}

class _EditStaffDetailsLectureDataState
    extends State<EditStaffDetailsLectureData> {
  @override
  Widget build(BuildContext context) {
    Color callColour = dark.withOpacity(0.8);
    double responseSize = 24.0;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
      decoration: BoxDecoration(
        color: Colors.teal.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //!TITLE
          CustomTextWidget(
            pageTitle: "Edit Courses Taught",
            titleSize: 26,
            titleFontWeight: FontWeight.bold,
            titleColour: dark.withOpacity(0.5),
          ),

          const SizedBox(
            height: 20.0,
          ),

          //! STAFF COURSES

          //! RESPONSE
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (_, __) {
                  return Container(
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: CustomTextWidget(
                      pageTitle: "Course $__",
                      titleSize: responseSize,
                      titleFontWeight: FontWeight.normal,
                      titleColour: callColour,
                    ),
                  );
                }),
          ),

          Container(
              height: 60.0,
              width: MediaQuery.of(context).size.width / 4,
              padding:
                  const EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
              child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      //!ADD COURSE
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const EditLectureDataDialogueBox();
                              });
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                style: TextStyle(fontSize: 20, color: light),
                              ),
                            ]),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(20.0),
                          primary: active,
                        ),
                      ),

                      //!REMOVE COURSE
                      ElevatedButton(
                        onPressed: () {},
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                style: TextStyle(fontSize: 20, color: light),
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

class EditLectureDataDialogueBox extends StatefulWidget {
  const EditLectureDataDialogueBox({Key? key}) : super(key: key);

  @override
  _EditLectureDataDialogueBoxState createState() =>
      _EditLectureDataDialogueBoxState();
}

class _EditLectureDataDialogueBoxState
    extends State<EditLectureDataDialogueBox> {
  final _formKey = GlobalKey<FormState>();
  Color callColour = dark.withOpacity(0.8);
  double callSize = 22.0;
  MainAxisAlignment dataAlignment = MainAxisAlignment.spaceEvenly;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: theBox(theBuildContext: context),
    );
  }

  theBox({required theBuildContext}) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.5,
      width: MediaQuery.of(context).size.width / 3,
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
                titleSize: 24.0,
                titleFontWeight: FontWeight.w600),

            //!CONTENT
            //!COURSE TITLE
            Row(mainAxisAlignment: dataAlignment, children: <Widget>[
              //!CALL
              CustomTextWidget(
                pageTitle: "Course Title: ",
                titleSize: 18.0,
                titleFontWeight: FontWeight.bold,
                titleColour: callColour,
              ),

              //! RESPONSE
              SizedBox(
                width: MediaQuery.of(context).size.width / 6,
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  maxLength: 24,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Kindly fill in your Staff ID";
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
                titleSize: 18.0,
                titleFontWeight: FontWeight.bold,
                titleColour: callColour,
              ),

              //! RESPONSE
              SizedBox(
                width: MediaQuery.of(context).size.width / 6,
                child: TextFormField(
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
                titleSize: 18.0,
                titleFontWeight: FontWeight.bold,
                titleColour: callColour,
              ),

              //! RESPONSE
              SizedBox(
                width: MediaQuery.of(context).size.width / 6,
                child: TextFormField(
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

            //!BUTTONS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //!CANCEL
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(fontSize: 18, color: dark),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20.0),
                    primary: light,
                  ),
                ),

                //!SAVE
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20.0),
                    primary: active,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
