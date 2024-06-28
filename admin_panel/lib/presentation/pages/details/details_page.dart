import 'package:admin_panel/core/enums.dart';
import 'package:admin_panel/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:musifly_client/musifly_client.dart';
import 'package:provider/provider.dart';

import '../form/form_page.dart';

class DetailsPage extends StatefulWidget {
  final TableEnum tableName;

  const DetailsPage({required this.tableName});

  @override
  State<StatefulWidget> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final dashboardProvider = Provider.of<DashboardProvider>(context);
    final items = dashboardProvider.getItemsForTable(widget.tableName);
    final tableName = widget.tableName;

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.tableName.name.toUpperCase()}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showAddDialog(
              context,
              dashboardProvider,
              widget.tableName,
            ),
          ),
        ],
      ),
      body: items.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.hourglass_empty_rounded, size: 100),
                  Text('No ${widget.tableName.name} found',
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            )
          : RefreshIndicator(
              onRefresh: () => dashboardProvider.fetchByTable(tableName),
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(items[index].toString()),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () =>
                          _deleteItem(context, items[index], tableName),
                    ),
                  );
                },
              ),
            ),
    );
  }

  Future<void> _refreshItems(
      BuildContext context, DashboardProvider provider) async {
    return provider.fetchByTable(widget.tableName);
  }
}

void _showAddDialog(
    BuildContext context, DashboardProvider provider, TableEnum tableName) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => FormPage(
        tableName: tableName,
        onSubmit: (Map<String, dynamic> newModel) {
          print("FORM DATA >> ${newModel.toString()}");
          provider.createByTable(tableName, newModel);
        },
      ),
    ),
  );
}

void _deleteItem(
  BuildContext context,
  PlaylistTrack playlistTrack,
  TableEnum tableName,
) async {
  await context
      .read<DashboardProvider>()
      .deleteByTable(tableName, playlistTrack.toJson());
  await context.read<DashboardProvider>().fetchByTable(tableName);
}
