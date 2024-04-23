part of 'bottom_bar_shell.dart';

class MusBottomBar extends StatelessWidget {
  const MusBottomBar({
    Key? key,
    required this.state,
  }) : super(key: key);

  final GoRouterState state;

  final List<MusBottomBarItem> _items = const [
    MusBottomBarItem(
      asset: MusAssets.favourites,
      assetSelected: MusAssets.favouritesFilled,
      label: 'Favourites',
      path: ScreenNames.favourites,
    ),
    MusBottomBarItem(
      asset: MusAssets.home,
      assetSelected: MusAssets.homeFilled,
      label: 'Home',
      path: ScreenNames.home,
    ),
    MusBottomBarItem(
      asset: MusAssets.search,
      assetSelected: MusAssets.searchFilled,
      label: 'Search',
      path: ScreenNames.search,
    ),
  ];

  String get currentPath => state.uri.toString();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF192352),
      child: DecoratedBox(
        decoration: const BoxDecoration(
            // border: Border(top: BorderSide(color: Color(0xFF192352))),
            // color: Color(0xFF2c3658),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.only(
                top: 25,
              ),
              child:
                  // Builder(builder: (context) {
                  Row(
                children: _items.map((item) {
                  return _buildIconButton(context, item);
                }).toList(),
              )
              // }
              ),
        ),
      ),
    );
    // );
  }

  Widget _buildIconButton(BuildContext context, MusBottomBarItem item) {
    final isSelected = currentPath == item.path;
    // ignore: unused_local_variable
    final MusTheme = context.musTheme;

    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          if (GoRouterState.of(context).fullPath == item.path) return;
          context.go(item.path);
        },
        child: Container(
          height: 44,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: MusAssetImage(
                      key: ValueKey(item.label),
                      isSelected ? item.assetSelected : item.asset,
                      height: 24,
                      width: 24,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const Gap(2),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MusBottomBarItem {
  final String path;
  final MusAsset asset;
  final MusAsset assetSelected;
  final String label;

  const MusBottomBarItem({
    required this.path,
    required this.asset,
    required this.assetSelected,
    required this.label,
  });
}
