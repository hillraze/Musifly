import 'package:flutter/material.dart';
import 'package:musifly_client/musifly_client.dart';
import 'package:provider/provider.dart';

import '../../../services/api_service.dart';
import 'artist_form_page.dart';

class ArtistTile extends StatelessWidget {
  final Artist artist;

  ArtistTile({required this.artist});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(artist.name),
      subtitle: Text(artist.bio),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArtistFormScreen(artist: artist)),
        );
      },
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          final apiService = Provider.of<ApiService>(context, listen: false);
          apiService.deleteArtist(artist.id!).then((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Artist deleted')),
            );
          });
        },
      ),
    );
  }
}
