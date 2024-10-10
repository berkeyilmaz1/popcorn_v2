import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:popcorn_v2/product/initialize/localization/main_localization.dart';
import 'package:popcorn_v2/product/initialize/main_app/main_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    MainLocalization(child: const MainApp()),
  );
}
