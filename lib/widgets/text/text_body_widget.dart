import 'package:flutter/material.dart';

import '../../core/extension/context_extension.dart';

class TextBodyWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const TextBodyWidget({super.key, required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? context.textStyleBody,
      textAlign: TextAlign.start,
      softWrap: true,
    );
  }
}
