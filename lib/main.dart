import 'package:app_02/my_widgets/MyButton.dart';
import 'package:app_02/my_widgets//MyColumnAndRow.dart';
import 'package:app_02/my_widgets/MyScaffold.dart';
import 'package:app_02/my_widgets/MyTextField.dart';
import 'package:flutter/material.dart';
import 'package:app_02/my_widgets/MyTextField2.dart';
import 'package:app_02/my_form/f1_form_basics.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: FormBasicDemo(),
    );
  }
}
