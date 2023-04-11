import '../../home/view_models/home_view_model.dart';
import '../view_models/navigation_view_model.dart';

class NavigationController {
  NavigationController._init();
  static NavigationController? _instance;
  static NavigationController get instance {
    _instance ??= NavigationController._init();
    return _instance!;
  }

  NavigationViewModel navigationViewModel = NavigationViewModel();
}