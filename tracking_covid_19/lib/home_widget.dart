import 'package:flutter/material.dart';
import 'Globals.dart';
import 'Datacountries.dart';

class Home extends StatefulWidget {
 @override
 State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int index = 0;
  List<Widget> _children = [Globalco(),CountriesShow()];

  BottomNavigationBarItem homeNav(){
    return BottomNavigationBarItem (
      icon : Icon(Icons.language),
      title: Text('ทั่วโลก'));
  }

  BottomNavigationBarItem twoNav(){
    return BottomNavigationBarItem (
      icon : Icon(Icons.local_airport),
      title: Text('ต่างประเทศ'));
  }

  Widget myButtonNavBar(){
    return BottomNavigationBar(onTap: (int i){
      setState(() {
        index = i;
      });
    },
    currentIndex: index,
    items: <BottomNavigationBarItem>[
      homeNav(),
      twoNav()
    ]
    );
  }


 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(backgroundColor: Colors.red,
       title: Center(child: Text('            Tracking Covid-19')),
       actions: <Widget>[IconButton(icon: Icon(Icons.refresh), onPressed: (){setState(() {
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
       });})],
     ),
     body: _children[index],
     bottomNavigationBar:  myButtonNavBar(),
   );
 }
}