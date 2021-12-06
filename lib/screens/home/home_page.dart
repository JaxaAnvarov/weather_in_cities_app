import 'dart:convert';
import 'package:dars40/components/size_config.dart';
import 'package:dars40/models/json_api_countrys.dart';
import 'package:dars40/screens/second_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int index = 0;
  var _formKey = GlobalKey<FormState>();
  TextEditingController _countryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: getProportionateScreenHeight(10.0)),
              Container(
                margin: EdgeInsets.only(
                  right: getProportionateScreenWidth(220.0),
                  top: getProportionateScreenHeight(5.0),
                ),
                child: Text(
                  "Countries",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(26.0),
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(4.0)),
              Container(
                margin:
                    EdgeInsets.only(right: getProportionateScreenWidth(15.0)),
                child: Text(
                  "Which Country We Are Going To Travel To",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: getProportionateScreenWidth(17.0),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(12.0)),
              Container(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20.0),
                      vertical: getProportionateScreenHeight(2.0),
                    ),
                    child: TextFormField(
                      controller: _countryController,
                      decoration: InputDecoration(
                        hintText: "Type to search...",
                        prefixIcon: InkWell(
                          onTap: () {
                            setState(() {});
                          },
                          child: Icon(
                            CupertinoIcons.search,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(10.0)),
              Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text(
                          "Nearby Countries",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          "View All",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                margin: EdgeInsets.only(right: 168.0),
                child: Text(
                  "List Of Nearby Countries",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 17.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                height: getProportionateScreenHeight(310.0),
                child: FutureBuilder(
                  future: _getApiFromJsonForCountry(),
                  builder: (context, AsyncSnapshot<List<Countries>> snap) {
                    var data = snap.data;
                    if (snap.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return InkWell(
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              margin: EdgeInsets.all(10.0),
                              height: getProportionateScreenHeight(200.0),
                              width: getProportionateScreenWidth(200.0),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(20.0),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    data![index].flags!.png.toString(),
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(top: 180.0),
                                    height: getProportionateScreenHeight(100.0),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20.0),
                                        bottomRight: Radius.circular(20.0),
                                      ),
                                    ),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(
                                            top: getProportionateScreenHeight(
                                                20.0),
                                            right: getProportionateScreenWidth(
                                                20.0),
                                          ),
                                          child: Text(
                                            data[index]
                                                .name!
                                                .official!
                                                .toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      16.0),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                            top: getProportionateScreenHeight(
                                                5.0),
                                            right: getProportionateScreenWidth(
                                                22.0),
                                          ),
                                          child: Text(
                                            data[index]
                                                .name!
                                                .common!
                                                .toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      16.0),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(right: 65.0),
                                          child: Text(
                                            "⭐️ 4.2 * 0.3 mil",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      16.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SecondPage(
                                    img:
                                        "https://source.unsplash.com/random/$index",
                                    index: index,
                                    nameOfCountry:
                                        data[index].name!.official.toString(),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: CupertinoActivityIndicator(),
                      );
                    }
                  },
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                margin: EdgeInsets.only(right: 220.0),
                child: Text(
                  "Top Countries",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                height: 200.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: FutureBuilder(
                  future: _getSelectedCountry(),
                  builder: (context, AsyncSnapshot<List<Countries>> snap) {
                    var data = snap.data;
                    return snap.hasData
                        ? InkWell(
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    getProportionateScreenWidth(30.0)),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    data![0].flags!.png.toString(),
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Text(
                                data[0].name!.common.toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: getProportionateScreenWidth(22.0),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SecondPage(
                                    img: data[index].flags!.png.toString(),
                                    index: index,
                                    nameOfCountry:
                                        data[index].name!.official.toString(),
                                  ),
                                ),
                              );
                            },
                          )
                        : Container();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(CupertinoIcons.home),
            icon: Icon(Icons.home_filled),
            label: "",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(CupertinoIcons.search),
            icon: Icon(Icons.search),
            label: "",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(CupertinoIcons.home),
            icon: Icon(Icons.stacked_bar_chart_outlined),
            label: "",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.golf_course_outlined),
            icon: Icon(Icons.golf_course),
            label: "",
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
    );
  }

  Future<List<Countries>> _getApiFromJsonForCountry() async {
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

  Future<List<Countries>> _getSelectedCountry() async {
    var _response = await http.get(Uri.parse(
        "https://restcountries.com/v3.1/name/${_countryController.text}"));
    if (_response.statusCode == 200) {
      return (json.decode(_response.body) as List)
          .map((e) => Countries.fromJson(e))
          .toList();
    } else {
      throw Exception("ERROR");
    }
  }
}
