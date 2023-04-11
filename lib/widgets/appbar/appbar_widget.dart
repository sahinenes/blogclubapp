import '../../core/extension/context_extension.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget appBar(BuildContext context) {
  return AppBar(
    leading: Padding(
      padding: context.paddingNormal,
      child: const Icon(Icons.arrow_back_ios),
    ),
    actions: [
      Padding(
        padding: context.paddingNormal,
        child: Icon(Icons.more_horiz),
      )
    ],
  );
}
