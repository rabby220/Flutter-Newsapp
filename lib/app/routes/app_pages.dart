import 'package:get/get.dart';

import '../modules/latestNews/bindings/latest_news_binding.dart';
import '../modules/latestNews/views/latest_news_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LATEST_NEWS;

  static final routes = [
    GetPage(
      name: _Paths.LATEST_NEWS,
      page: () => const LatestNewsView(),
      binding: LatestNewsBinding(),
    ),
  ];
}
