import 'dart:convert';

import 'package:dars40/models/json_api_weather.dart';
import 'package:dars40/screens/third_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SecondPage extends StatelessWidget {
  String? nameOfCountry;
  String? img;
  int index;
  SecondPage({required this.index, required this.nameOfCountry, required this.img});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 718.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.cyan[300],
                image: DecorationImage(
                  image: NetworkImage(
                    img.toString(),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 400.0),
                    child: FutureBuilder(
                      future: _getApiFromJsonForWeather(),
                      builder: (context, AsyncSnapshot<Weathers> snap) {
                        var data = snap.data;
                        if (snap.hasData) {
                          return ListTile(
                            leading: IconButton(
                              icon: Icon(
                                Icons.cloud_outlined,
                                size: 35.0,
                                color: Colors.black,
                              ),
                              onPressed: () {},
                            ),
                            title: Text(
                              data!.wind!.speed.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Text(
                              "Wind: 21 km/h NNE",
                              style: TextStyle(
                                color: Colors.white70,
                              ),
                            ),
                          );
                        } else if(
                          snap.hasError
                        ){
                          return Center(
                            child: Text(snap.error.toString()),
                          );
                        }else {
                          return Center(
                            child: CupertinoActivityIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                  Container(
                    child: Text(
                      "Meadow Springs Golf And\nCountry Club",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    margin: EdgeInsets.only(right: 110.0),
                    child: Text(
                      "San Francisco, United Stated",
                      style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        InkWell(
                          child: Container(
                            alignment: Alignment.center,
                            height: 60.0,
                            width: 170.0,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Text(
                              "Preview",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            alignment: Alignment.center,
                            height: 60.0,
                            width: 170.0,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Text(
                              "Start Round",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ThirdPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          child: Container(
                            height: 30.0,
                            width: 30.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            child: Icon(
                              Icons.arrow_upward,
                              color: Colors.black,
                              size: 18.0,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          child: Text(
                            "Swipe for detail",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Weathers> _getApiFromJsonForWeather() async {
    var _response = await http.get(
      Uri.parse(
          "http://api.openweathermap.org/data/2.5/weather?q=${nameOfCountry}&appid=4142f5dbd40ee58a44ded970452e2963"),
    );
    if (_response.statusCode == 200) {
      return Weathers.fromJson(json.decode(_response.body)); 
    } else {
      throw Exception("ERROR");
    }
  }
}
