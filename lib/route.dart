// ignore_for_file: depend_on_referenced_packages

import 'package:get/get.dart';
import 'package:kids_bids/views/constants/string.dart';
import 'package:kids_bids/views/pages/home/home.dart';
import 'package:kids_bids/views/pages/login/login.dart';

class AppRoute {
  static List<GetPage<dynamic>> routes() {
    return [
      GetPage(name: initialRoute, page: () => const HomePage()),
      GetPage(name: loginRoute, page: () => const LoginPage()),
    ];
  }
}
