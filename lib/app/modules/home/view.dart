import 'package:flutter/material.dart';
import 'package:flutter_project/app/modules/home/controller.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return const Scaffold(
        body: Center(
          child: Text('Hello World'),
        ),
        backgroundColor: Colors.white,
      );
    });
  }
}
