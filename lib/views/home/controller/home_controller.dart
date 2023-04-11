import '../view_models/home_view_model.dart';

class HomeController {
  HomeController._init();
  static HomeController? _instance;
  static HomeController get instance {
    _instance ??= HomeController._init();
    return _instance!;
  }

  HomeViewModel homeViewModel = HomeViewModel();
}