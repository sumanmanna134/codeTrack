import 'package:code_track/Utils/ThemeManager.dart';
import 'package:code_track/screen/pages/web/screens/Settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
class WebVerticalNavBar extends StatefulWidget {
  @override
  _WebVerticalNavBarState createState() => _WebVerticalNavBarState();
}



class _WebVerticalNavBarState extends State<WebVerticalNavBar> {
  int _ButtonCurrentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, ),
      height: double.infinity,
      width : 70,
      decoration: BoxDecoration(
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 2,
              offset: Offset(
                  0.5,0.0
              ),
              spreadRadius: 2,

            )
          ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _logoWidget(),
          _colButtons(),
          _logoutButton(),
          Settings(),
          SizedBox.shrink()
        ],
      ),
    );
  }

  Widget _logoWidget() {
    return Container(
      child: Image.asset("assets/logo.png"),
    );
  }

  Widget _colSingleButton({IconData icon , Color borderColor , Color iconColor}){
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child:Container(
        width: 70,
        child: Icon(icon, color: iconColor,),
        decoration: BoxDecoration(
          border:  Border(right: BorderSide(width: 2, color: borderColor))
        ),
      ),
    );
  }

  Widget _colButtons() {
    return Container(
      child: Column(
        children: [
          InkWell(
            onTap: (){
              setState(() {
                _ButtonCurrentindex =0;
              });
            },
              child: _colSingleButton(
                  icon : Icons.widgets,
                  borderColor: _ButtonCurrentindex==0?Colors.deepOrange:Colors.transparent, iconColor: _ButtonCurrentindex==0?Colors.indigo:null)),
          InkWell(
            onTap: (){
              setState(() {
                _ButtonCurrentindex =1;
              });
            },
              child: _colSingleButton(icon : Icons.score, borderColor: _ButtonCurrentindex==1?Colors.deepOrange:Colors.transparent, iconColor: _ButtonCurrentindex==1?Colors.indigo:null)),
          InkWell(
            onTap: (){
              setState(() {
                _ButtonCurrentindex =2;
              });
            },
              child: _colSingleButton(icon : Icons.calendar_today, borderColor: _ButtonCurrentindex==2?Colors.deepOrange:Colors.transparent, iconColor: _ButtonCurrentindex==2?Colors.indigo:null)),
          InkWell(
            onTap: (){
              setState(() {
                _ButtonCurrentindex =3;
              });
            },
              child: _colSingleButton(icon : Icons.pages, borderColor: _ButtonCurrentindex==3?Colors.deepOrange:Colors.transparent, iconColor: _ButtonCurrentindex==3?Colors.indigo:null)),
          InkWell(
            onTap: (){
              setState(() {
                _ButtonCurrentindex =4;
              });
            },
              child: _colSingleButton(icon : Icons.settings, borderColor: _ButtonCurrentindex==4?Colors.deepOrange:Colors.transparent, iconColor: _ButtonCurrentindex==4?Colors.indigo:null)),


        ],
      ),
    );
  }

  Widget _logoutButton() {
    return Icon(Icons.exit_to_app);
  }
}
