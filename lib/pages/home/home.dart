import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              getWheatherUpdate();
            },
            child: const Text('Get Data'),
          ),
        ),
      ),
    );
  }

  void getWheatherUpdate() async {
    Dio dio = Dio();

    try {
      var response = await dio.get(
        'http://api.weatherapi.com/v1/current.json?key=62c2b30e85374cebadb231056242610&q=Mumbai',
      );

      print(response.data);
      print(response.data.runtimeType);
    } on DioException catch (e) {
      print(e);
    } on Exception catch (e) {
      print(e);
    }
  }
}
