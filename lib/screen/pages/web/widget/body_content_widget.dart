import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
class BodyContent extends StatelessWidget {
  final SizingInformation sizingInformation;

  const BodyContent({Key key, this.sizingInformation}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizingInformation.screenSize.width /1.4,
      child: Column(
        children: [
          _headerWidget(),
          _quickStatsWidget(),
          _rowButtons()
        ],
      ),
    );
  }

  Widget _headerWidget() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("DashBoard", style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold),),
              SizedBox(height: 5,),
              Text("Welcome Back!", style: TextStyle(fontSize: 18 ),)
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.all(Radius.circular(8))
            ),
            child: Text("Customise Blocks" , style: TextStyle(color: Colors.white),),
          )
        ],
      ),
    );
  }

  Widget _quickStatsWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Quick Stats ", style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _singleItemQuickStats(title: "Total Tickets" , value: "28,345" , icon: null , containerColor: Colors.white30 , ),
              _singleItemQuickStats(title: "Pending Approval" , value: "109" , icon: null , containerColor: Colors.white30  ),
              _singleItemQuickStats(title: "New Tickets this Month" , value: "120" , icon: Icons.call_made , iconColor: Colors.green, containerColor: Colors.white30),
              _singleItemQuickStats(title: "Returning Clients" , value: "20%" , icon: Icons.call_received , iconColor: Colors.red, containerColor: Colors.white30),
            ],
          )
        ],
      ),
    );
  }

 Widget _singleItemQuickStats({String title="" ,Color textColor,  String value , IconData icon , Color iconColor , Color containerColor}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 28),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.2), spreadRadius: 2, offset: Offset(0.5,0.5), blurRadius: 2)
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(fontSize: 18 , color: textColor, ),),
          SizedBox(height: 10,),
          icon==null ? Text(value, style: TextStyle(fontSize: 24 , fontWeight: FontWeight.bold), ):
              Row(
                children: [
                  Text(value, style: TextStyle(fontSize: 24 , fontWeight: FontWeight.bold)),
                  Icon(icon,color: iconColor,)

                ],

              ),

        ],
      ),
    );

  }

  Widget _rowButtons() {
    return Row(
      children: [
        _singleRowButton()
      ],
    );

  }

  _singleRowButton() {


  }
}
