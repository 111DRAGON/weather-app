

class WeatherModel {
  String date;
  String weatherStateName;
  double temp;
  double maxTemp;
  double minTemp;
  String icon;
  String cityName;
  WeatherModel({
    required this.date,
    required this.weatherStateName,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.icon,
    required this.cityName
  });

  factory WeatherModel.fromJason(dynamic data) {
    var jsonData = data["forecast"]["forecastday"][0]["day"];
    return WeatherModel(
      cityName: data['location']['name'],
      icon:  jsonData['condition']['icon'],
        date: data["location"]["localtime"],
        weatherStateName: jsonData["condition"]["text"],
        temp: jsonData["avgtemp_c"],
        maxTemp: jsonData["maxtemp_c"],
        minTemp: jsonData["mintemp_c"]);
  }
  @override
  String toString() {
    return "temp = $temp  minTemp= $maxTemp  maxTemp = $maxTemp   date = $date";
  }
}
