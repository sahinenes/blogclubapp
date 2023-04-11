import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/init/navigation/navigation_service.dart';
import '../../../../widgets/appbar/appbar_article_widget.dart';
import '../../../../widgets/text/text_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddArticleView extends StatelessWidget {
  const AddArticleView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController =
        TextEditingController(text: "The art of beign an artist");
    TextEditingController commentController =
        TextEditingController(text: "Simplified products");
    TextEditingController contentController =
        TextEditingController(text: "Article Content");

    return Scaffold(
      floatingActionButton: _floatingActionButton(context),
      appBar: appBarArticle(context),
      body: SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: titleController,
          style: context.textStyleTitle,
        ),
        TextField(
          controller: commentController,
          style: context.textStyleBody,
        ),
        SizedBox(
          height: context.height * 0.01,
        ),
        chipList(context),
        SizedBox(
          height: context.height * 0.01,
        ),
        TextField(
          controller: contentController,
          style: context.textStyleBody,
        ),
        SizedBox(
          height: context.height * 0.01,
        ),
        const TextBodyWidget(
            text:
                "This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny."),
      ],
    ),
      ),
    );
  }

  Align _floatingActionButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: context.width * 0.76,
        height: context.height * 0.07,
        decoration: BoxDecoration(
            color: context.theme.colorScheme.onSecondaryContainer,
            borderRadius: BorderRadius.circular(context.borderRadius * 2)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.theme.colorScheme.background,
              ),
              child: IconButton(
                  onPressed: () {
                    NavigationService.instance
                        .navigateToPage(path: NavigationConstants.NAVIGATION);
                  },
                  icon: const Icon(
                    FontAwesomeIcons.xmark,
                  )),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.image,
                  color: context.theme.colorScheme.background,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.play,
                  color: context.theme.colorScheme.background,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.alignLeft,
                  color: context.theme.colorScheme.background,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.link,
                  color: context.theme.colorScheme.background,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.text_fields_rounded,
                  color: context.theme.colorScheme.background,
                )),
          ],
        ),
      ),
    );
  }

  Widget chipList(BuildContext context) {
    return Wrap(
      spacing: 6.0,
      runSpacing: 6.0,
      children: <Widget>[
        TextButton(
            onPressed: () {},
            child: const TextBodyWidget(
              text: "Add Tags",
            )),
        _buildChip(context, 'Art'),
        _buildChip(context, 'Design'),
        _buildChip(context, 'Culture'),
        _buildChip(context, 'Racer'),
        _buildChip(context, 'Production'),
      ],
    );
  }

  Widget _buildChip(BuildContext context, String label) {
    return Chip(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.borderRadius),
          side: BorderSide(
              style: BorderStyle.solid,
              color: context.theme.colorScheme.secondary,
              width: 2)),
      labelPadding: context.paddingLow * 0.2,
      label: TextBodyWidget(
        text: label,
        style: context.textStyleBody
            .copyWith(color: context.theme.colorScheme.secondary),
      ),
      backgroundColor: context.theme.colorScheme.background,
      elevation: 0,
      padding: context.paddingLow,
      onDeleted: () {},
      deleteIcon: Container(
        decoration: BoxDecoration(
            color: context.theme.colorScheme.secondary.withOpacity(0.5),
            borderRadius: BorderRadius.circular(context.borderRadius)),
        child: Icon(
          FontAwesomeIcons.xmark,
          color: context.colors.background,
          size: 18,
        ),
      ),
    );
  }
}
