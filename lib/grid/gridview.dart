import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridDashboard extends StatelessWidget {
  GridDashboard(this.myList);
  final List myList;

  @override
  Widget build(BuildContext context) {
    // List<Items> myList = [item1, item2, item3, item4];
    var color = 0xff453658;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return Container(
              decoration: BoxDecoration(
              color: Color(color), borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      data.img,
                      height: 72,
                      width: 72,
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    data.title,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                  // SizedBox(
                  //   height: 8,
                  // ),
                  // Text(
                  //   data.subtitle,
                  //   style: GoogleFonts.openSans(
                  //       textStyle: TextStyle(
                  //           color: Colors.white38,
                  //           fontSize: 10,
                  //           fontWeight: FontWeight.w600)),
                  // ),
                  // SizedBox(
                  //   height: 14,
                  // ),
                  Text(
                    data.event,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white70,
                            fontSize: 24,
                            fontWeight: FontWeight.w600
                          )
                        ),
                  ),
                ],
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  String event;
  String img;
  Items({this.title, this.event, this.img});
}
