import 'package:get/get.dart';

import '../controllers/latest_news_controller.dart';

class LatestNewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LatestNewsController>(
      () => LatestNewsController(),
    );
  }
}
