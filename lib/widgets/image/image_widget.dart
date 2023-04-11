import '../../core/constants/enums/media_enums.dart';
import '../../core/extension/context_extension.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget(
      {Key? key,
      required this.image,
      this.widthFactor = 0.4,
      this.heightFactor = 0.4,
      this.fit = BoxFit.fill,
      this.type = SourceType.asset})
      : super(key: key);
  final String image;
  final double? widthFactor;
  final double? heightFactor;
  final BoxFit fit;
  final SourceType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: type == SourceType.asset
          ? Image.asset(image,
              width: context.width * widthFactor!,
              height: context.width * heightFactor!,
              fit: fit)
          : Image.network(image,
              width: context.width * widthFactor!,
              height: context.width * heightFactor!,
              fit: fit),
    );
  }
}
