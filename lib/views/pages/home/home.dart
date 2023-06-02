// ignore_for_file: depend_on_referenced_packages

import 'dart:math';
import 'package:kids_bids/models/banner.dart';
import 'package:kids_bids/views/constants/string.dart';
import 'dart:math' as math;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kids_bids/views/pages/game/game.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:kids_bids/core/local_server.dart';
import 'package:kids_bids/models/item.dart';
import 'package:kids_bids/views/constants/color.dart';
import 'package:kids_bids/views/widgets/hover_item.dart';
import 'package:kids_bids/views/widgets/responsive.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
              image: AssetImage('assets/image/homewithboard.png'),
              fit: BoxFit.fill)),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10.0, left: 20.0),
            width: size.width,
            height: 100.0,
            // color: Colors.amber.withOpacity(0.3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset("assets/lotties/cathi.json"),
                Image.asset("assets/logo/logo.png"),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/icon/dimond.png",
                        height: 50.0,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      const Text("100")
                    ],
                  ),
                ),
                HoverItem(
                    child: TopItem(
                  tap: () {},
                  title: "Quize",
                  image: 'assets/icon/quize.png',
                )),
                const SizedBox(
                  width: 20.0,
                ),
                HoverItem(
                    child: TopItem(
                  tap: () {
                    Get.toNamed(gameRoute);
                  },
                  title: "Game",
                  image: "assets/icon/game.png",
                )),
                const SizedBox(
                  width: 20.0,
                ),
                HoverItem(
                    child: TopItem(
                  tap: () {
                    Get.toNamed(videoRoute);
                  },
                  title: "Videos",
                  image: "assets/icon/video.png",
                )),
                const Expanded(child: SizedBox()),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  width: 45.0,
                  height: 45.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(width: 2.0, color: titleColor)),
                  child: const Icon(
                    Icons.logout_outlined,
                    color: titleColor,
                  ),
                ),
                const SizedBox(
                  width: 50,
                )
              ],
            ),
          ),
          Bord(size: size)
        ],
      ),
    );
  }
}

class Bord extends StatelessWidget {
  const Bord({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    final dataMap = <String, double>{
      "Quize": 5,
      "Game": 5,
      "Video": 5,
      "Poem": 5,
    };

    final colorList = <Color>[
      Colors.greenAccent,
      Colors.red,
      Colors.amber,
      Colors.purple,
    ];
    return Container(
      margin:
          EdgeInsets.only(left: size.width * 0.015, top: size.height * 0.152),
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
      width: size.width * 0.685,
      height: size.height * 0.54,
      //color: Colors.blue.withOpacity(0.2),
      child: Row(
        children: [
          Expanded(
              child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  right: 14,
                ),
                width: double.infinity,
                height: 150.0,
                child: Row(
                  children: [
                    Container(
                      height: 130,
                      width: 130,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/shape/emptyboard.png'))),
                      child: Center(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Tusday",
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            "5-30-2023",
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      )),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 130,
                      width: 130,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/shape/circle.png'))),
                      child: const Center(child: Text("50%")),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 115,
                      child: PieChart(
                        chartLegendSpacing: 10,
                        dataMap: dataMap,
                        chartType: ChartType.disc,
                        colorList: colorList,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 20),
                child: CarouselSlider(
                  options: CarouselOptions(height: 200.0, autoPlay: true),
                  items: LocalServer.getBanner().map((i) {
                    BannerModel imageModel = i;
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          margin: const EdgeInsets.only(right: 10),
                          height: 200.0,
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(imageModel.image),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(10.0),
                              color: purpleColor,
                              border:
                                  Border.all(width: 2.0, color: amberColor)),
                        );
                      },
                    );
                  }).toList(),
                ),
              )
            ],
          )),
          SizedBox(
            width: 350.0,
            height: size.height * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HoverItem(
                      child: Item(
                        color: telColor,
                        image: 'assets/icon/math.png',
                        tap: () {
                          Get.toNamed(mathRoute);
                        },
                        title: 'Math',
                      ),
                    ),
                    HoverItem(
                      child: Item(
                        color: amberColor,
                        image: 'assets/items/letter.png',
                        tap: () {},
                        title: 'Words',
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HoverItem(
                      child: Item(
                        color: titleColor,
                        image: 'assets/icon/poem.png',
                        tap: () {},
                        title: 'Poems',
                      ),
                    ),
                    HoverItem(
                      child: Item(
                        color: purpleColor,
                        image: 'assets/icon/painting.png',
                        tap: () {
                          Get.toNamed(paintRoute);
                        },
                        title: 'Draw',
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Item extends StatelessWidget {
  const Item({
    super.key,
    required this.title,
    required this.image,
    required this.tap,
    required this.color,
  });
  final String title;
  final String image;
  final Color color;
  final GestureTapCallback tap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        height: 165.0,
        width: 165.0,
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: color,
            border: Border.all(width: 2.0, color: amberColor)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 130.0,
              height: 60,
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white),
                ),
                const CircleAvatar(
                  backgroundColor: amberColor,
                  radius: 16.0,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TopItem extends StatelessWidget {
  const TopItem({
    super.key,
    required this.title,
    required this.image,
    required this.tap,
  });

  final String title;
  final String image;
  final GestureTapCallback tap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        width: 160.0,
        height: 65.0,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(width: 2.0, color: Colors.blue)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Image.asset(
              image,
              width: 50.0,
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}
