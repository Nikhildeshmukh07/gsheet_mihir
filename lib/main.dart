import 'package:flutter/material.dart';
import 'package:gsheet_mihir/google_sheet_api.dart';
import 'package:gsheets/gsheets.dart';

import 'Hompage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleSheetAPi().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: Hompage(),
    );
  }
}
