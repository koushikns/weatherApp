import 'package:flutter/material.dart';
import 'package:flutter_weather/main.dart';
import 'package:flutter_weather/src/model/weather.dart';
import 'package:flutter_weather/src/widgets/value_tile.dart';
import 'package:intl/intl.dart';

/// Renders a horizontal scrolling list of weather conditions
/// Used to show forecast
/// Shows DateTime, Weather Condition icon and Temperature
class ForecastHorizontal extends StatelessWidget {
  const ForecastHorizontal({
    Key key,
    @required this.weathers,
  }) : super(key: key);

  final List<Weather> weathers;

  @override
  Widget build(BuildContext context) {
    return Container(
//      decoration: BoxDecoration(
//        borderRadius: BorderRadius.circular(10.0),
//        color: Colors.purple
//      ),
      height: 70,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: this.weathers.length,
        separatorBuilder: (context, index) => Divider(
              height: 100,
              color: Colors.white,
            ),
        padding: EdgeInsets.only(left: 10, right: 10),
        itemBuilder: (context, index) {
          final item = this.weathers[index];
          return Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    boxShadow: [new BoxShadow(color: Colors.black,blurRadius: 2.0,),],
                    gradient: LinearGradient(
                        begin: Alignment(1.0199999809265137, 0.0199999809265137),
                        end: Alignment(0.0199999809265137, 1.00999999080926513),
                        colors:[const Color(0xFF5647EB).withOpacity(0.8),
                          Color(0xFF886dd7).withOpacity(0.8)

                        ]
                    ),
                  ),
                  //color: Colors.purple,
                  child: ValueTile(
              DateFormat('E, ha').format(
                    DateTime.fromMillisecondsSinceEpoch(item.time * 1000)),
              '${item.temperature.as(AppStateContainer.of(context).temperatureUnit).round()}°',
              iconData: item.getIconData(),
            ),
                )),
          );
        },
      ),
    );
  }
}
