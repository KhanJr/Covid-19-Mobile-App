import 'package:covid19_test1/card/home_page.dart';
import 'package:covid19_test1/chart/color_loader_3.dart';
import 'package:covid19_test1/info/prevent.dart';
import 'package:covid19_test1/info/symptoms.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constant.dart';
import 'counter.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  Future<List> cont;

  Future<List> getCountries() async {
    var response = await Dio().get(
        'https://covid19-stats-api.herokuapp.com/api/v1/cases?country=India');
    print([response.data]);
    return [response.data];
  }

  @override
  void initState() {
    cont = getCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // getCountries();
    return Scaffold(
        appBar: AppBar(
          title: Text('COVID-19'),
          backgroundColor: Color(0xff392850),
        ),
        body: Container(
            color: Color(0xff392850),
            child: FutureBuilder<List>(
                future: cont,
                builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Column(children: [
                            Image.asset("assets/front.jpeg"),

                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Column(children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      RichText(
                                        // textAlign: TextAlign.right,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "Current cases\n"
                                                  .toUpperCase(),
                                              style: kTitleTextstyle,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Color(0xff392850),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(0, 4),
                                            blurRadius: 30,
                                            color: Colors.black45),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Counter(
                                          color: kInfectedColor,
                                          number: snapshot.data[index]
                                              ['confirmed'],
                                          title: "Infected",
                                        ),
                                        Counter(
                                          color: kDeathColor,
                                          number: snapshot.data[index]
                                              ['deaths'],
                                          title: "Deaths",
                                        ),
                                        Counter(
                                          color: kRecovercolor,
                                          number: snapshot.data[index]
                                              ['recovered'],
                                          title: "Recovered",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                ])),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                );
                              },
                              child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Column(children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        RichText(
                                          // textAlign: TextAlign.right,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "States Data\n"
                                                    .toUpperCase(),
                                                style: kTitleTextstyle,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Color(0xff392850),
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(0, 4),
                                              blurRadius: 30,
                                              color: Colors.black45),
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'all states data'.toUpperCase(),
                                            style: TextStyle(
                                                color: Colors.white70,
                                                fontFamily: 'Avenir',
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.white70,
                                            size: 30.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                  ])),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Prevent()),
                                );
                              },
                              child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Column(children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        RichText(
                                          // textAlign: TextAlign.right,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "Prevention\n"
                                                    .toUpperCase(),
                                                style: kTitleTextstyle,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Color(0xff392850),
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(0, 4),
                                              blurRadius: 30,
                                              color: Colors.black45),
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'prevention'.toUpperCase(),
                                            style: TextStyle(
                                                color: Colors.white70,
                                                fontFamily: 'Avenir',
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.white70,
                                            size: 30.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                  ])),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Symptoms()),
                                );
                              },
                              child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Column(children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        RichText(
                                          // textAlign: TextAlign.right,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    "Symptoms\n".toUpperCase(),
                                                style: kTitleTextstyle,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Color(0xff392850),
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(0, 4),
                                              blurRadius: 30,
                                              color: Colors.black45),
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'symptoms'.toUpperCase(),
                                            style: TextStyle(
                                                color: Colors.white70,
                                                fontFamily: 'Avenir',
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.white70,
                                            size: 30.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                  ])),
                            ),
                            // Buttons(myList)
                          ]);
                        });
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ColorLoader4(
                        dotOneColor: Color(0xffFFB157),
                        dotTwoColor: Color(0xffFF5B95),
                        dotThreeColor: Color(0xff6DC8F3),
                        dotType: DotType.square,
                        duration: Duration(milliseconds: 1200),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Takeing Too Long, \nYou Might Want To Check Your Internet Connection",
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Color(0xffa29aac),
                                fontSize: 14,
                                fontWeight: FontWeight.w700)),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                })));
  }
}
