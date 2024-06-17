import 'package:flutter/material.dart';

class ModelForm extends StatefulWidget {
  final String modelName;
  final Function(Map<String, dynamic>) onSubmit;

  ModelForm({required this.modelName, required this.onSubmit});

  @override
  _ModelFormState createState() => _ModelFormState();
}

class _ModelFormState extends State<ModelForm> {
  final _formKey = GlobalKey<FormState>();
  late Map<String, dynamic> formData;

  @override
  void initState() {
    super.initState();
    formData = {};
  }

  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fill ${widget.modelName} Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              _buildFormFields(context, widget.modelName),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    widget.onSubmit(formData);
                    Navigator.of(context).pop();
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormFields(BuildContext context, String tableName) {
    switch (tableName) {
      case 'artist':
        return _buildArtistForm(context);
      default:
        return Container(); // Return an empty container or any other default form
    }
  }

  Widget _buildArtistForm(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(hintText: 'Name'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a name';
            }
            return null;
          },
          onSaved: (value) => formData['name'] = value,
        ),
        TextFormField(
          decoration: InputDecoration(hintText: 'Bio'),
          onSaved: (value) => formData['bio'] = value,
        ),
        TextFormField(
          decoration: InputDecoration(hintText: 'Created At'),
          onSaved: (value) => formData['createdAt'] = value,
        ),
      ],
    );
  }


  




}