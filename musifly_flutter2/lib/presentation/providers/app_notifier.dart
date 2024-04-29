import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AppNotifier extends ChangeNotifier {
  bool isFirstVisit;

  AppNotifier({this.isFirstVisit = true});

  Future<void> setFirstVisit() async {
    isFirstVisit = false;

    final box = Hive.box('storage');
    await box.put('isFirstVisit', false);

    notifyListeners();
  }

  bool getFirstVisit() {
    //specific case: isFirstVisit is already false
    if (!isFirstVisit) return false;

    final box = Hive.box('storage');
    final value = box.get('isFirstVisit') as bool?;

    // case 1: storage has value
    if (value != null) {
      isFirstVisit = value;

      return isFirstVisit;
    }

    // case 2: storage is empty
    return isFirstVisit;
  }
}


// Hive


// Provider


// UI