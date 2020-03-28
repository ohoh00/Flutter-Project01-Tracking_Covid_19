import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'MyModel.dart';

class CountriesShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      home: Countries(),
    );
  }
}

class Countries extends StatefulWidget {
  @override
  _CountriesState createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  final titleString = "JSON ListVisw";
  final urlJSONString = "https://coronavirus-19-api.herokuapp.com/countries";

  List<MyModel> myAllData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  Widget showListView() {
    return ListView.builder(
        itemCount: myAllData.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(5),
            height: MediaQuery.of(context).size.height * 0.23,
            width: MediaQuery.of(context).size.height * 1.15,
            child: Card(
              color: Colors.deepOrangeAccent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                      title: Center(child: Text('${myAllData[index].country}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                                  height: 15.0,
                                ),
                          Row(
                            children: <Widget>[
                              SizedBox(width: 32.0,),
                              Column(
                                children: <Widget>[
                                  Text('ติดเชื้อ',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                                  Text('${myAllData[index].cases}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                                ],
                              ),
                              SizedBox(width: 15.0,),
                              Column(
                                children: <Widget>[
                                  Text('รักษาหาย',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                                  Text('${myAllData[index].recovered}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)
                                ],
                              ),
                               SizedBox(width: 15.0,),
                              Column(
                                children: <Widget>[
                                  Text('เสียชีวิต',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                                  Text('${myAllData[index].deaths}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)
                                ],
                              ),
                               SizedBox(width: 15.0,),
                              Column(
                                children: <Widget>[
                                  Text('ติดเชื้อวันนี้',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                                  Text('${myAllData[index].todayCases}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20.0,),
                          Row(
                            children: <Widget>[
                              SizedBox(width: 72.0,),
                              Column(
                                children: <Widget>[
                                  Text('รักษาอยู่',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                                  Text('${myAllData[index].active}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)
                                ],
                              ),
                              SizedBox(width: 15.0,),
                              Column(
                                children: <Widget>[
                                  Text('วิกฤต',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                                  Text('${myAllData[index].critical}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)
                                ],
                              ),
                              SizedBox(width: 15.0,),
                              Column(
                                children: <Widget>[
                                  Text('เสียชีวิตวันนี้',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                                  Text('${myAllData[index].todayDeaths}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)
                                ],
                              ),
                            ],
                          ),
                        ],
                      )),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        child: myAllData.length == 0
            ? Center(
                child: CircularProgressIndicator(),
              )
            : showListView(),
      ),
    ));
  }

  void loadData() async {
    var response =
        await http.get(urlJSONString, headers: {"Aceept": "application/json"});
    if (response.statusCode == 200) {
      String responseBodyString = response.body;
      print('responseBodyString ==> $responseBodyString');
      var jsonBody = json.decode(responseBodyString);
      for (var data in jsonBody) {
        myAllData.add(MyModel(
            data['country'],
            data['cases'],
            data['todayCases'],
            data['deaths'],
            data['todayDeaths'],
            data['recovered'],
            data['active'],
            data['critical'],
            data['casesPerOneMillion']));
      }
      setState(() {
        myAllData.forEach((countryData) {});
      });
    } else {
      print('Somthaing Wrong');
    }
  }
}
