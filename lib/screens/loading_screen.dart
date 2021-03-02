import 'package:flutter/material.dart';

import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';

const apiKey = '07b9c43091e5a8fa3dbdb210c17b7c38';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;
  @override
  void initState() {
    super.initState();
    getLocationData();
    //getData();
  }
  void getLocationData() async{
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    print(latitude);
    print(longitude);
    NetworkHelper networkHelper = NetworkHelper('http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');


    var weatherData = await networkHelper.getData();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}