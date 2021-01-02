import 'package:code_track/Utils/ThemeManager.dart';
import 'package:code_track/screen/pages/web/widget/body_content_widget.dart';
import 'package:code_track/screen/pages/web/widget/right_side_widget.dart';
import 'package:code_track/screen/pages/web/widget/web_vertical_navabar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
class DesktopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (_,sizeInformation){
        return Scaffold(
          body: Container(
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WebVerticalNavBar(),
                  BodyContent(sizingInformation: sizeInformation,),
                  RightSideWidget()

                ],
              )
          ),
        );
      },
    );

  }
}
