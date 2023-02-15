// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:kids_bids/route.dart';
import 'package:kids_bids/views/constants/string.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: initialRoute,
      getPages: AppRoute.routes(),
    );
  }
}
