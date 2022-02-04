import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouniee/constants/controllers.dart';
import 'package:ouniee/constants/style.dart';
import 'package:ouniee/widgets/custom_text_widget.dart';

class HorizontalMenuItem extends StatelessWidget {
  final String itemName;
  final Function onTap;
  const HorizontalMenuItem(
      {Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return InkWell(
        onTap: onTap as VoidCallback,
        onHover: (value) {
          value
              ? menuController.onHover(itemName)
              : menuController.onHover("not hovering");
        },
        child: Obx(() => Container(
              color: menuController.isActive(itemName)
                  ? active.withOpacity(.05)
                  : (menuController.isHovering(itemName)
                      ? lightGrey.withOpacity(.1)
                      : Colors.transparent),
              child: Row(
                children: <Widget>[
                  Visibility(
                    visible: menuController.isHovering(itemName) ||
                        menuController.isActive(itemName),
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: Container(
                      width: 6,
                      height: 40,
                      color: active,
                    ),
                  ),
                  SizedBox(width: _width / 88),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: menuController.returnIconFor(itemName),
                  ),
                  if (!menuController.isActive(itemName))
                    Flexible(
                        child: CustomTextWidget(
                      pageTitle: itemName,
                      titleColour: menuController.isHovering(itemName)
                          ? dark
                          : lightGrey,
                      titleSize: 16,
                      titleFontWeight: FontWeight.normal,
                    ))
                  else
                    Flexible(
                        child: CustomTextWidget(
                      pageTitle: itemName,
                      titleColour: active,
                      titleSize: 20,
                      titleFontWeight: FontWeight.bold,
                    ))
                ],
              ),
            )));
  }
}
