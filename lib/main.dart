import 'package:flutter/material.dart';
import 'package:food_ui/screens/account.dart';
import 'package:food_ui/screens/food_info.dart';
import 'package:food_ui/screens/home.dart';
import 'package:food_ui/widgets/navigationbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => MyNavigationBar(),
        '/home': (context) => const HomeScreen(),
        '/account': (context) => const AccountScreen(),
        '/info': (context) => const FoodInfo(),
      },
    );
  }
}
