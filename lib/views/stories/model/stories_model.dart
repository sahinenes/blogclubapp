import '../../authentication/model/authentication_model.dart';

import '../../../core/constants/enums/media_enums.dart';

class Story {
  final String url;
  final MediaType media;
  final Duration duration;
  final Authentication user;
  final String title;
  final String comment;

  const Story({
    required this.url,
    required this.media,
    required this.duration,
    required this.user,
    required this.title,
    required this.comment,
  });
}
