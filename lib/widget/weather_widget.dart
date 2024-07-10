import 'package:flutter/material.dart';

Widget weatherForecast() {
  List<Map<String, dynamic>> weatherData = [
    {"date": "Mar 31", "day": "Thursday", "temperature": "25°C", "condition": "sunny"},
    {"date": "Apr 1", "day": "Friday", "temperature": "27°C", "condition": "cloudy"},
    {"date": "Apr 2", "day": "Saturday", "temperature": "26°C", "condition": "rainy"},
    {"date": "Apr 3", "day": "Sunday", "temperature": "16°C", "condition": "stormy"},
    {"date": "Apr 4", "day": "Monday", "temperature": "20°C", "condition": "windy"},
  ];

  IconData getWeatherIcon(String temperature) {
    switch (temperature) {
      case "27°C":
        return Icons.wb_sunny;
      case "20°C":
        return Icons.cloud;
      case "26°C":
        return Icons.wb_sunny;
      case "16°C":
        return Icons.cloud;
      case "25°C":
        return Icons.wb_sunny;
      default:
        return Icons.error;
    }
  }

  Color getWeatherColor(String temperature) {
    return temperature == "27°C" || temperature == "26°C" || temperature == "25°C" ? Color.fromARGB(255, 235, 149, 50) : Colors.blue;
  }

  return Container(
    
    height: 120,
    
    
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: weatherData.length,
      itemBuilder: (BuildContext context, int index) {
        String temperature = weatherData[index]['temperature'];
        return Container(
          
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Color.fromRGBO(200, 202, 240, 0.425),
          ),
          child: Container(
            width: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  getWeatherIcon(temperature),
                  size: 30,
                  color: getWeatherColor(temperature),
                ),
                SizedBox(height: 5),
                Text(
                  weatherData[index]['date'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(weatherData[index]['day']),
                Text(temperature),
              ],
            ),
          ),
        );
      },
    ),
  );
}
