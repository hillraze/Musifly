import 'package:flutter/material.dart';

void showFeatureNotification(BuildContext context) {
  final snackBar = SnackBar(
      content: GestureDetector(
        onTap: ScaffoldMessenger.of(context).hideCurrentSnackBar,
        child: const Text('This feature will be available soon',
            style: TextStyle(fontSize: 14)),
      ),
      dismissDirection: DismissDirection.startToEnd,
      duration: const Duration(seconds: 3),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      backgroundColor: Colors.purple);
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
