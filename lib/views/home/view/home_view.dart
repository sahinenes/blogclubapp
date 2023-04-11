import '../../../core/base/state/base_state.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/constants/image/image_constants.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../../add/article/view/add_artice.dart';
import '../../article/view/article_view.dart';
import '../../authentication/view/authentication_view.dart';
import '../controller/home_controller.dart';
import '../view_models/home_view_model.dart';
import '../../stories/view/stories_view.dart';
import '../../../widgets/image/image_widget.dart';
import '../../../widgets/text/text_body_widget.dart';
import '../../../widgets/text/text_title_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      ImageConstants.instance.board3,
      ImageConstants.instance.board4,
      ImageConstants.instance.board1,
      ImageConstants.instance.board2
    ];

    List<Widget> body = const [
      HomeView(),
      ArticleView(),
      AddArticleView(),
      StoriesView(),
      AuthenticationView()
    ];

    return SafeArea(
        child: BaseView(
      viewModel: HomeController.instance.homeViewModel,
      onModelReady: (HomeViewModel model) {},
      onPageBuilder: (BuildContext context, HomeViewModel model) {
        return _scaffold(context, images, model);
      },
    ));
  }

  Scaffold _scaffold(
      BuildContext context, List<String> images, HomeViewModel model) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title(context),
              _stories(context),
              SizedBox(
                height: context.height * 0.04,
              ),
              _categories(context, images),
              SizedBox(
                height: context.height * 0.04,
              ),
              _latestNews(context, images)
            ]),
      ),
    );
  }

  Column _latestNews(BuildContext context, List<String> images) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TextTitleWidget(text: "Latest News"),
            TextBodyWidget(
              text: "More",
              style: context.textStyleBody
                  .copyWith(color: context.theme.colorScheme.secondary),
            )
          ],
        ),
        SizedBox(
          height: context.height * 0.02,
        ),
        _lastNewWidget(context, images)
      ],
    );
  }

  Widget _lastNewWidget(BuildContext context, List<String> images) {
    return InkWell(
      onTap: () {
        NavigationService.instance
            .navigateToPage(path: NavigationConstants.ARTICLE);
      },
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(context.borderRadius * 2)),
        child: Container(
            width: context.width,
            height: context.height * 0.22,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                    borderRadius:
                        BorderRadius.circular(context.borderRadius * 2),
                    child: ImageWidget(
                        widthFactor: context.width * 0.0007,
                        heightFactor: context.height * 0.0007,
                        fit: BoxFit.fitHeight,
                        image: ImageConstants.instance.news)),
                SizedBox(
                  width: context.width * 0.05,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TextTitleWidget(text: "BIG DATA"),
                      const TextBodyWidget(
                          text: "Why Big Data Needs Thick Data?"),
                      SizedBox(
                        height: context.height * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.thumbsUp,
                                color: Colors.black.withOpacity(0.7),
                              ),
                              SizedBox(
                                width: context.width * 0.01,
                              ),
                              const TextBodyWidget(text: "2.1k"),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.clock,
                                color: Colors.black.withOpacity(0.7),
                              ),
                              SizedBox(
                                width: context.width * 0.01,
                              ),
                              const TextBodyWidget(text: "1 hour ago"),
                            ],
                          ),
                          Icon(
                            FontAwesomeIcons.solidBookmark,
                            color: context.theme.colorScheme.secondary,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }

  SizedBox _categories(BuildContext context, List<String> images) {
    return SizedBox(
      height: context.height * 0.34,
      width: context.width,
      child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                NavigationService.instance
                    .navigateToPage(path: NavigationConstants.ADD_ARTICLE);
              },
              child: AnimatedContainer(
                  width: context.width * 0.6,
                  height: context.height * 0.34,
                  margin: context.paddingNormalHorizontal,
                  duration: context.lowDuration,
                  child: Stack(children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(context.borderRadius * 2),
                      child: Image.asset(images[index],
                          width: context.width * 0.6,
                          height: context.height * 0.34,
                          fit: BoxFit.fill),
                    ),
                    Positioned(
                        bottom: 20,
                        left: 20,
                        child: TextTitleWidget(
                          text: "Technology",
                          style: context.textStyleTitle.copyWith(
                              color: context.theme.colorScheme.background),
                        ))
                  ])),
            );
          }),
    );
  }

  Widget _stories(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height * 0.128,
      margin: context.paddingNormalVertical,
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                var list = [
                  ImageConstants.instance.person1,
                  ImageConstants.instance.person2,
                  ImageConstants.instance.person3,
                  ImageConstants.instance.person4,
                  ImageConstants.instance.person5,
                ];
                var iconlist = [
                  Icons.videocam_outlined,
                  Icons.filter_vintage_outlined,
                  Icons.sunny,
                  Icons.business,
                  Icons.person
                ];

                var namelist = [
                  "Emilia",
                  "Richard",
                  "Jasmine",
                  "Lucas",
                  "Hendri"
                ];
                return InkWell(
                    onTap: () {
                      NavigationService.instance
                          .navigateToPage(path: NavigationConstants.STORIES);
                    },
                    child: _avatar(context, list[index], iconlist[index],
                        namelist[index]));
              })),
    );
  }

  Widget _avatar(
      BuildContext context, String image, IconData icon, String name) {
    return Stack(alignment: Alignment.center, children: [
      Container(
        margin: context.paddingLowHorizontal,
        padding: context.paddingLow * 0.3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              width: 2,
              color: context.theme.colorScheme.secondary,
            )),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: ImageWidget(
            image: image,
            widthFactor: 0.148,
            heightFactor: 0.150,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
      Positioned(
          right: 0,
          bottom: 15,
          child: Container(
              padding: context.paddingLow * 0.3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(context.borderRadius),
                  color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                      .withOpacity(1.0)),
              child: Icon(
                icon,
                color: context.theme.colorScheme.background,
                size: context.width * 0.05,
              ))),
      Positioned(
          right: 21,
          bottom: -3,
          child: TextBodyWidget(
            text: name,
            style: context.textStyleBody.copyWith(fontSize: 13),
          ))
    ]);
  }

  Widget _title(BuildContext context) {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            TextBodyWidget(text: "Hi, Jonathan!"),
            TextTitleWidget(text: "Exolore today's")
          ],
        ),
        Stack(
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_none_outlined,
                  size: context.width * 0.07,
                )),
            Positioned(
                top: 15,
                left: 15,
                child: Container(
                  width: context.width * 0.02,
                  height: context.width * 0.02,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius:
                          BorderRadius.circular(context.borderRadius)),
                ))
          ],
        )
      ]),
    );
  }
}
