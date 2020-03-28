import 'package:flutter/material.dart';
import 'package:tracking_covid_19/home_widget.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Tracking Covid-19',
     home: Home(),
   );
 }
}