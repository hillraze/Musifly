import 'package:admin_panel/core/enums.dart';
import 'package:admin_panel/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<StatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends State<DashboardPage> {
  @override
  void initState() {
    context.read<DashboardProvider>().fetchOverview();
    return super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dashboardProvider = Provider.of<DashboardProvider>(context);

    void goToDetailsPage(BuildContext context, TableEnum tableName) {
      dashboardProvider.fetchByTable(tableName);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsPage(tableName: tableName),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            OverviewTile(
              title: 'Albums',
              count: dashboardProvider.albumsCount,
              onTap: () => goToDetailsPage(context, TableEnum.album),
            ),
            OverviewTile(
              title: 'Artists',
              count: dashboardProvider.artistsCount,
              onTap: () => goToDetailsPage(context, TableEnum.artist),
            ),
            OverviewTile(
              title: 'Tracks',
              count: dashboardProvider.tracksCount,
              onTap: () => goToDetailsPage(context, TableEnum.track),
            ),
            OverviewTile(
              title: 'Playlists',
              count: dashboardProvider.playlistsCount,
              onTap: () => goToDetailsPage(context, TableEnum.playlist),
            ),
            OverviewTile(
              title: 'PlaylistTracks',
              count: dashboardProvider.playlistTracksCount,
              onTap: () => goToDetailsPage(context, TableEnum.playlistTrack),
            ),
          ],
        ),
      ),
    );
  }
}

class OverviewTile extends StatelessWidget {
  final String title;
  final int count;
  final VoidCallback onTap;

  const OverviewTile({
    required this.title,
    required this.count,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: Text(count.toString()),
        onTap: onTap,
      ),
    );
  }
}
