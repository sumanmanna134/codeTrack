import 'package:code_track/Utils/StorageManager.dart';
import 'package:code_track/Utils/ThemeManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isSelect = false;
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeNotifier>(context);
    StorageManager.readData("theme").then((value) {
      isSelect = value??false;
    });
    return Switch(
      activeColor: Colors.white54,
      value: isSelect,
      splashRadius: 2,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onChanged: (value){
        setState(() {
          isSelect = value ;
          StorageManager.saveData("theme", isSelect);
          if(isSelect){
            theme.setDarkMode();
          }else{
            theme.setLightMode();
          }
        });


      },
    );
  }
}
