class ImageConstants {
  ImageConstants._init();
  static ImageConstants? _instace;

  static ImageConstants get instance => _instace ??= ImageConstants._init();

  String get board1 => toPng('board1');
  String get board2 => toPng('board2');
  String get board3 => toPng('board3');
  String get board4 => toPng('board4');
  String get person1 => toPng('person1');
  String get person2 => toPng('person2');
  String get person3 => toPng('person3');
  String get person4 => toPng('person4');
  String get person5 => toPng('person5');
  String get stories1 => toJpg('stories1');
  String get stories2 => toJpg('stories2');
  String get stories3 => toJpg('stories3');
  String get stories4 => toJpg('stories4');
  String get stories => toPng('stories');
  String get news => toPng('news');
  String get iconFacebook => toPng('iconFacebook');
  String get iconTwitter => toPng('iconTwitter');
  String get iconGoogle => toPng('iconGoogle');

  String toPng(String name) => 'assets/images/$name.png';
  String toJpg(String name) => 'assets/images/$name.jpg';
  String toSVG(String name) => 'assets/images/$name.svg';
}
