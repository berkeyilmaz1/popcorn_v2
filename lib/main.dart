import 'package:flutter/material.dart';
import 'package:popcorn_v2/product/initialize/application_start/application_start.dart';
import 'package:popcorn_v2/product/initialize/localization/main_localization.dart';
import 'package:popcorn_v2/product/initialize/main_app/main_app.dart';

void main() async {
  await ApplicationStart.init();

  runApp(
    MainLocalization(child: const MainApp()),
  );
}
