class AppImage {
  static const String icRight = 'ic_right';
  static const String icPremium = 'ic_premium';
  static const String icHome = "ic_home";
  static const String icCheckBox = "ic_check_box";
  static const String icStorage = "ic_storage";
  static const String icPerson = "ic_person";
  static const String icFakeQr = "ic_fake_qr";
  static const String icAddCardBg = "ic_add_card_bg";
  static const String icCardBg = "ic_card_bg";
}

extension DisplayImageExt on String {
  static const String _basePath = 'assets/images/';

  String path() => '$_basePath$this.svg';

  String pathPNG() => '$_basePath$this.png';

  String pathJPG() => '$_basePath$this.jpg';
}
