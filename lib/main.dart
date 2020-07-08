import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:untitled2/multi_select.dart';

void main() {
  runApp(MaterialApp(
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      DefaultCupertinoLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    locale: Locale('ar', ''),
    supportedLocales: [
      const Locale('en', 'US'), // English
      const Locale('ar', ''), // Thai
    ],
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List list = [
    "أخر الأخبار",
    "إقتصاد",
    "رياضة",
    "فن",
    "سياسة",
    "إقتصاد",
    "تكنولوجيا"
  ];
  bool showMultiSelect = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MultiSelect"),
      ),
      body: Column(
        children: [


          MultiSelect(
              title: "اخر الاخبار",
              data: list,
              getSelectd: (selected) {
                print(selected);
              }),



        ],
      ),
    );
  }
}
