import 'package:{{project_name}}/app/config/environment.dart';
import 'package:{{project_name}}/app/core/utils/shared_pref.dart';
import 'package:{{project_name}}/app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: Environment.fileName);
  await SharedPref().initSharedPreferences();
  runApp(const MyApp());
}
