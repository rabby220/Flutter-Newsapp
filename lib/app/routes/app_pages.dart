import 'package:get/get.dart';

import '../modules/latestNews/bindings/latest_news_binding.dart';
import '../modules/latestNews/views/latest_news_view.dart';
import '../modules/searchBar/bindings/search_bar_binding.dart';
import '../modules/searchBar/views/search_bar_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SEARCH_BAR;

  static final routes = [
    GetPage(
      name: _Paths.LATEST_NEWS,
      page: () => const LatestNewsView(),
      binding: LatestNewsBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_BAR,
      page: () => const SearchBarView(),
      binding: SearchBarBinding(),
    ),
  ];
}
