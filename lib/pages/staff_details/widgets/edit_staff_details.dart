import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouniee/constants/controllers.dart';
import 'package:ouniee/constants/style.dart';
import 'package:ouniee/controllers/staff_data_controller.dart';
import 'package:ouniee/pages/staff_details/widgets/edit_staff_details_bio_data.dart';
import 'package:ouniee/pages/staff_details/widgets/edit_staff_details_lecture_data.dart';
import 'package:ouniee/widgets/custom_text_widget.dart';
import 'package:ouniee/widgets/responsive_widget.dart';

class EditStaffDetailsPage extends StatefulWidget {
  const EditStaffDetailsPage({Key? key}) : super(key: key);

  @override
  State<EditStaffDetailsPage> createState() => _EditStaffDetailsPageState();
}

class _EditStaffDetailsPageState extends State<EditStaffDetailsPage> {
  List<String>? listOfPublications = [];

  @override
  void didChangeDependencies() {
    setState(() {
      listOfPublications =
          StaffDataController.usersData["staffPublication"].split(",");
    });
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
                  padding: const EdgeInsets.all(8.0),
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
                  height: _screenSize.height * 0.43,
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const <Widget>[
                      //!LEFT CONTAINER
                      Expanded(child: EditStaffDetailsBioData()),
                      SizedBox(
                        width: 30.0,
                      ),
                      //!RIGHT CONTAINER
                      Expanded(child: EditStaffDetailsLectureData()),
                    ],
                  ),
                ),

                //!BOTTOM CONTAINER
                Container(
                  height: _screenSize.height * 0.43,
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    //! PUBLICATIONS VIEW
                    Expanded(
                        child: SingleChildScrollView(
                            child: SizedBox(
                      child: listOfPublications!.isEmpty
                          ? CustomTextWidget(
                              pageTitle: "You do not have any publications.",
                              titleColour: dark,
                              titleSize: 16,
                              titleFontWeight: FontWeight.w600)
                          : Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 20.0),
                                decoration: BoxDecoration(
                                  color: active.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                height: _screenSize.height * 0.4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    //!TITLE
                                    CustomTextWidget(
                                      pageTitle: "Publications",
                                      titleSize: 16,
                                      titleFontWeight: FontWeight.bold,
                                      titleColour: dark.withOpacity(0.5),
                                    ),

                                    Expanded(
                                      child: ListView.builder(
                                          itemCount:
                                              listOfPublications!.length == null
                                                  ? 0
                                                  : listOfPublications!.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Card(
                                              color: Colors.white,
                                              child: ListTile(
                                                  contentPadding:
                                                      const EdgeInsets.all(
                                                          12.0),
                                                  title: Text(
                                                    listOfPublications![index],
                                                    style: TextStyle(
                                                        color: active,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 16.0),
                                                  )),
                                            );
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                    ))),

                    //! SPACER
                    const SizedBox(
                      width: 30.0,
                    ),

                    //! ADD PUBLICATION
                    Expanded(
                        child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
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
                            pageTitle: "Add a publication",
                            titleSize: 16,
                            titleFontWeight: FontWeight.bold,
                            titleColour: dark.withOpacity(0.5),
                          ),

                          //! BUTTONS
                          Container(
                              width: _screenSize.width * 0.5,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 3.0, horizontal: 5.0),
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      //!ADD PUBLICATION
                                      ElevatedButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return const AddPublicationDialogueBox();
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
                                                "Add Publication",
                                                style: TextStyle(
                                                    fontSize: 20, color: light),
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
                                                return const RemovePublicationDialogueBox();
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
                                                "Remove Publication",
                                                style: TextStyle(
                                                    fontSize: 20, color: light),
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
                    )),
                  ]),
                ),
              ],
            ))
      ],
    );
  }
}

class AddPublicationDialogueBox extends StatefulWidget {
  const AddPublicationDialogueBox({Key? key}) : super(key: key);

  @override
  State<AddPublicationDialogueBox> createState() =>
      _AddPublicationDialogueBoxState();
}

class _AddPublicationDialogueBoxState extends State<AddPublicationDialogueBox> {
  final _formKey = GlobalKey<FormState>();
  Color callColour = dark.withOpacity(0.8);
  double callSize = 16.0;
  MainAxisAlignment dataAlignment = MainAxisAlignment.spaceEvenly;
  final TextEditingController _publicationName = TextEditingController();

  @override
  void dispose() {
    _publicationName.dispose();
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
                pageTitle: "Add a publication",
                titleColour: dark.withOpacity(0.8),
                titleSize: 21.0,
                titleFontWeight: FontWeight.w600),

            //!CONTENT
            //!COURSE TITLE
            Row(mainAxisAlignment: dataAlignment, children: <Widget>[
              //!CALL
              CustomTextWidget(
                pageTitle: "Publication Title: ",
                titleSize: 16.0,
                titleFontWeight: FontWeight.bold,
                titleColour: callColour,
              ),

              //! RESPONSE
              SizedBox(
                width: _screenSize.width * 0.2,
                child: TextFormField(
                  controller: _publicationName,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  maxLength: 24,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Kindly fill in your Publication Title";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Publication Title",
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
                        String _publicationTitle = _publicationName.text;

                        StaffDataController.addPublication(
                            publicationTitle: _publicationTitle);

                        Navigator.of(context).pop();
                        Get.snackbar("Publication added!",
                            "Your Publication - $_publicationTitle has been added");
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

//! REMOVE PUBLICATION DIALOGUE BOX
class RemovePublicationDialogueBox extends StatefulWidget {
  const RemovePublicationDialogueBox({Key? key}) : super(key: key);

  @override
  State<RemovePublicationDialogueBox> createState() =>
      _RemovePublicationDialogueBox();
}

class _RemovePublicationDialogueBox
    extends State<RemovePublicationDialogueBox> {
  final _formKey = GlobalKey<FormState>();
  Color callColour = dark.withOpacity(0.8);
  double callSize = 16.0;
  MainAxisAlignment dataAlignment = MainAxisAlignment.spaceEvenly;
  final TextEditingController _publicationName = TextEditingController();

  @override
  void dispose() {
    _publicationName.dispose();
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
                pageTitle: "Remove publication",
                titleColour: dark.withOpacity(0.8),
                titleSize: 21.0,
                titleFontWeight: FontWeight.w600),

            //!CONTENT
            //!COURSE TITLE
            Row(mainAxisAlignment: dataAlignment, children: <Widget>[
              //!CALL
              CustomTextWidget(
                pageTitle: "Publication Title: ",
                titleSize: 16.0,
                titleFontWeight: FontWeight.bold,
                titleColour: callColour,
              ),

              //! RESPONSE
              SizedBox(
                width: _screenSize.width * 0.2,
                child: TextFormField(
                  controller: _publicationName,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  maxLength: 24,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Kindly fill in your Publication Title";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Publication Title",
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
                        String _publicationTitle = _publicationName.text;

                        StaffDataController.removePublication(
                            publicationTitle: _publicationTitle);

                        Navigator.of(context).pop();
                        Get.snackbar("Publication added!",
                            "Your Publication - $_publicationTitle has been removed");
                      },
                      child: const Text(
                        "Remove",
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
