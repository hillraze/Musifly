import "package:flutter/material.dart";
import "package:gap/gap.dart";
import "package:musifly/presentation/providers/home_screen_notifier.dart";
import "package:musifly/presentation/widgets/mus.tracks.dart";
import "package:provider/provider.dart";

import "../../../core/mus.assets/mus.assets.dart";
import "../../widgets/mus.albums.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeProvider>().getNewAlbums();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeProvider>().getNewTracks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: const Color(0xFF192352),
          appBar: AppBar(
            backgroundColor: const Color(0xFF192352),
            // backgroundColor: Colors.white,
            toolbarHeight: 175,
            bottom: const TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                    child: Text('New',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            // color: Colors.white,
                            fontSize: 20))),
                Tab(
                    child: Text('Genres',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            // color: Colors.white,
                            fontSize: 20))),
              ],
              indicator: BoxDecoration(
                color: Color(0xFF192352),
              ),
              dividerColor: Color(0xFF192352),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text('MUSIFLY',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                            fontSize: 30)),
                    const Gap(15),
                    Container(
                      height: 100,
                      width: 350,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(MusAssets.news.path),
                              fit: BoxFit.cover),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25))),
                    ),
                    const Gap(25),
                  ],
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            Tab(
              child: Column(
                children: [
                  Consumer<HomeProvider>(
                    builder: (context, state, child) {
                      if (state.newAlbums.isEmpty) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return MusAlbum(data: state.newAlbums);
                    },
                  ),
                  // Gap(5),
                  Consumer<HomeProvider>(
                    builder: (context, state, child) {
                      if (state.newTracks.isEmpty) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      return MusTracks(data: state.newTracks);
                    },
                  )
                ],
              ),
            ),
            Tab(
              child: Container(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 25,
                      mainAxisSpacing: 50,
                    ),
                    scrollDirection: Axis.vertical,
                    children: [
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(MusAssets.mockGenres.path),
                                fit: BoxFit.cover),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                      ), //1
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(MusAssets.mockGenres.path),
                                fit: BoxFit.cover),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                      ), //2
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(MusAssets.mockGenres.path),
                                fit: BoxFit.cover),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                      ), //3
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(MusAssets.mockGenres.path),
                                fit: BoxFit.cover),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                      ), //4
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(MusAssets.mockGenres.path),
                                fit: BoxFit.cover),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                      ), //5
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(MusAssets.mockGenres.path),
                                fit: BoxFit.cover),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                      ), //6
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(MusAssets.mockGenres.path),
                                fit: BoxFit.cover),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                      ), //7
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(MusAssets.mockGenres.path),
                                fit: BoxFit.cover),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                      ), //8
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(MusAssets.mockGenres.path),
                                fit: BoxFit.cover),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                      ), //9
                    ],
                  )),
            )
          ]),
        ));
  }
}
