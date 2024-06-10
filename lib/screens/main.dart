import 'package:flutter/material.dart';
import 'package:login_page/screens/splashScreen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo App',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 25, fontFamily: 'NotoSerif'),
        centerTitle: true,
        color: Colors.green,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        )),
        elevation: 20,
        shadowColor: Colors.green,
      )),
      home: SplashScreen(),
    );
  }
}
