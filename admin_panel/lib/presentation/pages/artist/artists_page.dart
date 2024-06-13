import 'package:admin_panel/presentation/pages/artist/artist_form_page.dart';
import 'package:flutter/material.dart';
import 'package:musifly_client/musifly_client.dart';
import 'package:provider/provider.dart';

import '../../../services/api_service.dart';
import 'artist_tile.dart';

class ArtistsPage extends StatefulWidget {
  const ArtistsPage({super.key});

  @override
  State<StatefulWidget> createState() => _ArtistsPageState();
}

class _ArtistsPageState extends State<ArtistsPage> {
  late Future<List<Artist>> _artistsFuture;

  @override
  void initState() {
    super.initState();
    _artistsFuture = _fetchArtists();
  }

  Future<List<Artist>> _fetchArtists() async {
    return Provider.of<ApiService>(context, listen: false).getArtists();
  }

  Future<void> _refreshArtists() async {
    setState(() {
      _artistsFuture = _fetchArtists();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Artists List Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ArtistFormScreen()),
              );
            },
          )
        ],
      ),
      body: FutureBuilder<List<Artist>>(
        future: Provider.of<ApiService>(context, listen: false).getArtists(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('No artists found'),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ArtistFormScreen()),
                      ).then((_) {
                        // Refresh the list of artists after returning from the form
                        _refreshArtists();
                      });
                    },
                    child: Text('Create New Artist'),
                  ),
                ],
              ),
            );
          } else {
            return RefreshIndicator(
              onRefresh: _refreshArtists,
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ArtistTile(artist: snapshot.data![index]);
                },
              ),
            );
          }
        },
      ),
    );
  }
}
