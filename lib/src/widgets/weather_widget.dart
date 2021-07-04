import 'package:flutter/material.dart';
import 'package:flutter_weather/main.dart';
import 'package:flutter_weather/src/bloc/weather_state.dart';
import 'package:flutter_weather/src/model/weather.dart';
import 'package:flutter_weather/src/widgets/forecast_horizontal_widget.dart';
import 'package:flutter_weather/src/widgets/value_tile.dart';
import 'package:flutter_weather/src/widgets/weather_swipe_pager.dart';
import 'package:intl/intl.dart';

class WeatherWidget extends StatelessWidget {
  final Weather weather;


  WeatherWidget({this.weather}) : assert(weather != null);
  bool isLoading = false;
  WeatherState weatherState;
  @override
  Widget build(BuildContext context) {


    return Center(
      child: weatherState is WeatherLoading ? CircularProgressIndicator(
        backgroundColor:
        AppStateContainer.of(context).theme.primaryColor,
      ) : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            this.weather.cityName.toUpperCase(),
            style: TextStyle(
                fontWeight: FontWeight.w900,
                letterSpacing: 5,
                color: AppStateContainer.of(context).theme.accentColor,
                fontSize: 25),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            this.weather.description.toUpperCase(),
            style: TextStyle(
                fontWeight: FontWeight.w100,
                letterSpacing: 5,
                fontSize: 15,
                color: AppStateContainer.of(context).theme.accentColor),
          ),
          Container(
            //color: Colors.black,
            margin: EdgeInsets.only(top: 20,left: 20,right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [new BoxShadow(color: Colors.black,blurRadius: 2.0,),],
                gradient: LinearGradient(
                    begin: Alignment(1.0199999809265137, 0.0199999809265137),
                    end: Alignment(0.0199999809265137, 1.00999999080926513),
                    colors:[const Color(0xFF886dd7).withOpacity(0.8),
                      Color(0xFF5647EB).withOpacity(0.8)

                    ]
                ),
              ),
              child: WeatherSwipePager(weather: weather)
          ),
          Padding(
            child: Divider(
              color:
                  AppStateContainer.of(context).theme.accentColor.withAlpha(50),
            ),
            padding: EdgeInsets.all(10),
          ),
          ForecastHorizontal(weathers: weather.forecast),
          Padding(
            child: Divider(
              color:
                  AppStateContainer.of(context).theme.accentColor.withAlpha(50),
            ),
            padding: EdgeInsets.all(10),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Container(
             // color: Colors.black,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1.0),
                  boxShadow: [new BoxShadow(color: Colors.black,blurRadius: 2.0,),],
                  gradient: LinearGradient(
                      begin: Alignment(1.0199999809265137, 0.0199999809265137),
                      end: Alignment(0.0199999809265137, 1.00999999080926513),
                      colors:[const Color(0xFF886dd7).withOpacity(0.8),
                        Color(0xFF5647EB).withOpacity(0.8)

                      ]
                  ),
                ),
                child: ValueTile("wind speed", '${this.weather.windSpeed} m/s')
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Center(
                  child: Container(

                width: 1,
                height: 30,
                color: AppStateContainer.of(context)
                    .theme
                    .accentColor
                    .withAlpha(50),
              )),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1.0),
                boxShadow: [new BoxShadow(color: Colors.black,blurRadius: 2.0,),],
                gradient: LinearGradient(
                    begin: Alignment(1.0199999809265137, 0.0199999809265137),
                    end: Alignment(0.0199999809265137, 1.00999999080926513),
                    colors:[const Color(0xFF886dd7).withOpacity(0.8),
                      Color(0xFF5647EB).withOpacity(0.8)

                    ]
                ),
              ),
              child: ValueTile(
                  "sunrise",
                  DateFormat('h:m a').format(DateTime.fromMillisecondsSinceEpoch(
                      this.weather.sunrise * 1000))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Center(
                  child: Container(
                width: 1,
                height: 30,
                color: AppStateContainer.of(context)
                    .theme
                    .accentColor
                    .withAlpha(50),
              )),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1.0),
                boxShadow: [new BoxShadow(color: Colors.black,blurRadius: 2.0,),],
                gradient: LinearGradient(
                    begin: Alignment(1.0199999809265137, 0.0199999809265137),
                    end: Alignment(0.0199999809265137, 1.00999999080926513),
                    colors:[const Color(0xFF886dd7).withOpacity(0.8),
                      Color(0xFF5647EB).withOpacity(0.8)

                    ]
                ),
              ),
              child: ValueTile(
                  "sunset",
                  DateFormat('h:m a').format(DateTime.fromMillisecondsSinceEpoch(
                      this.weather.sunset * 1000))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Center(
                  child: Container(
                width: 1,
                height: 30,
                color: AppStateContainer.of(context)
                    .theme
                    .accentColor
                    .withAlpha(50),
              )),
            ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1.0),
                  boxShadow: [new BoxShadow(color: Colors.black,blurRadius: 2.0,),],
                  gradient: LinearGradient(
                      begin: Alignment(1.0199999809265137, 0.0199999809265137),
                      end: Alignment(0.0199999809265137, 1.00999999080926513),
                      colors:[const Color(0xFF886dd7).withOpacity(0.8),
                        Color(0xFF5647EB).withOpacity(0.8)

                      ]
                  ),
                ),
                child: ValueTile("humidity", '${this.weather.humidity}%')),
          ]),
        ],
      )
    );
  }
}
