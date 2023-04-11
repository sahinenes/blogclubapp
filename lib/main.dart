import 'core/constants/enums/preferences_keys.dart';
import 'views/add/article/view/add_artice.dart';
import 'views/authentication/view/authentication_view.dart';
import 'views/home/view/home_view.dart';
import 'views/onboarding/view/onboarding_view.dart';
import 'views/stories/view/stories_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/constants/app/app_constants.dart';
import 'core/init/cache/shared_preferences.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/notifier/provider_list.dart';
import 'core/init/notifier/theme_notifer.dart';

/*
 runApp(MultiProvider(
    providers: [...ApplicationProvider.instance.dependItems],
    child: EasyLocalization(
        path: ApplicationConstants.LANG_ASSET_PATH,
        supportedLocales: LanguageManager.instance.supportedLocales,
        startLocale: LanguageManager.instance.enLocale,
        child: const MyApp()),
  ));

*/
Future<void> main() async {
  await _init();
  runApp(MultiProvider(
      providers: [...ApplicationProvider.instance.dependItems],
      child: const MyApp()));
}

Future<void> _init() async {
  /*
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color.fromRGBO(245, 245, 245, 1),
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
    /*systemNavigationBarColor: Color(0xFFF8FDFF),
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarContrastEnforced: true,
      systemStatusBarContrastEnforced: true*/
  ));
*/
  WidgetsFlutterBinding.ensureInitialized();
  await LocaleManager.prefrencesInit();
  await EasyLocalization.ensureInitialized();

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: context.watch<ThemeNotifier>().currentTheme,
      debugShowCheckedModeBanner: ApplicationConstants.TEST_MODE,
      title: ApplicationConstants.APPLICATION_NAME,
      // localizationsDelegates: context.localizationDelegates,
      //  supportedLocales: context.supportedLocales,
      // locale: context.locale,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
      home: _home(),
    );
  }

  Widget _home() {
    if (!LocaleManager.instance.getBoolValue(PreferencesKeys.IS_FIRST_APP)) {
      return const OnboardingView();
    } else {
      return const AuthenticationView();
    }
  }
}


