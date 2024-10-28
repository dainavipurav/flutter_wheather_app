import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wheather_app/core/dio_client.dart';
import 'package:wheather_app/env/env.dart';
import 'package:wheather_app/utils/utils.dart';

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
    try {
      var response = await DioClient().dio.get(
        ApiEndPoints.currentWheather,
        queryParameters: {
          'key': Env.apiKey,
          'q': 'Mumbai',
        },
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
