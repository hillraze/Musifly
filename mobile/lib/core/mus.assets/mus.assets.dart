import 'package:musifly/core/mus.assets/mus.asset.dart';

class MusAssets {
  const MusAssets._();

  //      JPG
  static const loading = MusAsset.bitmap('assets/images/loading.jpg');
  static const getStarted = MusAsset.bitmap('assets/images/get-started.jpg');
  static const news = MusAsset.bitmap('assets/images/news.jpg');
  static const mockCover = MusAsset.bitmap('assets/images/album-image.jpg');
  //      SVG
  static const home = MusAsset.vector('assets/svg/unactive-note.svg');
  static const homeFilled = MusAsset.vector('assets/svg/active-note.svg');
  static const search = MusAsset.vector('assets/svg/unactive-search.svg');
  static const searchFilled = MusAsset.vector('assets/svg/active-search.svg');
  static const favourites = MusAsset.vector('assets/svg/unactive-heart.svg');
  static const vdots = MusAsset.vector('assets/svg/dots-vertical.svg');
  static const favouritesFilled =
      MusAsset.vector('assets/svg/active-heart.svg');
}
