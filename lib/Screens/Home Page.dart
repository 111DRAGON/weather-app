import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/Screens/weather%20screen.dart';
import 'package:weather_app/Services/weather_services.dart';
import 'package:weather_app/models/weather_model.dart';

class HomePageScreen extends StatelessWidget {
  late String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  const Text(
                    "Start Searching naw",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                  ),
                  Expanded(
                    child: IconButton(
                        onPressed: () {
                          Get.bottomSheet(Container(
                            height: 250,
                            decoration: BoxDecoration(
                                color: Get.isDarkMode
                                    ? const Color.fromRGBO(106, 84, 194, 1.0)
                                    : const Color.fromRGBO(1, 1, 1, 1),
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(40),
                                  topLeft: Radius.circular(40),
                                )),
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: TextField(
                                decoration: const InputDecoration(
                                    labelText: "Enter City Name",
                                    prefixIcon: Icon(Icons.location_city),
                                    border: OutlineInputBorder()),
                                onSubmitted: (data) async {
                                  cityName = data;
                                  WeatherService service = WeatherService();
                                  WeatherModel weather = await service
                                      .getWeather(cityName: cityName);
                              WeatherService().weatherModel = weather;
                                  print(weather);
                                  Get.to(WeatherScreen(),arguments: weather);
                                },
                              ),
                            ),
                          ));
                        },
                        icon: const Icon(
                          Icons.search,
                          size: 40,
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
