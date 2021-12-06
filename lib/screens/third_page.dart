import 'dart:convert';

import 'package:dars40/models/json_api_countrys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  var _pageController =
      PageController(initialPage: 0, keepPage: true, viewportFraction: 1.0);
  var _isVertical = Axis.horizontal;
  List<double> _sizeCircle = [22.0, 11.0, 11.0, 11.0, 11.0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 220.0,
              child: PageView(
                scrollDirection: _isVertical,
                reverse: false,
                controller: _pageController,
                pageSnapping: true,
                onPageChanged: (v) {
                  debugPrint("Page : $v");
                  switch (v) {
                    case 0:
                      setState(() {
                        _sizeCircle[0] = 22.0;
                        _sizeCircle[1] = 11.0;
                        _sizeCircle[2] = 11.0;
                        _sizeCircle[3] = 11.0;
                        _sizeCircle[4] = 11.0;
                      });
                      break;
                    case 1:
                      setState(() {
                        _sizeCircle[0] = 11.0;
                        _sizeCircle[1] = 22.0;
                        _sizeCircle[2] = 11.0;
                        _sizeCircle[3] = 11.0;
                        _sizeCircle[4] = 11.0;
                      });
                      break;
                    case 2:
                      setState(() {
                        _sizeCircle[0] = 11.0;
                        _sizeCircle[1] = 11.0;
                        _sizeCircle[2] = 22.0;
                        _sizeCircle[3] = 11.0;
                        _sizeCircle[4] = 11.0;
                      });
                      break;
                    case 3:
                      setState(() {
                        _sizeCircle[0] = 11.0;
                        _sizeCircle[1] = 11.0;
                        _sizeCircle[2] = 11.0;
                        _sizeCircle[3] = 22.0;
                        _sizeCircle[4] = 11.0;
                      });
                      break;
                    case 4:
                      setState(() {
                        _sizeCircle[0] = 11.0;
                        _sizeCircle[1] = 11.0;
                        _sizeCircle[2] = 11.0;
                        _sizeCircle[3] = 11.0;
                        _sizeCircle[4] = 22.0;
                      });
                      break;
                  }
                },
                children: [
                  Container(
                    height: 100.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://source.unsplash.com/random/1",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: <Widget>[],
                    ),
                  ),
                  Container(
                    height: 100.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://source.unsplash.com/random/2",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: <Widget>[],
                    ),
                  ),
                  Container(
                    height: 100.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://source.unsplash.com/random/3",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: <Widget>[],
                    ),
                  ),
                  Container(
                    height: 100.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://source.unsplash.com/random/4",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: <Widget>[],
                    ),
                  ),
                  Container(
                    height: 100.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://source.unsplash.com/random/5",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: <Widget>[],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0, right: 80.0),
              child: Text(
                "Meadow Springs Golf And\nCountry Club",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8.0, right: 110.0),
              child: Text(
                "San Francisco, United States",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          height: 35.0,
                          width: 35.0,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          child: Icon(
                            CupertinoIcons.phone,
                            color: Colors.grey[600],
                            size: 20.0,
                          ),
                        ),
                      ),
                      SizedBox(width: 8.0),
                      InkWell(
                        child: Container(
                          height: 35.0,
                          width: 35.0,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          child: Icon(
                            Icons.navigation,
                            size: 20.0,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      SizedBox(width: 8.0),
                      InkWell(
                        child: Container(
                          height: 35.0,
                          width: 35.0,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          child: Icon(
                            Icons.next_plan_outlined,
                            color: Colors.grey[600],
                            size: 20.0,
                          ),
                        ),
                      ),
                      SizedBox(width: 8.0),
                      InkWell(
                        child: Container(
                          height: 35.0,
                          width: 35.0,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          child: Icon(
                            CupertinoIcons.calendar,
                            color: Colors.grey[600],
                            size: 20.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      height: 45.0,
                      width: 90.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        "Follow",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Divider(
              color: Colors.grey[600],
            ),
            SizedBox(height: 10.0),
            Container(
              margin: EdgeInsets.only(right: 235.0),
              child: Text(
                "Information",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              child: FutureBuilder(
                future: _getSelectedCountry(),
                builder: (context, AsyncSnapshot<List<Countries>> snap) {
                  var data = snap.data;
                  return snap.hasData
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "⭐️ 4.6",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 4.0),
                                Container(
                                  child: Text(
                                    "431 reviews",
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    data![0].population.toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 4.0),
                                Container(
                                  child: Text(
                                    data[0].continents.toString(),
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Container(
                                  child: Icon(
                                    Icons.golf_course,
                                    color: Colors.black,
                                    size: 20.0,
                                  ),
                                ),
                                SizedBox(height: 4.0),
                                Container(
                                  child: Text(
                                    "18 holes",
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : Center(
                          child: CupertinoActivityIndicator(),
                        );
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Container(
                child: Text(
                  "Contrary to popular belief, Lorem Ipsum is not simply random text. Contrary to popular belief, Lorem Ipsum is simply random text. Contrary to popular belief, Lorem Ipsum is not simply random text. Contrary to popular, Loremering Ipsum is not simply random text.",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 25.0),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      width: 165.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.transparent,
                      ),
                      child: Text(
                        "Prewiew",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      width: 165.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.green,
                      ),
                      child: Text(
                        "Start Round",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
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

  Future<List<Countries>> _getSelectedCountry() async {
    var _response =
        await http.get(Uri.parse("https://restcountries.com/v3.1/all"));
    if (_response.statusCode == 200) {
      return (json.decode(_response.body) as List)
          .map((e) => Countries.fromJson(e))
          .toList();
    } else {
      throw Exception("ERROR");
    }
  }
}
