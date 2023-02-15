import 'package:flutter/material.dart';
import 'package:kids_bids/views/widgets/responsive.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
          mobile: Container(
            color: Colors.amber,
          ),
          tablet: Container(
            color: Colors.blue,
          ),
          desktop: Container(
            color: Colors.red,
          )),
    );
  }
}
