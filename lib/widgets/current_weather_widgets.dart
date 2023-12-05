// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_data_current.dart';
import 'package:weather_app/utils/custom_colors.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const CurrentWeatherWidget({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        temperatureAreaWidget(weatherDataCurrent),
        const SizedBox(
          height: 20,
        ),
        currentWeatherMoreDetailWidget(weatherDataCurrent),
      ],
    );
  }
}

Widget currentWeatherMoreDetailWidget(WeatherDataCurrent weatherDataCurrent) {
  return Column(children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: CustomsColors.cardColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Image.asset("assets/icons/windspeed.png"),
        ),
        Container(
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: CustomsColors.cardColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Image.asset("assets/icons/clouds.png"),
        ),
        Container(
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: CustomsColors.cardColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Image.asset("assets/icons/humidity.png"),
        ),
      ],
    ),
    const SizedBox(
      height: 10,
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: 20,
          width: 60,
          child: Text(
            "${weatherDataCurrent.current.windSpeed}km/h",
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 20,
          width: 60,
          child: Text(
            "${weatherDataCurrent.current.clouds}%",
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 20,
          width: 60,
          child: Text(
            "${weatherDataCurrent.current.humidity}%",
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
        )
      ],
    ),
  ]);
}

Widget temperatureAreaWidget(WeatherDataCurrent weatherDataCurrent) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Image.asset(
        "assets/weather/${weatherDataCurrent.current.weather![0].icon}.png",
        height: 80,
        width: 80,
      ),
      Container(
        height: 50,
        width: 1,
        color: CustomsColors.dividerLine,
      ),
      RichText(
          text: TextSpan(children: [
        TextSpan(
            text: "${weatherDataCurrent.current.temp!.toInt()}°",
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 68,
              color: CustomsColors.textColorBlack,
            )),
        TextSpan(
            text: "${weatherDataCurrent.current.weather![0].description}",
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.grey,
            )),
      ]))
    ],
  );
}
