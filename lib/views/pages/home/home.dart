import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kids_bids/core/local_server.dart';
import 'package:kids_bids/models/item.dart';
import 'package:kids_bids/views/constants/color.dart';
import 'package:kids_bids/views/widgets/hover_item.dart';
import 'package:kids_bids/views/widgets/responsive.dart';
import 'package:lottie/lottie.dart';
import 'package:lottie/lottie.dart';

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
                const HoverItem(child: TopItem()),
                const SizedBox(
                  width: 20.0,
                ),
                const HoverItem(child: TopItem()),
                const SizedBox(
                  width: 20.0,
                ),
                const HoverItem(child: TopItem()),
                const SizedBox(
                  width: 20.0,
                ),
                const HoverItem(child: TopItem()),
                const Expanded(child: SizedBox()),
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
    return Container(
      margin:
          EdgeInsets.only(left: size.width * 0.015, top: size.height * 0.152),
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
      width: size.width * 0.685,
      height: size.height * 0.54,
      //color: Colors.blue.withOpacity(0.2),
      child: Row(
        children: [
          const Expanded(child: SizedBox()),
          SizedBox(
            width: 350.0,
            height: size.height * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    HoverItem(
                      child: Item(),
                    ),
                    HoverItem(
                      child: Item(),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    HoverItem(
                      child: Item(),
                    ),
                    HoverItem(
                      child: Item(),
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
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 165.0,
      width: 165.0,
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: purpleColor,
          border: Border.all(width: 2.0, color: amberColor)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/items/letter.png',
            width: 130.0,
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Expanded(child: SizedBox()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                "Word",
                style: TextStyle(color: Colors.white),
              ),
              CircleAvatar(
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
    );
  }
}

class TopItem extends StatelessWidget {
  const TopItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          const Text(
            "Quize",
            style: TextStyle(color: Colors.black),
          ),
          const SizedBox(
            width: 8.0,
          ),
          Image.asset(
            'assets/items/letter.png',
            width: 50.0,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}
