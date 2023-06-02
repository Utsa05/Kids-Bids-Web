import 'package:kids_bids/models/banner.dart';
import 'package:kids_bids/models/item.dart';
import 'package:flutter/material.dart';
import 'package:kids_bids/models/math.dart';
import 'package:kids_bids/views/constants/color.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/chart_data.dart';

class LocalServer {
  static List<ItemModel> itemLists() {
    return [
      ItemModel(id: 1, title: "Orange", category: "Fruits", images: [
        ImageModel(title: "Apple", image: 'assets/fruits/apple.png'),
        ImageModel(title: "Orange", image: 'assets/fruits/orange.png')
      ]),
      ItemModel(id: 2, title: "Apple", category: "Fruits", images: [
        ImageModel(title: "Apple", image: 'assets/fruits/apple.png'),
        ImageModel(title: "Orange", image: 'assets/fruits/orange.png')
      ]),
      ItemModel(id: 3, title: "Banana", category: "Fruits", images: [
        ImageModel(title: "Apple", image: 'assets/fruits/apple.png'),
        ImageModel(title: "Orange", image: 'assets/fruits/orange.png')
      ]),
      ItemModel(id: 4, title: "Jack Fruits", category: "Fruits", images: [
        ImageModel(title: "Apple", image: 'assets/fruits/apple.png'),
        ImageModel(title: "Orange", image: 'assets/fruits/orange.png')
      ]),
      ItemModel(id: 5, title: "Pum", category: "Fruits", images: [
        ImageModel(title: "Apple", image: 'assets/fruits/apple.png'),
        ImageModel(title: "Orange", image: 'assets/fruits/orange.png')
      ]),
    ];
  }

  static List<ChartData> getPicData() {
    return [
      ChartData(
        tite: 'Quize',
        percentage: 20,
      ),
      ChartData(
        tite: 'Game',
        percentage: 20,
      ),
      ChartData(
        tite: 'Poem',
        percentage: 20,
      ),
      ChartData(
        tite: 'Video',
        percentage: 20,
      ),
      ChartData(
        tite: 'Paint',
        percentage: 20,
      ),
    ];
  }

  static List<BannerModel> getBanner() {
    return [
      BannerModel(
          image:
              "https://previews.123rf.com/images/vivbien/vivbien1807/vivbien180700010/105556394-learning-and-study-place-horizontal-back-banner-children-school-vector-background-flat-style.jpg"),
      BannerModel(
          image:
              "https://thumbs.dreamstime.com/b/paper-art-back-to-school-kids-school-education-concept-kids-go-to-school-banner-template-advertising-brochure-paper-cut-141791074.jpg"),
      BannerModel(
          image:
              "https://img.lovepik.com/background/20211022/small/lovepik-school-season-flat-cartoon-poster-banner-background-image_605654048.jpg"),
      BannerModel(
          image:
              "https://img.lovepik.com//back_pic/05/63/87/405b6056074ac17.jpg_wh860.jpg"),
      BannerModel(
          image:
              "https://img.lovepik.com/background/20211023/medium/lovepik-open-season-fresh-banner-background-image_605820711.jpg"),
    ];
  }

  static List<MathModel> getMathQuestionList() {
    return [
      MathModel(question: "4+5", ans: "9", options: [
        Option("2"),
        Option("4"),
        Option("9"),
      ]),
      MathModel(question: "5+5", ans: "10", options: [
        Option("2"),
        Option("10"),
        Option("9"),
      ]),
      MathModel(question: "4+4", ans: "8", options: [
        Option("2"),
        Option("8"),
        Option("9"),
      ]),
    ];
  }
}
