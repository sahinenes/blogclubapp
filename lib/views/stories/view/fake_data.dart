import '../../../core/constants/enums/media_enums.dart';
import '../../../core/constants/image/image_constants.dart';
import '../../authentication/model/authentication_model.dart';
import '../model/stories_model.dart';

Duration duration = const Duration(seconds: 10);

final List<Story> stories = [
  Story(
      url: ImageConstants.instance.stories1,
      media: MediaType.image,
      duration: duration,
      user: Authentication(
          name: "Emilia Chesser",
          profileImageUrl: ImageConstants.instance.person1),
      title: 'What is Lorem Ipsum?',
      comment:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
  Story(
      url: ImageConstants.instance.stories2,
      media: MediaType.image,
      duration: duration,
      user: Authentication(
          name: "Richard Shustov",
          profileImageUrl: ImageConstants.instance.person2),
      title: 'Why do we use it?',
      comment:
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. "),
  Story(
      url: ImageConstants.instance.stories3,
      media: MediaType.image,
      duration: duration,
      user: Authentication(
          name: "Jasmine Ches",
          profileImageUrl: ImageConstants.instance.person3),
      title: 'Where does it come from?',
      comment:
          "Contrary to popular belief, Lorem Ipsum is not simply random text."),
  Story(
      url: ImageConstants.instance.stories4,
      media: MediaType.image,
      duration: duration,
      user: Authentication(
          name: "Lucas Trovato",
          profileImageUrl: ImageConstants.instance.person4),
      title: 'Where can I get some?',
      comment:
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form"),
  Story(
      url: ImageConstants.instance.stories3,
      media: MediaType.image,
      duration: duration,
      user: Authentication(
          name: "Hendri Trovato",
          profileImageUrl: ImageConstants.instance.person5),
      title: 'Do You Want To Live A Happy Life? Smile.',
      comment:
          "Sometimes there’s no reason to smile, but I’ll smile anyway because of life."),
];
