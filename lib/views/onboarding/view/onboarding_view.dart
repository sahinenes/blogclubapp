import '../../../core/constants/image/image_constants.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../../../widgets/text/text_body_widget.dart';
import '../../../widgets/text/text_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../widgets/image/image_widget.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final int _numPages = 4;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  final List<String> images = [
    ImageConstants.instance.board3,
    ImageConstants.instance.board4,
    ImageConstants.instance.board1,
    ImageConstants.instance.board2
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
          padding: context.paddingNormal,
          child: Column(
            children: [
              SizedBox(
                width: context.height,
                height: context.height * 0.8,
                child: PageView(
                    physics: const ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: [
                      _board(context, "Read the article you want instantly",
                          "You can read thousands of articles on Blog Club, save them in the application and share them with your loved ones."),
                      _board(context, "What is Lorem Ipsum?",
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "),
                      _board(context, "Why do we use it?",
                          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. "),
                      _board(context, "Where does it come from?",
                          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old."),
                    ]),
              ),
              Padding(
                padding: context.paddingMediumHorizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: _buildPageIndicator(),
                    ),
                    InkWell(
                      onTap: () {
                        if (_currentPage == _numPages - 1) {
                          NavigationService.instance.navigateToPage(
                              path: NavigationConstants.AUTHENTICATION);
                        } else {
                          _pageController.nextPage(
                            duration: context.normalDuration,
                            curve: Curves.ease,
                          );
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: context.theme.colorScheme.secondary,
                            borderRadius:
                                BorderRadius.circular(context.borderRadius)),
                        width: context.width * 0.280,
                        height: context.height * 0.09,
                        child: Icon(
                          Icons.arrow_right_alt_rounded,
                          size: 48,
                          color: context.theme.colorScheme.background,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    ));
  }

  Widget _board(BuildContext context, String title, String comment) {
    return Column(
      children: [
        SizedBox(
          height: context.height * 0.06,
        ),
        SizedBox(
          width: context.width * 0.8,
          height: context.height * 0.43,
          child: MasonryGridView.count(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: images.length,
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 25,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(context.borderRadius),
                child: ImageWidget(
                  image: images[index],
                ),
              );
            },
          ),
        ),
        Container(
          margin: context.paddingMedium,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: context.theme.colorScheme.background),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: context.height * 0.02,
            ),
            TextTitleWidget(
              text: title,
            ),
            SizedBox(
              height: context.height * 0.01,
            ),
            TextBodyWidget(
              text: comment,
            ),
          ]),
        )
      ],
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: context.normalDuration,
      margin: const EdgeInsets.symmetric(horizontal: 3.0),
      height: 8.0,
      width: isActive ? 16 : 10,
      decoration: BoxDecoration(
        color: isActive ? context.theme.colorScheme.secondary : Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(context.borderRadius)),
      ),
    );
  }
}
