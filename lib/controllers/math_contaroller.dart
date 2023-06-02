import 'package:get/get.dart';
import 'package:kids_bids/core/local_server.dart';
import 'package:kids_bids/models/math.dart';

class MathController extends GetxController {
  var quizeList = <MathModel>[].obs;
  var wrongList = <MathModel>[].obs;
  var correctList = <MathModel>[].obs;
  var currentindex = 0.obs;
  var currentItem = MathModel(question: '', ans: '', options: []).obs;
  var isCorrect = false.obs;

  RxBool checkAns(String ans, String option) {
    if (ans == option) {
      return true.obs;
    } else {
      return false.obs;
    }
  }

  getCurrentItem() {
    currentItem.value = quizeList[currentindex.value];
  }

  @override
  void onInit() {
    currentindex.value = 0;

    quizeList.value = LocalServer.getMathQuestionList();
    getCurrentItem();
    super.onInit();
  }
}
