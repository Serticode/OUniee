import 'package:flutter/material.dart';
import 'package:ouniee/constants/style.dart';
import 'package:ouniee/controllers/staff_data_controller.dart';
import 'package:ouniee/widgets/custom_text_widget.dart';

class EditStaffDetailsBioData extends StatefulWidget {
  const EditStaffDetailsBioData({Key? key}) : super(key: key);

  @override
  State<EditStaffDetailsBioData> createState() =>
      _EditStaffDetailsBioDataState();
}

class _EditStaffDetailsBioDataState extends State<EditStaffDetailsBioData> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _staffNameController = TextEditingController();
  final TextEditingController _staffIdController = TextEditingController();
  final TextEditingController _staffDepartmentController =
      TextEditingController();
  final TextEditingController _staffEmailController = TextEditingController();
  final TextEditingController _staffContactController = TextEditingController();
  final TextEditingController _staffAddressController = TextEditingController();

  @override
  void dispose() {
    _staffAddressController.dispose();
    _staffIdController.dispose();
    _staffDepartmentController.dispose();
    _staffEmailController.dispose();
    _staffContactController.dispose();
    _staffNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double callSize = 16.0;
    Color callColour = dark.withOpacity(0.8);
    Size _screenSize = MediaQuery.of(context).size;

    MainAxisAlignment dataAlignment = MainAxisAlignment.spaceBetween;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      decoration: BoxDecoration(
        color: active.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //!TITLE
            CustomTextWidget(
              pageTitle: "Edit Staff Bio Data",
              titleSize: 21,
              titleFontWeight: FontWeight.bold,
              titleColour: dark.withOpacity(0.5),
            ),

            //!OTHER STAFF DETAILS
            // ! STAFF FULL NAME
            Row(mainAxisAlignment: dataAlignment, children: <Widget>[
              //!CALL
              CustomTextWidget(
                pageTitle: "Full Name: ",
                titleSize: callSize,
                titleFontWeight: FontWeight.bold,
                titleColour: callColour,
              ),

              //! RESPONSE
              SizedBox(
                width: MediaQuery.of(context).size.width / 6,
                child: TextFormField(
                  controller: _staffNameController,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  maxLength: 120,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Do fill in your name";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Your full name",
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

            //! STAFF ID
            Row(mainAxisAlignment: dataAlignment, children: <Widget>[
              //!CALL
              CustomTextWidget(
                pageTitle: "Staff ID: ",
                titleSize: callSize,
                titleFontWeight: FontWeight.bold,
                titleColour: callColour,
              ),

              //! RESPONSE
              SizedBox(
                width: MediaQuery.of(context).size.width / 6,
                child: TextFormField(
                  controller: _staffIdController,
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
                      hintText: "Staff ID",
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

            // ! STAFF DEPARTMENT
            Row(mainAxisAlignment: dataAlignment, children: <Widget>[
              //!CALL
              CustomTextWidget(
                pageTitle: "School & Department: ",
                titleSize: callSize,
                titleFontWeight: FontWeight.bold,
                titleColour: callColour,
              ),

              //! RESPONSE
              SizedBox(
                width: MediaQuery.of(context).size.width / 6,
                child: TextFormField(
                  controller: _staffDepartmentController,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  maxLength: 120,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Department ?";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Department",
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

            // ! STAFF MAIL
            Row(mainAxisAlignment: dataAlignment, children: <Widget>[
              //!CALL
              CustomTextWidget(
                pageTitle: "E-Mail: ",
                titleSize: callSize,
                titleFontWeight: FontWeight.bold,
                titleColour: callColour,
              ),

              //! RESPONSE
              SizedBox(
                width: MediaQuery.of(context).size.width / 6,
                child: TextFormField(
                  controller: _staffEmailController,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  maxLength: 120,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.contains("@")) {
                      return "Confirm your mail address please !";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Email",
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

            // ! STAFF CONTACT
            Row(mainAxisAlignment: dataAlignment, children: <Widget>[
              //!CALL
              CustomTextWidget(
                pageTitle: "Contact: ",
                titleSize: callSize,
                titleFontWeight: FontWeight.bold,
                titleColour: callColour,
              ),

              //! RESPONSE
              SizedBox(
                width: MediaQuery.of(context).size.width / 6,
                child: TextFormField(
                  controller: _staffContactController,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  maxLength: 120,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "How do we contact you please?";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Contact",
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

            // ! STAFF HOME ADDRESS.
            Row(mainAxisAlignment: dataAlignment, children: <Widget>[
              //!CALL
              CustomTextWidget(
                pageTitle: "Address: ",
                titleSize: callSize,
                titleFontWeight: FontWeight.bold,
                titleColour: callColour,
              ),

              //! RESPONSE
              SizedBox(
                width: MediaQuery.of(context).size.width / 6,
                child: TextFormField(
                  controller: _staffAddressController,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  maxLength: 120,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Address?";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Residential address",
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

            Container(
                height: 60.0,
                width: _screenSize.width * 0.2,
                padding:
                    const EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
                child: Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );

                          String _fullName = _staffNameController.text;
                          String _email = _staffEmailController.text;
                          String _address = _staffAddressController.text;
                          String _department = _staffDepartmentController.text;
                          String _contact = _staffContactController.text;
                          String _id = _staffIdController.text;

                          StaffDataController.updateStaffBiodataDetails(
                              fullName: _fullName,
                              staffID: _id,
                              staffEmail: _email,
                              staffContact: _contact,
                              staffAddress: _address,
                              staffDepartment: _department);

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('User Data Updated')),
                          );
                        }
                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(
                              Icons.save_outlined,
                              color: light,
                            ),
                            Text(
                              "Save Changes",
                              style: TextStyle(fontSize: 20, color: light),
                            ),
                          ]),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(20.0),
                        primary: active,
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}
