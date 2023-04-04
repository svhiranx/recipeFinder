import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipefinder/Models/Datas.dart';
import 'package:recipefinder/Screens/home.dart';
import 'package:recipefinder/Screens/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return Datas();
      },
      child: MaterialApp(
          routes: {
            '/': (context) => HomeScreen(),
            '/search': (context) => SearchScreen()
          },
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          )),
    );
  }
}
