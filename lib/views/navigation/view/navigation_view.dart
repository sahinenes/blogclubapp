import '../../../core/base/state/base_state.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/constants/image/image_constants.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../../add/article/view/add_artice.dart';
import '../../article/view/article_view.dart';
import '../../authentication/view/authentication_view.dart';
import '../../home/controller/home_controller.dart';
import '../../home/view/home_view.dart';
import '../../home/view_models/home_view_model.dart';
import '../controller/navigation_controller.dart';
import '../../stories/view/stories_view.dart';
import '../../../widgets/image/image_widget.dart';
import '../../../widgets/text/text_body_widget.dart';
import '../../../widgets/text/text_title_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../view_models/navigation_view_model.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  List<Widget> body = const [
    HomeView(),
    HomeView(),
    AddArticleView(),
    HomeView(),
    HomeView(),
  ];
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: NavigationController.instance.navigationViewModel,
      onModelReady: (NavigationViewModel model) {},
      onPageBuilder: (BuildContext context, NavigationViewModel model) {
        return SafeArea(child: _scaffold(context, model));
      },
    );
  }

  Scaffold _scaffold(BuildContext context, NavigationViewModel model) {
    return Scaffold(
      bottomNavigationBar: navigationBarWidget(context, model),
      body: Padding(
          padding: context.paddingNormal, child: body[model.currentPageIndex]),
    );
  }

  NavigationBar navigationBarWidget(
      BuildContext context, NavigationViewModel model) {
    return NavigationBar(
      elevation: 0,
      selectedIndex: model.currentPageIndex,
      onDestinationSelected: ((value) {
        setState(() {});
        model.currentPageIndex = value;
      }),
      destinations: <Widget>[
        NavigationDestination(
          icon: Icon(FontAwesomeIcons.home,
              color: context.theme.colorScheme.onSurfaceVariant),
          selectedIcon: Icon(FontAwesomeIcons.home,
              color: context.theme.colorScheme.secondary),
          label: "Home",
        ),
        NavigationDestination(
          icon: Icon(Icons.menu_book_sharp,
              color: context.theme.colorScheme.onSurfaceVariant),
          selectedIcon: Icon(Icons.business_center_outlined,
              color: context.theme.colorScheme.secondary),
          label: "Article",
        ),
        NavigationDestination(
          icon: Container(
            width: context.width * 0.15,
            height: context.width * 0.15,
            decoration: BoxDecoration(
                color: context.theme.colorScheme.secondary,
                borderRadius: BorderRadius.circular(context.borderRadius * 3)),
            child: Icon(
              Icons.add,
              color: context.theme.colorScheme.background,
              size: 48,
            ),
          ),
          selectedIcon: Container(
            width: context.width * 0.15,
            height: context.width * 0.15,
            decoration: BoxDecoration(
                color: context.theme.colorScheme.secondary,
                borderRadius: BorderRadius.circular(context.borderRadius * 3)),
            child: Icon(
              Icons.add,
              color: context.theme.colorScheme.background,
              size: 48,
            ),
          ),
          label: "",
        ),
        NavigationDestination(
          icon: Icon(Icons.search,
              color: context.theme.colorScheme.onSurfaceVariant),
          selectedIcon:
              Icon(Icons.search, color: context.theme.colorScheme.secondary),
          label: "Search",
        ),
        NavigationDestination(
          icon: Icon(Icons.menu,
              color: context.theme.colorScheme.onSurfaceVariant),
          selectedIcon:
              Icon(Icons.menu, color: context.theme.colorScheme.secondary),
          label: "Menu",
        ),
      ],
    );
  }
}
