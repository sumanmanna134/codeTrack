import 'package:code_track/screen/pages/mobile/screens/MobileScreens.dart';
import 'package:code_track/screen/pages/tablet/screens/TabletScreens.dart';
import 'package:code_track/screen/pages/web/screens/DesktopScreen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizeInformation){
        if(sizeInformation.isDesktop){
          return DesktopScreen();
        }

        if(sizeInformation.isTablet){
          return TabletScreen();
        }

          return MobileScreen();

      },
    );
  }
}
