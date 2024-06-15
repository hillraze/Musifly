import 'package:admin_panel/core/enums.dart';
import 'package:admin_panel/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'form_modal.dart';

class DetailsPage extends StatelessWidget {
  final TableEnum tableName;

  const DetailsPage({required this.tableName});

  @override
  Widget build(BuildContext context) {
    final dashboardProvider = Provider.of<DashboardProvider>(context);
    final items = dashboardProvider.getItemsForTable(tableName);

    return Scaffold(
      appBar: AppBar(
        title: Text('${tableName.name.toUpperCase()}'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _showAddDialog(context, dashboardProvider),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => dashboardProvider.fetchByTable(tableName),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index].toString()),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => _deleteItem(
                  context,
                  dashboardProvider,
                  items[index].id,
                  tableName,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _refreshItems(
      BuildContext context, DashboardProvider provider) async {
    return provider.fetchByTable(tableName);
  }
}

void _showAddDialog(BuildContext context, DashboardProvider provider) {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ModelForm(
        modelName: 'artist',
        onSubmit: (map) {
          print(map.toString());
        },
      ),
    ),
  );

  // showDialog(
  //   context: context,
  //   builder: (context) {
  //     return AlertDialog(
  //       title: Text('Add New Item'),
  //       content: Form(
  //         key: _formKey,
  //         child: TextFormField(
  //           controller: _nameController,
  //           decoration: InputDecoration(labelText: 'Name'),
  //           validator: (value) {
  //             if (value == null || value.isEmpty) {
  //               return 'Please enter a name';
  //             }
  //             return null;
  //           },
  //         ),
  //       ),
  //       actions: [
  //         TextButton(
  //           onPressed: () => Navigator.of(context).pop(),
  //           child: Text('Cancel'),
  //         ),
  //         TextButton(
  //           onPressed: () {
  //             if (_formKey.currentState!.validate()) {
  //               // _addItem(context, provider, _nameController.text);
  //               Navigator.of(context).pop();
  //             }
  //           },
  //           child: Text('Add'),
  //         ),
  //       ],
  //     );
  //   },
  // );
}

void _deleteItem(
  BuildContext context,
  DashboardProvider provider,
  int id,
  TableEnum tableName,
) {
  provider.deleteByTable(tableName, id);
}
