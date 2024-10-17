import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:popcorn_v2/firebase_options.dart';
import 'package:popcorn_v2/product/initialize/localization/main_localization.dart';
import 'package:popcorn_v2/product/initialize/main_app/main_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await EasyLocalization.ensureInitialized();

  runApp(
    MainLocalization(child: const MainApp()),
  );
}
