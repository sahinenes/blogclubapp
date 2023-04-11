import 'package:flutter/material.dart';

import '../../core/extension/context_extension.dart';

class TextTitleWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const TextTitleWidget({super.key, required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? context.textStyleTitle,
      softWrap: true,
      textAlign: TextAlign.start,
    );
  }
}
