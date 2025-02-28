import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:valorant/app.dart';

import 'app_flavor.dart';

SharedPreferences? preferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  preferences = await SharedPreferences.getInstance();

  AppFlavor.build(
    name: 'Valorant',
    baseUrl: 'https://valorant-api.com/v1/',
  );
  runApp(const MyApp());
}
