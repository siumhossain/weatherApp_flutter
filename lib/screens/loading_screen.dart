import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/services/weather.dart';

import 'package:weather_app/screens/location_screen.dart';
const apiKey = '07b9c43091e5a8fa3dbdb210c17b7c38';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
    //getData();
  }
  void getLocationData() async{
    var weatherData = await WeatherModel().getWeatherData();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather: weatherData,);
    }));

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitFadingCircle(
        color: Colors.greenAccent,
        size: 100.0,
        //duration: const Duration(milliseconds: 800),
      ),
    );
  }
}