import '../../core/extension/context_extension.dart';
import '../text/text_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

PreferredSizeWidget appBarArticle(BuildContext context) {
  return AppBar(
    leadingWidth: context.width * 0.5,
    leading: Padding(
      padding: context.paddingNormal,
      child: const TextTitleWidget(text: "New Article"),
    ),
    actions: [
      Padding(
        padding: context.paddingNormal,
        child: Icon(
          Icons.file_download_outlined,
          size: 40,
        ),
      )
    ],
  );
}
