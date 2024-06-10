class ScreenNames {
  ScreenNames._();
  static const home = '/home-screen';
  static const onboard = '/onboarding-screen';
  static const splash = '/splash-screen';
  static const test = '/test-screen';
  static const favourites = '/favourites-screen';
  static const search = '/search-screen';
  static const player = '/player-screen';
  static const playlistCreate = '/create-playlist';
  static const playlist = '/playlist-screen';

  static List<String> get all =>
      [splash, home, onboard, favourites, search, player, playlistCreate, playlist];
}
