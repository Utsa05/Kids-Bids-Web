import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kids_bids/controllers/math_contaroller.dart';

import '../../constants/color.dart';
import 'package:get/get.dart';

class MathPage extends StatefulWidget {
  const MathPage({Key? key}) : super(key: key);

  @override
  State<MathPage> createState() => _MathPageState();
}

class _MathPageState extends State<MathPage> {
  final MathController controller = Get.put(MathController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Image.asset("assets/icon/back.png")),
        ),
        title: Row(
          children: [
            Text(
              "Play With Math",
              style: GoogleFonts.bubblegumSans(
                  fontSize: 30, color: amberColor, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              width: 15,
            ),
            Stack(
              children: [
                Image.asset(
                  'assets/image/timer.png',
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15),
                  child: Center(
                    child: Text(
                      "3s",
                      style: GoogleFonts.bubblegumSans(
                          fontSize: 24,
                          color: titleColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 15,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: titleColor),
                  color: greenColor,
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  Image.asset(
                    "assets/icon/dimond.png",
                    height: 35.0,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "100",
                    style: GoogleFonts.bubblegumSans(
                        fontSize: 24,
                        color: amberColor,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/image/playbg.png'),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(100.0),
          child: Row(
            children: [
              Stack(
                children: [
                  Image.asset("assets/image/math_board.png"),
                  Container(
                    margin: const EdgeInsets.only(left: 10, top: 30),
                    width: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(() {
                          return Text(
                            controller.currentItem.value.question,
                            style: GoogleFonts.bubblegumSans(
                                fontSize: 40,
                                color: titleColor,
                                fontWeight: FontWeight.w500),
                          );
                        }),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: List.generate(
                            controller.quizeList[controller.currentindex.value]
                                .options.length,
                            (index) => Obx(() {
                              return QuizeOption(
                                tap: () {
                                  print("tap");
                                  if (controller
                                          .checkAns(
                                              controller
                                                  .quizeList[controller
                                                      .currentindex.value]
                                                  .ans,
                                              controller
                                                  .quizeList[controller
                                                      .currentindex.value]
                                                  .options[index]
                                                  .option)
                                          .value ==
                                      true) {
                                    controller.isCorrect.value = true;
                                  } else {
                                    controller.isCorrect.value = false;
                                  }
                                },
                                color: controller.isCorrect.value == true
                                    ? Colors.green
                                    : amberColor,
                                text: controller
                                    .quizeList[controller.currentindex.value]
                                    .options[index]
                                    .option,
                              );
                            }),
                          ).toList(),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 00),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/image/boy.png",
                      height: 350,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (controller.quizeList.length - 1 >=
                            controller.currentindex.value + 1) {
                          controller.currentindex.value++;
                          controller.getCurrentItem();
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Not Have More Question"),
                            backgroundColor: Colors.red,
                          ));
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: telColor),
                            color: amberColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          "      Next      ",
                          style: GoogleFonts.bubblegumSans(
                              fontSize: 25,
                              color: titleColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 40),
                padding: const EdgeInsets.all(12),
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Quize Statistic",
                      style: GoogleFonts.bubblegumSans(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Total Question: 20",
                      style: GoogleFonts.bubblegumSans(
                          fontSize: 18,
                          color: amberColor,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Wrong: 0",
                      style: GoogleFonts.bubblegumSans(
                          fontSize: 18,
                          color: titleColor,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Collect: 1",
                      style: GoogleFonts.bubblegumSans(
                          fontSize: 18,
                          color: greenColor,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class QuizeOption extends StatelessWidget {
  const QuizeOption({
    super.key,
    required this.color,
    required this.text,
    required this.tap,
  });
  final Color color;
  final String text;
  final GestureDoubleTapCallback tap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        width: 140,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: telColor),
            color: color,
            borderRadius: BorderRadius.circular(8)),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.bubblegumSans(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
