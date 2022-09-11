import 'package:flutter_project/app/modules/home/binding.dart';
import 'package:flutter_project/app/modules/home/view.dart';
import 'package:get/get.dart';

part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}