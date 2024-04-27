abstract class Assets {
  const Assets._();

  // ignore: library_private_types_in_public_api
  static _Icons get icons => const _Icons();

  // ignore: library_private_types_in_public_api
  static _Images get images => const _Images();
  static _Lottie get lottie => const _Lottie();

  // ignore: library_private_types_in_public_api
  // static _ChannelsList get channelList =>> _ChannelsList();

  // ignore: library_private_types_in_public_api
  // static _Videos get videos => const _Videos();

// ignore: library_private_types_in_public_api
  static _Audios get audios => const _Audios();
}

abstract class _AssetsHolder {
  final String basePath;

  const _AssetsHolder(this.basePath);
}

class _Icons extends _AssetsHolder {
  const _Icons() : super('assets/icons');

  String get basket => '$basePath/basket.svg';
  String get barcode => '$basePath/barcode.svg';
  String get list => '$basePath/list.svg';
  String get search => '$basePath/search.svg';
  String get add => '$basePath/add.svg';
  String get call => '$basePath/call.svg';
  String get callCenter => '$basePath/call_center.svg';
  String get chat => '$basePath/chat.svg';
  String get camera => '$basePath/camera.svg';
  String get trash => '$basePath/trash.svg';
  String get print => '$basePath/print.svg';
}

class _Images extends _AssetsHolder {
  const _Images() : super('assets/images');

  String get one => '$basePath/1.png';

  String get cardBg => '$basePath/card_bg.png';

  String get logo => '$basePath/kassa_logo.png';
  String get kassaIcon => '$basePath/kassa_icon.png';
}

class _Lottie extends _AssetsHolder {
  const _Lottie() : super('assets/lottie');
  String get succes => "$basePath/succes.json";
}

class _Audios extends _AssetsHolder {
  const _Audios() : super('audio');

  String get one => "audio/1.mp3";
}
