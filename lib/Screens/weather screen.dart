import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/Services/weather_services.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherScreen extends StatelessWidget {
  WeatherService controller = Get.put(WeatherService());

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)!.settings.arguments as WeatherModel;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              model.cityName.toString(),
              style: const TextStyle(
                  fontSize: 50, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              model.date.toString(),
              style:
              const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Image.network("https:${model.icon}",),
                    const SizedBox(
                      width: 40,
                    ),
                    Text(
                     model.temp.toString(),
                      style: const TextStyle(
                          fontSize: 45, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 35,
                    ),
                    Column(
                      children: [
                        Row(
                          children:  [
                            const Text(
                              "Max Temp",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              model.maxTemp.toString(),
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children:  [
                            const Text(
                              "Min Temp",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              model.minTemp.toString(),
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
             Text(
                model.weatherStateName.toString(),
              style:
              TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
