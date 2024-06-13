import 'package:admin_panel/presentation/pages/artist/artists_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/api_service.dart';

void main() {
  runApp(AdminPanelApp());
}

class AdminPanelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ApiService>(create: (_) => ApiService()),
      ],
      child: MaterialApp(
        title: 'Admin Panel',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ArtistsPage(),
      ),
    );
  }
}
