import 'package:flutter/material.dart';
import 'package:ouniee/constants/style.dart';
import 'package:ouniee/controllers/submitted_application_controller.dart';
import 'package:ouniee/widgets/custom_text_widget.dart';

class AcceptStaffApplicationDialogue extends StatefulWidget {
  final String theStaffEmail;
  const AcceptStaffApplicationDialogue({Key? key, required this.theStaffEmail})
      : super(key: key);

  @override
  State<AcceptStaffApplicationDialogue> createState() =>
      _AcceptStaffApplicationDialogueState();
}

class _AcceptStaffApplicationDialogueState
    extends State<AcceptStaffApplicationDialogue> {
  Color callColour = dark.withOpacity(0.8);
  double callSize = 16.0;
  MainAxisAlignment dataAlignment = MainAxisAlignment.spaceEvenly;

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
      width: _screenSize.width * 0.3,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: light,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          //!TITLE
          CustomTextWidget(
              pageTitle: "Accept Staff Application?",
              titleColour: dark.withOpacity(0.8),
              titleSize: 21.0,
              titleFontWeight: FontWeight.w600),

          //! BUTTONS
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

                //! REJECT APPLICATION
                SizedBox(
                  width: _screenSize.width * 0.13,
                  child: ElevatedButton(
                    onPressed: () {
                      SubmittedApplicationsController.applicationApproved(
                          staffEmail: widget.theStaffEmail);
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Promote Staff",
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
    );
  }
}
