import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather/main.dart';
import 'package:flutter_weather/src/screens/weather_screen.dart';

class SplashScreen extends StatefulWidget{
  @override
  SpalshScreenState createState() =>SpalshScreenState();

}
class SpalshScreenState extends State <SplashScreen>{
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WeatherScreen(),
          ));
    });
  }
  @override
  Widget build(BuildContext context) {
//    var _mediaQueryData = MediaQuery.of(context);
//    double screenWidth = _mediaQueryData.size.width;
//    double screenHeight = _mediaQueryData.size.height;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(1.0199999809265137, 0.0199999809265137),
              end: Alignment(0.0199999809265137, 1.00999999080926513),
              colors:[const Color(0xFF886dd7).withOpacity(0.8),
                Color(0xFF5647EB).withOpacity(0.8)

              ]
          ),
        ),

        child: Center(
          child: Container(
            margin: EdgeInsets.only(left: 10,right: 10),
            child: Image.asset(
              "assets/images/splash.png",
//              height: 50,
//              width: 50 ,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),
    );
  }

}