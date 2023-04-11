import '../../../core/base/view/base_view.dart';
import '../../../core/constants/image/image_constants.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../view_models/authentication_view_model.dart';
import '../../../widgets/image/image_widget.dart';
import '../../../widgets/text/text_body_widget.dart';
import '../../../widgets/text/text_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../core/constants/app/app_constants.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../widgets/logo/logo_widget.dart';
import '../controller/authentication_controller.dart';

class AuthenticationView extends StatelessWidget {
  const AuthenticationView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BaseView(
        viewModel: AuthenticationController.instance.authenticationViewModel,
        onModelReady: (AuthenticationViewModel model) {
          model.init();
        },
        onPageBuilder: (BuildContext context, AuthenticationViewModel model) =>
            _scaffold(context, model),
      ),
    );
  }

  Scaffold _scaffold(BuildContext context, AuthenticationViewModel model) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: context.height * 0.05,
          ),
          const Hero(tag: "logo", child: LogoWidget()),
          SizedBox(
            height: context.height * 0.05,
          ),
          Expanded(
            child: Card(
              color: context.theme.colorScheme.secondary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(context.borderRadius * 2),
                      topRight: Radius.circular(context.borderRadius * 2))),
              margin: EdgeInsets.zero,
              child: Column(children: [
                _titles(context, model),
                Expanded(
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: model.pageController,
                    onPageChanged: (int page) {
                      model.changePageIndex(page);
                    },
                    children: [_login(context, model), _signUp(context, model)],
                  ),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }

  Widget _titles(BuildContext context, AuthenticationViewModel model) {
    return Padding(
      padding: context.paddingNormalVertical,
      child: Observer(
        builder: (_) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  model.pageController.previousPage(
                      duration: context.normalDuration, curve: Curves.ease);
                },
                child: TextTitleWidget(
                  text: "LOGIN",
                  style: context.textStyleTitle.copyWith(
                    color: model.currentPageIndex == 0
                        ? context.theme.colorScheme.background
                        : context.theme.colorScheme.outline,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  model.pageController.nextPage(
                      duration: context.normalDuration, curve: Curves.ease);
                },
                child: TextTitleWidget(
                    text: "SIGN UP",
                    style: context.textStyleTitle.copyWith(
                      color: model.currentPageIndex == 1
                          ? context.theme.colorScheme.background
                          : context.theme.colorScheme.outline,
                    )),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _signUp(BuildContext context, AuthenticationViewModel model) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(context.borderRadius * 2),
              topRight: Radius.circular(context.borderRadius * 2))),
      margin: EdgeInsets.zero,
      color: context.theme.colorScheme.background,
      child: Padding(
        padding: context.paddingNormal,
        child: SingleChildScrollView(
          child: Observer(
            builder: (_) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextTitleWidget(text: "Welcome"),
                    TextBodyWidget(
                      text: "Sign Up to BLOG CLUB",
                      style: context.textStyleBody
                          .copyWith(color: context.theme.colorScheme.outline),
                    ),
                    SizedBox(
                      height: context.height * 0.03,
                    ),
                    const TextBodyWidget(
                      text: "Username",
                    ),
                    TextField(
                      autofocus: false,
                      style: context.textStyleBody,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          hintText: "Write your username",
                          disabledBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                    const TextBodyWidget(
                      text: "Email",
                    ),
                    TextField(
                      autofocus: false,
                      style: context.textStyleBody,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          hintText: "Write your email.",
                          disabledBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                    const TextBodyWidget(
                      text: "Password",
                    ),
                    TextField(
                      autofocus: false,
                      obscureText: !model.showPasswords,
                      enableSuggestions: false,
                      autocorrect: false,
                      style: context.textStyleBody,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          suffixIcon: Padding(
                            padding: context.paddingNormal,
                            child: TextButton(
                              onPressed: () {
                                model.showPasswords = !model.showPasswords;
                              },
                              child: TextBodyWidget(
                                text: "Show",
                                style: context.textStyleBody.copyWith(
                                    color: context.theme.colorScheme.secondary),
                              ),
                            ),
                          ),
                          hintText: "Write your password.",
                          disabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none)),
                    ),
                    const TextBodyWidget(
                      text: "Password",
                    ),
                    TextField(
                      autofocus: false,
                      obscureText: !model.showPasswords,
                      enableSuggestions: false,
                      autocorrect: false,
                      style: context.textStyleBody,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          suffixIcon: Padding(
                            padding: context.paddingNormal,
                            child: TextButton(
                              onPressed: () {
                                model.showPasswords = !model.showPasswords;
                              },
                              child: TextBodyWidget(
                                text: "Show",
                                style: context.textStyleBody.copyWith(
                                    color: context.theme.colorScheme.secondary),
                              ),
                            ),
                          ),
                          hintText: "Write your password again.",
                          disabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none)),
                    ),
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    Center(
                      child: SizedBox(
                        width: context.width * 0.9,
                        height: context.height * 0.07,
                        child: TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  context.theme.colorScheme.secondary),
                            ),
                            onPressed: () {},
                            child: TextTitleWidget(
                              text: 'SIGN UP',
                              style: context.textStyleTitle.copyWith(
                                  color: context.theme.colorScheme.background),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextBodyWidget(text: "Do you already have an account?"),
                        TextButton(
                          onPressed: () {
                            model.pageController.previousPage(
                                duration: context.normalDuration,
                                curve: Curves.ease);
                          },
                          child: TextBodyWidget(
                            text: "  Login",
                            style: context.textStyleBody.copyWith(
                                color: context.theme.colorScheme.secondary),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: context.height * 0.04,
                    ),
                    Center(
                      child: TextBodyWidget(
                        text: "OR SIGN UP WITH",
                        style: context.textStyleBody.copyWith(letterSpacing: 2),
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.03,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ImageWidget(
                          image: ImageConstants.instance.iconGoogle,
                          widthFactor: 0.1,
                          heightFactor: 0.1,
                        ),
                        ImageWidget(
                          image: ImageConstants.instance.iconFacebook,
                          widthFactor: 0.1,
                          heightFactor: 0.1,
                        ),
                        ImageWidget(
                          image: ImageConstants.instance.iconTwitter,
                          widthFactor: 0.1,
                          heightFactor: 0.1,
                        )
                      ],
                    )
                  ]);
            },
          ),
        ),
      ),
    );
  }

  Widget _login(BuildContext context, AuthenticationViewModel model) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(context.borderRadius * 2),
              topRight: Radius.circular(context.borderRadius * 2))),
      margin: EdgeInsets.zero,
      color: context.theme.colorScheme.background,
      child: Padding(
        padding: context.paddingNormal,
        child: SingleChildScrollView(child: Observer(
          builder: (_) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextTitleWidget(text: "Welcome Back"),
                  TextBodyWidget(
                    text: "Sign in with your account",
                    style: context.textStyleBody
                        .copyWith(color: context.theme.colorScheme.outline),
                  ),
                  SizedBox(
                    height: context.height * 0.03,
                  ),
                  const TextBodyWidget(
                    text: "Username",
                  ),
                  TextField(
                    autofocus: false,
                    style: context.textStyleBody,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        hintText: "Write your username or email.",
                        disabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                  ),
                  const TextBodyWidget(
                    text: "Password",
                  ),
                  TextField(
                    autofocus: false,
                    obscureText: !model.showPasswords,
                    enableSuggestions: false,
                    autocorrect: false,
                    style: context.textStyleBody,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        suffixIcon: Padding(
                          padding: context.paddingNormal,
                          child: TextButton(
                            onPressed: () {
                              model.showPasswords = !model.showPasswords;
                            },
                            child: TextBodyWidget(
                              text: "Show",
                              style: context.textStyleBody.copyWith(
                                  color: context.theme.colorScheme.secondary),
                            ),
                          ),
                        ),
                        hintText: "Write your password.",
                        disabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none)),
                  ),
                  SizedBox(
                    height: context.height * 0.02,
                  ),
                  Center(
                    child: SizedBox(
                      width: context.width * 0.9,
                      height: context.height * 0.07,
                      child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                context.theme.colorScheme.secondary),
                          ),
                          onPressed: () {
                            NavigationService.instance.navigateToPage(
                                path: NavigationConstants.NAVIGATION);
                          },
                          child: TextTitleWidget(
                            text: 'LOGIN',
                            style: context.textStyleTitle.copyWith(
                                color: context.theme.colorScheme.background),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: context.height * 0.02,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextBodyWidget(text: "Forgot your password?"),
                      TextBodyWidget(
                        text: "  Reset here",
                        style: context.textStyleBody.copyWith(
                            color: context.theme.colorScheme.secondary),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.height * 0.04,
                  ),
                  Center(
                    child: TextBodyWidget(
                      text: "OR SIGN IN WITH",
                      style: context.textStyleBody.copyWith(letterSpacing: 2),
                    ),
                  ),
                  SizedBox(
                    height: context.height * 0.03,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ImageWidget(
                        image: ImageConstants.instance.iconGoogle,
                        widthFactor: 0.1,
                        heightFactor: 0.1,
                      ),
                      ImageWidget(
                        image: ImageConstants.instance.iconFacebook,
                        widthFactor: 0.1,
                        heightFactor: 0.1,
                      ),
                      ImageWidget(
                        image: ImageConstants.instance.iconTwitter,
                        widthFactor: 0.1,
                        heightFactor: 0.1,
                      )
                    ],
                  )
                ]);
          },
        )),
      ),
    );
  }
}
