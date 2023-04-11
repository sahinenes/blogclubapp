import 'package:flutter/material.dart';

import '../../core/constants/app/app_constants.dart';
import '../../core/extension/context_extension.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: context.theme.colorScheme.secondary,
              borderRadius: BorderRadius.circular(context.lowValue)),
          width: context.width * 0.3,
          child: Text(
            "BLOG",
            style: TextStyle(
                fontFamily: ApplicationConstants.FONT_FAMILY,
                fontWeight: FontWeight.w500,
                color: context.theme.colorScheme.background,
                fontSize: 36),
          ),
        ),
        Text(
          "CLUB",
          style: TextStyle(
              fontFamily: ApplicationConstants.FONT_FAMILY,
              fontWeight: FontWeight.w500,
              color: context.theme.colorScheme.secondary,
              fontSize: 36),
        ),
      ],
    );
  }
}
