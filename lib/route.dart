// ignore_for_file: depend_on_referenced_packages

import 'package:get/get.dart';
import 'package:kids_bids/views/constants/string.dart';
import 'package:kids_bids/views/pages/game/game.dart';
import 'package:kids_bids/views/pages/home/home.dart';
import 'package:kids_bids/views/pages/login/login.dart';
import 'package:kids_bids/views/pages/math/math.dart';
import 'package:kids_bids/views/pages/painting/painting.dart';
import 'package:kids_bids/views/pages/video/video_page.dart';

class AppRoute {
  static List<GetPage<dynamic>> routes() {
    return [
      GetPage(name: initialRoute, page: () => const LoginPage()),
      GetPage(name: homeRoute, page: () => const HomePage()),
      GetPage(name: videoRoute, page: () => const VideoPage()),
      GetPage(name: gameRoute, page: () => const GamePlay()),
      GetPage(name: paintRoute, page: () => const PaintingPage()),
      GetPage(name: mathRoute, page: () => const MathPage()),
    ];
  }
}
