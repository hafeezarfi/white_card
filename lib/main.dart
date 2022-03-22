import 'package:flutter/material.dart';
import 'package:white_card/ui/app/app.dart';
import 'package:white_card/utill/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'White Card',
      theme: IDPTheme.getThemeData(context),
      home: const MyHomePage(title: 'White Card Home Page'),
    );
  }

}


