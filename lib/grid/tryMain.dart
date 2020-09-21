import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';
import 'gridview.dart';
import 'dart:core';
// import 'package:covid19_test1/chart/chart.dart';

class Home extends StatefulWidget {
  Home(this.myList, this.state, this.data);
  final List myList;
  final String state;
  final Map<String, int> data;
  @override
  HomeState createState() => new HomeState(myList, state, data);
}

class HomeState extends State<Home> {
  HomeState(this.myList, this.state, this.data);
  List myList;
  String state;
  Map<String, int> data;


  @override
  Widget build(BuildContext context) {
    print(data);
    return Scaffold(
      backgroundColor: Color(0xff392850),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      state.toUpperCase(),
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Be Safe, Keep Social Distance, Stay Alert",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Color(0xffa29aac),
                              fontSize: 14,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                // IconButton(
                //   alignment: Alignment.topCenter,
                //   icon: Icons.access_alarm,
                //   // icon: Image.asset(
                //   //   "assets/active.jpg",
                //   //   width: 24,
                //   // ),
                //   onPressed: () {},
                // )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          PieChart(
            dataMap: data,
            animationDuration: Duration(milliseconds: 800),
            chartLegendSpacing: 32,
            chartRadius: MediaQuery.of(context).size.width / 3,
            // colorList: [Colors.amber, Colors.blue, Colors.black, Colors.white],
            initialAngleInDegree: -90,
            chartType: ChartType.ring,
            ringStrokeWidth: 20,
            // centerText: "HYBRID",
            legendOptions: LegendOptions(
              showLegendsInRow: true,
              legendPosition: LegendPosition.bottom,
              showLegends: true,
              legendShape: BoxShape.circle,
              legendTextStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            chartValuesOptions: ChartValuesOptions(
              showChartValueBackground: true,
              showChartValues: true,
              showChartValuesInPercentage: true,
              showChartValuesOutside: false,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          GridDashboard(myList)
        ],
      ),
    );
  }
}
