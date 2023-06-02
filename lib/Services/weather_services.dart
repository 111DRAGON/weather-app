import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../models/weather_model.dart';

class WeatherService extends GetxController{
  WeatherModel? weatherModel;

  Future<WeatherModel> getWeather({required String cityName}) async {
    var baseUrl = "http://api.weatherapi.com/v1";
    var apikey = "3923a19e8fb64dff92f170348231703";
    Uri url = Uri.parse('$baseUrl/forecast.json?key=$apikey&q=$cityName=7');
    http.Response response = await http.get(url);
    dynamic data = jsonDecode(response.body);
    WeatherModel weather =WeatherModel.fromJason(data);
    return weather;
  }
}
