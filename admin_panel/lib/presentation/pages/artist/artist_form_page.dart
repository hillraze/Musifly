import 'package:flutter/material.dart';
import 'package:musifly_client/musifly_client.dart';
import 'package:provider/provider.dart';

import '../../../services/api_service.dart';

class ArtistFormScreen extends StatefulWidget {
  final Artist? artist;

  const ArtistFormScreen({this.artist});

  @override
  _ArtistFormScreenState createState() => _ArtistFormScreenState();
}

class _ArtistFormScreenState extends State<ArtistFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _bio;

  @override
  void initState() {
    super.initState();
    _name = widget.artist?.name ?? '';
    _bio = widget.artist?.bio ?? '';
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final artist = Artist(
        id: widget.artist?.id,
        name: _name,
        bio: _bio,
        createdAt: widget.artist?.createdAt ?? DateTime.now(),
      );

      final apiService = Provider.of<ApiService>(context, listen: false);
      if (widget.artist == null) {
        apiService.createArtist(artist).then((_) {
          Navigator.pop(context);
        });
      } else {
        apiService.updateArtist(artist).then((_) {
          Navigator.pop(context);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.artist == null ? 'Add Artist' : 'Edit Artist'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _name,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                initialValue: _bio,
                decoration: InputDecoration(labelText: 'Bio'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a bio';
                  }
                  return null;
                },
                onSaved: (value) {
                  _bio = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text(widget.artist == null ? 'Add' : 'Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
