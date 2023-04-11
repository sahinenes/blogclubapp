import '../../../core/constants/image/image_constants.dart';
import '../../../core/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/constants/enums/media_enums.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../../../widgets/bar/bar_widget.dart';
import '../../../widgets/image/image_widget.dart';
import '../../../widgets/text/text_body_widget.dart';
import '../../../widgets/text/text_title_widget.dart';
import '../model/stories_model.dart';
import 'fake_data.dart';

class StoriesView extends StatefulWidget {
  const StoriesView({super.key});

  @override
  State<StoriesView> createState() => _StoriesViewState();
}

class _StoriesViewState extends State<StoriesView>
    with SingleTickerProviderStateMixin {
  PageController? _pageController;
  AnimationController? _animController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _animController = AnimationController(vsync: this);

    final Story firstStory = stories.first;
    _loadStory(story: firstStory, animateToPage: false);

    _animController?.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animController?.stop();
        _animController?.reset();
        setState(() {
          if (_currentIndex + 1 < stories.length) {
            _currentIndex += 1;
            _loadStory(story: stories[_currentIndex]);
          } else {
            // Out of bounds - loop story
            // You can also Navigator.of(context).pop() here
            _currentIndex = 0;
            _loadStory(story: stories[_currentIndex]);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController?.dispose();
    _animController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Story story = stories[_currentIndex];
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.colorScheme.secondary,
        body: InkWell(
          onTap: () {
            setState(() {
              if (_currentIndex != stories.length-1) {
                _currentIndex += 1;
                _loadStory(story: stories[_currentIndex]);
              } else {
                NavigationService.instance
                    .navigateToPage(path: NavigationConstants.NAVIGATION);
              }
            });
          },
          child: Column(
            children: [
              Expanded(
                child: SizedBox(
                  width: context.width,
                  height: context.height * 0.9,
                  child: PageView.builder(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: stories.length,
                      itemBuilder: (context, index) {
                        final Story story = stories[index];
                        return _story(context, story);
                      }),
                ),
              ),
              Container(
                width: context.width,
                height: context.height * 0.15,
                decoration:
                    BoxDecoration(color: context.theme.colorScheme.secondary),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(),
                      SizedBox(
                        width: context.width * 0.3,
                        height: context.height * 0.07,
                        child: TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  context.theme.colorScheme.background),
                            ),
                            onPressed: () {},
                            child: TextBodyWidget(
                              text: 'Read More',
                              style: context.textStyleBody.copyWith(
                                  color: context.theme.colorScheme.secondary),
                            )),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.solidHeart,
                            color: Colors.red,
                            size: context.width * 0.08,
                          ),
                          TextBodyWidget(
                            text: "450k",
                            style: context.textStyleBody.copyWith(
                                color: context.theme.colorScheme.background),
                          )
                        ],
                      )
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _story(BuildContext context, Story story) {
    return Container(
      width: context.width,
      height: context.height * 0.9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(context.borderRadius * 2),
              bottomRight: Radius.circular(context.borderRadius * 2)),
          image: DecorationImage(
            opacity: 0.7,
            image: AssetImage(story.url),
            fit: BoxFit.fitHeight,
          )),
      child: Stack(
        children: [
          Padding(
            padding: context.paddingNormal,
            child: Row(
              children: stories
                  .asMap()
                  .map((i, e) {
                    return MapEntry(
                      i,
                      AnimatedBar(
                        animController: _animController!,
                        position: i,
                        currentIndex: _currentIndex,
                      ),
                    );
                  })
                  .values
                  .toList(),
            ),
          ),
          Positioned(
              top: 80,
              right: 50,
              left: 50,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: context.paddingLowHorizontal,
                    padding: context.paddingLow * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: ImageWidget(
                        type: SourceType.asset,
                        image: story.user.profileImageUrl,
                        widthFactor: 0.137,
                        heightFactor: 0.13,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextTitleWidget(
                        text: story.user.name,
                        style: context.textStyleTitle.copyWith(
                            color: context.theme.colorScheme.background,
                            fontSize: 20),
                      ),
                      TextBodyWidget(
                        text: "4m ago",
                        style: context.textStyleBody.copyWith(
                            color: context.theme.colorScheme.background),
                      )
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      NavigationService.instance
                          .navigateToPage(path: NavigationConstants.NAVIGATION);
                    },
                    icon: Icon(
                      Icons.close,
                      size: 38,
                      color: context.theme.colorScheme.background,
                    ),
                  )
                ],
              )),
          Positioned(
            bottom: 50,
            right: 50,
            left: 50,
            child: Container(
              alignment: Alignment.center,
              width: context.width * 0.7,
              height: context.height * 0.25,
              padding: context.paddingNormal,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(140, 140, 140, 0.3),
                  borderRadius: BorderRadius.all(
                      Radius.circular(context.borderRadius * 2))),
              child: Column(children: [
                TextTitleWidget(
                  text: story.title,
                  style: context.textStyleTitle
                      .copyWith(color: context.theme.colorScheme.background),
                ),
                SizedBox(
                  height: context.height * 0.02,
                ),
                TextBodyWidget(
                  text: story.comment,
                  style: context.textStyleBody
                      .copyWith(color: context.theme.colorScheme.background),
                )
              ]),
            ),
          )
        ],
      ),
    );
  }

  void _onTapDown(TapDownDetails details, Story story) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;
    if (dx < screenWidth / 3) {
      setState(() {
        if (_currentIndex - 1 >= 0) {
          _currentIndex -= 1;
          _loadStory(story: stories[_currentIndex]);
        }
      });
    } else if (dx > 2 * screenWidth / 3) {
      setState(() {
        if (_currentIndex + 1 < stories.length) {
          _currentIndex += 1;
          _loadStory(story: stories[_currentIndex]);
        } else {
          // Out of bounds - loop story
          // You can also Navigator.of(context).pop() here
          _currentIndex = 0;
          _loadStory(story: stories[_currentIndex]);
        }
      });
    } else {
      /*
      if (story.media == MediaType.video) {
        if (_videoController.value.isPlaying) {
          _videoController.pause();
          _animController.stop();
        } else {
          _videoController.play();
          _animController.forward();
        }
      }*/
    }
  }

  void _loadStory({required Story story, bool animateToPage = true}) {
    _animController?.stop();
    _animController?.reset();

    _animController?.duration = story.duration;
    _animController?.forward();

    if (animateToPage) {
      _pageController?.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }
}
