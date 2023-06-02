import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kids_bids/core/local_server.dart';
import 'package:kids_bids/models/item.dart';
import 'package:kids_bids/views/constants/color.dart';
import 'package:kids_bids/views/constants/string.dart';
import 'package:kids_bids/views/widgets/responsive.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
          mobile: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image/loginpage.png'),
                    fit: BoxFit.fill)),
          ),
          tablet: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image/loginbg.jpg'),
                    fit: BoxFit.fill)),
          ),
          desktop: const DesktopMode()),
    );
  }
}

class DesktopMode extends StatefulWidget {
  const DesktopMode({
    super.key,
  });

  @override
  State<DesktopMode> createState() => _DesktopModeState();
}

class _DesktopModeState extends State<DesktopMode> {
  final Random _random = Random();
  List<ItemModel> itemList = LocalServer.itemLists();
  late ItemModel item;
  late ImageModel image;

  getRandomItem() {
    item = itemList[_random.nextInt(itemList.length)];
    image = item.images[_random.nextInt(item.images.length)];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    getRandomItem();
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/image/loginbg.jpg'), fit: BoxFit.fill)),
      child: Stack(
        children: [
          Row(
            children: [
              Lottie.asset('assets/lotties/cathi.json', width: 200.0),
              Image.asset(
                'assets/items/welcome.png',
                width: 300.0,
              ),
            ],
          ),
          Positioned(
            left: -80.0,
            bottom: -120,
            child: Lottie.asset('assets/lotties/plumtree.json', width: 370.0),
          ),
          Positioned(
            left: 40.0,
            bottom: -200,
            child: Lottie.asset('assets/lotties/plumtree.json', width: 370.0),
          ),
          // Positioned(
          //   left: 190.0,
          //   bottom: -50,
          //   child: Lottie.asset('assets/lotties/tree.json', width: 250.0),
          // ),
          Container(
            margin: EdgeInsets.only(
                top: size.height * 0.137, left: size.width * 0.57),
            width: size.width * 0.8,
            //color: Colors.amber.withOpacity(0.5),
            height: 400.0,
            child: Stack(
              children: [
                // Image.asset(
                //   'assets/shape/chooieboard.png',
                //   width: size.width * 0.4,
                //   height: size.height * 0.48,
                // ),
                Positioned(
                  top: -size.height * 0.1,
                  left: -size.width * 0.01,
                  child: Image.asset(
                    'assets/logo/logo.png',
                    width: size.width * 0.4,
                    height: size.height * 0.48,
                  ),
                ),
                Positioned(
                  top: 160,
                  left: 90,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    height: 260,
                    width: 320,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: Colors.amber),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(15)),
                          child: const TextField(
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 20),
                                hintText: "Enter Baby Name",
                                hintStyle: TextStyle(color: Colors.white),
                                border: InputBorder.none),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(15)),
                          child: const TextField(
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 20),
                                hintText: "Enter Baby Age",
                                hintStyle: TextStyle(color: Colors.white),
                                border: InputBorder.none),
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        MaterialButton(
                          color: Colors.indigo,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          onPressed: () {
                            Get.toNamed(homeRoute);
                          },
                          child: const Text(
                            "SignUp",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Already Have Account? ",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.amber,
                                  fontWeight: FontWeight.normal),
                            ),
                            Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.pink,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
                // Container(
                //     width: size.width * 0.8,
                //     margin: EdgeInsets.only(
                //         top: size.height * 0.21, left: size.width * 0.07),
                //     child: Text('Choose ${item.title} To Login')),
                // Container(
                //   height: 60.0,
                //   width: 100.0,
                //   margin: EdgeInsets.only(
                //       top: size.height * 0.35, left: size.width * 0.06),
                //   child: Image.asset(
                //     item.images[1].image,
                //   ),
                // ),
                // Container(
                //     height: 60.0,
                //     width: 100.0,
                //     margin: EdgeInsets.only(
                //         top: size.height * 0.35, left: size.width * 0.213),
                //     child: Image.asset(
                //       item.images[0].image,
                //     )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
