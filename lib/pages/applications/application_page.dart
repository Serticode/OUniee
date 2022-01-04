import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouniee/constants/controllers.dart';
import 'package:ouniee/constants/style.dart';
import 'package:ouniee/widgets/custom_text_widget.dart';
import 'package:ouniee/widgets/responsive_widget.dart';

class ApplicationsPage extends StatelessWidget {
  const ApplicationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  padding: const EdgeInsets.all(6.0),
                  margin: EdgeInsets.only(
                      top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                  child: CustomTextWidget(
                    pageTitle: menuController.activeItem.value,
                    titleSize: 28,
                    titleFontWeight: FontWeight.bold,
                    titleColour: dark.withOpacity(0.7),
                  )),
            ],
          ),
        ),

        //!CONTENTS
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(10.0),
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
            width: MediaQuery.of(context).size.width / 1.5,
            decoration: BoxDecoration(
                color: active.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //!INSTRUCTIONS
                Container(
                  margin: const EdgeInsets.all(8.0),
                  child: CustomTextWidget(
                    pageTitle: "Basic Requirements",
                    titleSize: 24,
                    titleFontWeight: FontWeight.bold,
                    titleColour: dark.withOpacity(0.8),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8.0),
                  child: CustomTextWidget(
                    pageTitle: "Select the options that apply to you.",
                    titleSize: 22,
                    titleFontWeight: FontWeight.normal,
                    titleColour: dark.withOpacity(0.7),
                  ),
                ),

                //!CHOICES
                Container(
                  height: MediaQuery.of(context).size.height / 10,
                  decoration: BoxDecoration(
                    color: Colors.amber.shade900.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),

                //!COVER LETTER SECTION
                const SizedBox(
                  height: 10.0,
                ),
                //!INSTRUCTION
                Container(
                  margin: const EdgeInsets.all(8.0),
                  child: CustomTextWidget(
                    pageTitle: "Type an optional cover letter.",
                    titleSize: 22,
                    titleFontWeight: FontWeight.normal,
                    titleColour: dark.withOpacity(0.7),
                  ),
                ),

                //!COVER LETTER TEXT BOX
                Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(40.0),
                  height: MediaQuery.of(context).size.height / 3,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.green.shade900.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 15,
                    maxLength: 10000,
                    style: TextStyle(
                        color: dark,
                        fontWeight: FontWeight.w600,
                        fontSize: 22.0),
                    decoration: InputDecoration(
                      hintText: "Type an optional cover letter.",
                      contentPadding: const EdgeInsets.all(20.0),
                      hintStyle: TextStyle(
                        color: dark.withOpacity(0.8),
                        fontWeight: FontWeight.w500,
                        fontSize: 24.0,
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
                  height: MediaQuery.of(context).size.height / 10,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      fetchFileAttachment();
                    },
                    onHover: (value) {},
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 3.0,
                          color: dark.withOpacity(0.8),
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(
                            Icons.attach_file_outlined,
                            size: 32,
                            color: dark.withOpacity(0.9),
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
                  height: MediaQuery.of(context).size.height / 10,
                  width: MediaQuery.of(context).size.width / 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: InkWell(
                    onTap: () {},
                    onHover: (value) {},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(
                          Icons.upload_outlined,
                          size: 32,
                          color: dark.withOpacity(0.9),
                        ),
                        CustomTextWidget(
                          pageTitle: "Submit Application",
                          titleSize: 20,
                          titleFontWeight: FontWeight.normal,
                          titleColour: dark.withOpacity(0.9),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
