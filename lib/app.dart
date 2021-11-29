import 'package:flutter/material.dart';
import 'package:project_with_provider/providers/products.dart';
import 'package:project_with_provider/screens/basket.dart';
import 'package:project_with_provider/screens/home.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Products(),
      child: MaterialApp(
        title: 'Flutter Demo',
        home: const HomePage(),
        routes: {
          '/home': (context) => const HomePage(),
          '/basket': (context) => const BasketPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}