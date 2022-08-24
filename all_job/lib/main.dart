import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'myApp.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;
  runApp(MyApp(showHome: showHome));
}
