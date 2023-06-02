// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kids_bids/route.dart';
import 'package:kids_bids/views/constants/color.dart';
import 'package:kids_bids/views/constants/string.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
          useMaterial3: true,
          primarySwatch: Colors.indigo,
          textTheme: TextTheme(
            bodySmall:
                GoogleFonts.bubblegumSans(fontSize: 20, color: titleColor),
            bodyMedium: GoogleFonts.bubblegumSans(
                fontSize: 30, color: titleColor, fontWeight: FontWeight.w500),
          )),
      initialRoute: initialRoute,
      getPages: AppRoute.routes(),
    );
  }
}
