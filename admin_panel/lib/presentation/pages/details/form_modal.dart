import 'package:admin_panel/core/enums.dart';
import 'package:flutter/material.dart';

class ModelForm extends StatefulWidget {
  const ModelForm({required this.onSubmit, required this.tableName});

  final Function(Map<String, dynamic>) onSubmit;
  final TableEnum tableName;

  @override
  _ModelFormState createState() => _ModelFormState();
}

class _ModelFormState extends State<ModelForm> {
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> formData = {
    "createdAt": DateTime.now(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create new ${widget.tableName.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              _buildFormFields(context, widget.tableName),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      widget.onSubmit(formData);
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormFields(BuildContext context, TableEnum tableName) {
    switch (tableName) {
      case TableEnum.artist:
        return _buildArtistForm(context);
      case TableEnum.album:
        return _buildAlbumForm(context);
      case TableEnum.track:
        return _buildTrackForm(context);
      case TableEnum.playlist:
        return _buildPlaylistForm(context);
      default:
        return Container(); // Return an empty container or any other default form
    }
  }

  Widget _buildArtistForm(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(hintText: 'Name'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a name';
            }
            return null;
          },
          onSaved: (value) => formData['name'] = value,
        ),
        TextFormField(
          decoration: const InputDecoration(hintText: 'Bio'),
          onSaved: (value) => formData['bio'] = value,
        ),
      ],
    );
  }

//       title: jsonSerialization['title'] as String,
//       genre: jsonSerialization['genre'] as String?,
//       coverUrl: jsonSerialization['coverUrl'] as String?,
//       artistId: jsonSerialization['artistId'] as int,
//       artist: jsonSerialization['artist'] == null
//           ? null
//           : _i2.Artist.fromJson(
//               (jsonSerialization['artist'] as Map<String, dynamic>)),
//       releasedAt:
//           _i1.DateTimeJsonExtension.fromJson(jsonSerialization['releasedAt']),
  Widget _buildAlbumForm(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(hintText: 'Title'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a title';
            }
            return null;
          },
          onSaved: (value) => formData['title'] = value,
        ),
        TextFormField(
          decoration: const InputDecoration(hintText: 'Genre'),
          onSaved: (value) => formData['genre'] = value,
        ),
        TextFormField(
          decoration: const InputDecoration(hintText: 'Cover URL'),
          onSaved: (value) => formData['coverUrl'] = value,
        ),
        TextFormField(
          decoration: const InputDecoration(hintText: 'Artist ID'),
          onSaved: (value) => formData['artistId'] = value,
        ),
        TextFormField(
          decoration: const InputDecoration(hintText: 'Released At'),
          onSaved: (value) => formData['releasedAt'] = value,
          keyboardType: TextInputType.datetime,
        ),
      ],
    );
  }

  Widget _buildTrackForm(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(hintText: 'Title'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a title';
            }
            return null;
          },
          onSaved: (value) => formData['title'] = value,
        ),
        TextFormField(
          decoration: const InputDecoration(hintText: 'Genre'),
          onSaved: (value) => formData['genre'] = value,
        ),
        TextFormField(
          decoration: const InputDecoration(hintText: 'Cover URL'),
          onSaved: (value) => formData['coverUrl'] = value,
        ),
        TextFormField(
          decoration: const InputDecoration(hintText: 'Artist ID'),
          onSaved: (value) => formData['artistId'] = value,
        ),
        TextFormField(
          decoration: const InputDecoration(hintText: 'Released At'),
          onSaved: (value) => formData['releasedAt'] = value,
          keyboardType: TextInputType.datetime,
        ),
      ],
    );
  }

  Widget _buildPlaylistForm(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(hintText: 'Name'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a name';
            }
            return null;
          },
          onSaved: (value) => formData['name'] = value,
        ),
        TextFormField(
          decoration: const InputDecoration(hintText: 'Is Public'),
          onSaved: (value) => formData['isPublic'] = value,
        ),
      ],
    );
  }
}
