import 'package:flutter/material.dart';
import 'package:http/http.dart' as Http;
import 'dart:convert';
import 'package:tracking_covid_19/Datacountries.dart';


class Globalco extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Global(),
      ),
    );
  }
}

class Global extends StatefulWidget {
  @override
  _GlobalState createState() => _GlobalState();
}

class _GlobalState extends State<Global> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GlobalService.casesNumber();
    ThaiService.casesNumber();
  }


  Widget pad2(){
    return CountriesShow();
  }

  Widget logoCase() {
    return Container(
      child: Image.asset('images/case.png'),
      width: 70.0,
      height: 70.0,
    );
  }

  Widget logoStrong() {
    return Container(
      child: Image.asset('images/strong.png'),
      width: 70.0,
      height: 70.0,
    );
  }

  Widget logoDeath() {
    return Container(
      child: Image.asset('images/death.png'),
      width: 60.0,
      height: 60.0,
    );
  }
  
  Widget read() {
    return RaisedButton(
      child: Text('read'),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (contexts) => CountriesShow()));
      },
    );
  }

  Widget thai() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FutureBuilder(
              future: ThaiService.casesNumber(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasData) {
                  MessageThaiDao mtd = snapshot.data;
                  return Column(
                    children: <Widget>[
                      Center(
                        child: Container(
                            padding: EdgeInsets.all(20),
                            height: MediaQuery.of(context).size.height * 0.30,
                            width: MediaQuery.of(context).size.height * 1.20,
                            child: Card(
                              color: Colors.deepOrangeAccent,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text(
                                    'ประเทศไทย',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      SizedBox(width: 40.0,),
                                      Column(
                                        children: <Widget>[
                                          Text('ติดเชื้อ',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),),
                                          Text('${mtd.cases}',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                                        ],
                                      ),
                                      SizedBox(width: 15.0,),
                                      Column(
                                        children: <Widget>[         
                                          Text('รักษาหาย',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),),
                                          Text('${mtd.recovered}',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)
                                        ],
                                      ),
                                      SizedBox(width: 15.0,),
                                      Column(
                                        children: <Widget>[     
                                          Text('เสียชีวิต',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),),
                                          Text('${mtd.deaths}',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)
                                        ],
                                      ),
                                      SizedBox(width: 15.0,),
                                      Column(
                                        children: <Widget>[
                                          Text('ติดเชื้อวันนี้',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),),
                                          Text('${mtd.todayCases}',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20.0,),
                                  Row(
                                    children: <Widget>[
                                      SizedBox(width: 75.0,),
                                      Column(
                                        children: <Widget>[
                                          Text('รักษาอยู่',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),),
                                          Text('${mtd.active}',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                                        ],
                                      ),
                                      SizedBox(width: 15.0,),
                                      Column(
                                        children: <Widget>[
                                          Text('วิกฤต',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),),
                                          Text('${mtd.critical}',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                                        ],
                                      ),
                                      SizedBox(width: 15.0,),
                                      Column(
                                        children: <Widget>[
                                          Text('เสียชีวิตวันนี้',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),),
                                          Text('${mtd.todayDeaths}',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                                        ],
                                      )
                                    ],
                                  ),
                                  
                                ],
                              ),
                            )),
                      )
                    ],
                  );
                } else {
                  return CircularProgressIndicator();
                }
              }),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            children: <Widget>[
              FutureBuilder(
        future: GlobalService.casesNumber(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            MessageGlobalDao msg = snapshot.data;
            return Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                Container(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20.0),
                      height: MediaQuery.of(context).size.height * 0.45,
                      width: MediaQuery.of(context).size.height * 1.10,
                      child: Card(
                        color: Colors.deepOrangeAccent,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'ทั่วโลก',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 30.0,
                                ),
                                logoCase(),
                                SizedBox(
                                  width: 90.0,
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      'ติดเชื้อ',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${msg.cases}',
                                      style: TextStyle(
                                          fontSize: 25.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 25.0,
                                ),
                                logoStrong(),
                                SizedBox(
                                  width: 95.0,
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      'รักษาหาย',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${msg.recovered}',
                                      style: TextStyle(
                                          fontSize: 25.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 40.0,
                                ),
                                logoDeath(),
                                SizedBox(
                                  width: 97.0,
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      'เสียชีวิต',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${msg.deaths}',
                                      style: TextStyle(
                                          fontSize: 25.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    thai(),
                  ],
                ))
              ],
            );
          } else {
            return SafeArea(
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                ],
              )),
            );
          }
        }),
            ],
             
          ),
    );
    
    
  }
}

class GlobalService {
  static Future<MessageGlobalDao> casesNumber() async {
    var url = "https://coronavirus-19-api.herokuapp.com/all";
    var response = await Http.get(url);
    Map map = json.decode(response.body);
    MessageGlobalDao msg = MessageGlobalDao.fromJson(map);
    return msg;
  }
}

class MessageGlobalDao {
  int cases;
  int deaths;
  int recovered;

  MessageGlobalDao({this.cases, this.deaths, this.recovered});

  MessageGlobalDao.fromJson(Map<String, dynamic> json) {
    cases = json['cases'];
    deaths = json['deaths'];
    recovered = json['recovered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cases'] = this.cases;
    data['deaths'] = this.deaths;
    data['recovered'] = this.recovered;
    return data;
  }
}

class ThaiService {
  static Future<MessageThaiDao> casesNumber() async {
    var url = "https://coronavirus-19-api.herokuapp.com/countries/Thailand";
    var response = await Http.get(url);
    Map map = json.decode(response.body);
    MessageThaiDao mtd = MessageThaiDao.fromJson(map);
    return mtd;
  }
}

class MessageThaiDao {
  String country;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int active;
  int critical;
  int casesPerOneMillion;

  MessageThaiDao(
      {this.country,
      this.cases,
      this.todayCases,
      this.deaths,
      this.todayDeaths,
      this.recovered,
      this.active,
      this.critical,
      this.casesPerOneMillion});

  MessageThaiDao.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    cases = json['cases'];
    todayCases = json['todayCases'];
    deaths = json['deaths'];
    todayDeaths = json['todayDeaths'];
    recovered = json['recovered'];
    active = json['active'];
    critical = json['critical'];
    casesPerOneMillion = json['casesPerOneMillion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['cases'] = this.cases;
    data['todayCases'] = this.todayCases;
    data['deaths'] = this.deaths;
    data['todayDeaths'] = this.todayDeaths;
    data['recovered'] = this.recovered;
    data['active'] = this.active;
    data['critical'] = this.critical;
    data['casesPerOneMillion'] = this.casesPerOneMillion;
    return data;
  }
}
