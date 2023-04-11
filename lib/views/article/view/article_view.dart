import '../../../core/constants/image/image_constants.dart';
import '../../../core/extension/context_extension.dart';
import '../../stories/view/fake_data.dart';
import '../../../widgets/text/text_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/constants/enums/media_enums.dart';
import '../../../widgets/appbar/appbar_widget.dart';
import '../../../widgets/image/image_widget.dart';
import '../../../widgets/text/text_body_widget.dart';

class ArticleView extends StatelessWidget {
  const ArticleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Container(
        width: context.width * 0.28,
        decoration: BoxDecoration(
            color: context.theme.colorScheme.secondary,
            borderRadius: BorderRadius.circular(context.borderRadius * 2)),
        child: TextButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(FontAwesomeIcons.thumbsUp,
                    color: context.theme.colorScheme.background),
                SizedBox(
                  width: context.width * 0.02,
                ),
                TextTitleWidget(
                  text: "2.1k",
                  style: context.textStyleTitle
                      .copyWith(color: context.theme.colorScheme.background),
                ),
              ],
            )),
      ),
      appBar: appBar(context),
      body: Padding(
        padding: context.paddingNormal,
        child: Column(children: [
          const TextTitleWidget(
            text: "BIG DATA",
          ),
          SizedBox(
            height: context.height * 0.05,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
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
                        image: stories[0].user.profileImageUrl,
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
                        text: stories[0].user.name,
                        style: context.textStyleTitle.copyWith(fontSize: 20),
                      ),
                      const TextBodyWidget(
                        text: "2m ago",
                      )
                    ],
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    FontAwesomeIcons.paperPlane,
                    color: context.theme.colorScheme.secondary,
                  ),
                  SizedBox(
                    width: context.width * 0.05,
                  ),
                  Icon(
                    FontAwesomeIcons.bookmark,
                    color: context.theme.colorScheme.secondary,
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: context.height * 0.03,
          ),
          Expanded(
            child: SizedBox(
              width: context.width,
              height: context.height * 0.9,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(context.borderRadius * 2),
                          topRight: Radius.circular(context.borderRadius * 2)),
                      child: ImageWidget(
                        image: ImageConstants.instance.stories2,
                        widthFactor: context.width,
                        heightFactor: context.height * 0.0007,
                      ),
                    ),
                    Padding(
                      padding: context.paddingNormal,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          TextTitleWidget(
                              text: "Why Big Data Needs Thick Data?"),
                          TextBodyWidget(
                              text:
                                  "Big data primarily refers to data sets that are too large or complex to be dealt with by traditional data-processing application software. Data with many entries (rows) offer greater statistical power, while data with higher complexity (more attributes or columns) may lead to a higher false discovery rate. Though used sometimes loosely partly because of a lack of formal definition, the interpretation that seems to best describe big data is the one associated with large body of information that we could not comprehend when used only in smaller amounts.")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
