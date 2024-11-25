import 'package:flutter/material.dart';
import 'package:foodiez/pages/homepage.dart';

void main() {
  runApp(FoodiezApp());
}

class FoodiezApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DishCraft',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomePage(), 
    );
  }
}
