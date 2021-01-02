import 'dart:html';

import 'package:code_track/Repository/FakeRepository.dart';
import 'package:code_track/Utils/StorageManager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
class BodyContent extends StatefulWidget {
  final SizingInformation sizingInformation;



  const BodyContent({Key key, this.sizingInformation}) : super(key: key);

  @override
  _BodyContentState createState() => _BodyContentState();
}

class _BodyContentState extends State<BodyContent> {
  int _rowButtonCurrentIndex = 0;
  Color widgetColor;
  final _data = FakeRepository.data;
  @override
  Widget build(BuildContext context) {
    widgetColor = Theme.of(context).canvasColor;
    return Container(
      width: widget.sizingInformation.screenSize.width /1.4,
      child: Column(
        children: [
          _headerWidget(),
          _quickStatsWidget(),
          _rowButtons(),
          SizedBox(height: 5,),
          _gridListItems()
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
              _singleItemQuickStats(title: "Total Tickets" , value: "28,345" , icon: null , containerColor: widgetColor , ),
              _singleItemQuickStats(title: "Pending Approval" , value: "109" , icon: null , containerColor: widgetColor ,textColor: Colors.red),
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
    return Container(
      height: 40,
      margin: EdgeInsets.only(top:15, left: 20, bottom: 0),
      decoration: BoxDecoration(
          border:  Border(bottom: BorderSide(width: 1 , color: Colors.black.withOpacity(.2)))
      ),
      child: Row(
        children: [
          InkWell(
            hoverColor: Colors.transparent,
            onTap: (){
              setState(() {
                _rowButtonCurrentIndex=0;
              });
            },
            child: _singleRowButton(
              title: "Booking",
              textColor: _rowButtonCurrentIndex==0?null:Colors.grey[400],
              borderColor: _rowButtonCurrentIndex==0?Colors.deepOrange:Colors.transparent,
            ),
          ),
          InkWell(
            hoverColor: Colors.transparent,
            onTap: (){
              setState(() {
                _rowButtonCurrentIndex=1;
              });
            },
            child: _singleRowButton(
              title: "Enquiries",
              textColor: _rowButtonCurrentIndex==1?null:Colors.grey[400],
              borderColor: _rowButtonCurrentIndex==1?Colors.deepOrange:Colors.transparent,
            ),
          ),
          InkWell(
            hoverColor: Colors.transparent,
            onTap: (){
              setState(() {
                _rowButtonCurrentIndex=2;
              });
            },
            child: _singleRowButton(
              title: "My Service",
              textColor: _rowButtonCurrentIndex==2?null:Colors.grey[400],

              borderColor: _rowButtonCurrentIndex==2?Colors.deepOrange:Colors.transparent,
            ),
          )
        ],
      ),
    );

  }

  _singleRowButton({String title , Color borderColor , Color textColor }) {
    return Container(
      height: 40,
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        border:  Border(bottom: BorderSide(width: 2 , color: borderColor))
      ),
      child: Text(title ,style: TextStyle(fontSize: 18 ,color: textColor, fontWeight: FontWeight.bold),),
    );




  }

  Widget _gridListItems() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
          itemCount: _data.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.5
          ),
          itemBuilder:(context, index){
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4) ,
              padding: EdgeInsets.symmetric(horizontal: 28, vertical: 18),
              decoration: BoxDecoration(
                color: widgetColor,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(.2),
                      blurRadius: 2 ,
                      spreadRadius: 2,
                      offset: Offset(0.5,0.5)
                  ),

                ]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_data[index].name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      Text("Service" , style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold)),
                      Text(_data[index].serviceName, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                    ],
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("Date" , style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold)),
                         Text(_data[index].date, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                       ],
                     ),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("Time" , style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold)),
                         Text(_data[index].time, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                       ],
                     ),

                    ],
                  ),
                  SizedBox(height: 3,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MaterialButton(
                        color: Colors.indigo,
                        onPressed: (){

                        },
                        child: Text("Accept",style: TextStyle(color: Colors.white),),
                      ),
                      MaterialButton(
                        color: Colors.red,
                        onPressed: (){

                        },
                        child: Text("Decline",style: TextStyle(color: Colors.white),),
                      ),
                    ],
                  )





                ],
              ),

            );
        },),
      ),
    );
  }
}
