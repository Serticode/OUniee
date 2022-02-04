import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouniee/constants/controllers.dart';
import 'package:ouniee/constants/style.dart';
import 'package:ouniee/widgets/custom_text_widget.dart';

class VerticalMenuItem extends StatelessWidget {
  final String itemName;
  final Function onTap;
  const VerticalMenuItem(
      {Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap as VoidCallback,
        onHover: (value) {
          value
              ? menuController.onHover(itemName)
              : menuController.onHover("not hovering");
        },
        child: Obx(() => Container(
              color: menuController.isHovering(itemName)
                  ? active //lightGrey.withOpacity(.1)
                  : Colors.transparent,
              child: Row(
                children: <Widget>[
                  Visibility(
                    visible: menuController.isHovering(itemName) ||
                        menuController.isActive(itemName),
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: Container(
                      width: 3,
                      height: 72,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: menuController.returnIconFor(itemName),
                          ),
                          if (!menuController.isActive(itemName))
                            Flexible(
                                child: CustomTextWidget(
                              pageTitle: itemName,
                              titleColour: menuController.isHovering(itemName)
                                  ? Colors.white
                                  : lightGrey,
                              titleFontWeight: FontWeight.normal,
                              titleSize: 16,
                            ))
                          else
                            Flexible(
                                child: CustomTextWidget(
                              pageTitle: itemName,
                              titleColour: Colors.white,
                              titleSize: 20,
                              titleFontWeight: FontWeight.bold,
                            ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
