import '../../../views/add/article/view/add_artice.dart';
import '../../../views/article/view/article_view.dart';
import '../../../views/authentication/view/authentication_view.dart';
import '../../../views/home/view/home_view.dart';
import '../../../views/navigation/view/navigation_view.dart';
import '../../../views/stories/view/stories_view.dart';

import '../../../widgets/logo/logo_widget.dart';
import 'package:flutter/material.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  NavigationRoute._init();
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.HOME:
        return normalNavigate(const HomeView(), NavigationConstants.HOME);

      case NavigationConstants.STORIES:
        return normalNavigate(const StoriesView(), NavigationConstants.STORIES);
      case NavigationConstants.ARTICLE:
        return normalNavigate(const ArticleView(), NavigationConstants.ARTICLE);
      case NavigationConstants.ADD_ARTICLE:
        return normalNavigate(
            const AddArticleView(), NavigationConstants.ADD_ARTICLE);
      case NavigationConstants.AUTHENTICATION:
        return normalNavigate(
            const AuthenticationView(), NavigationConstants.ADD_ARTICLE);
      case NavigationConstants.NAVIGATION:
        return normalNavigate(
            const NavigationView(), NavigationConstants.NAVIGATION);
      default:
        return MaterialPageRoute(
          builder: (context) => const NavigationView(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
      builder: (context) => widget,
      //analytciste görülecek olan sayfa ismi için pageName veriyoruz
      settings: RouteSettings(name: pageName),
    );
  }
}
