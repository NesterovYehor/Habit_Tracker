import 'package:flutter/material.dart';
import 'package:habit_tracker/screens/home/home_view.dart';
import 'package:habit_tracker/screens/home/home_viewmodel.dart';
import 'package:habit_tracker/theme/light_theme.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async{
  await Hive.initFlutter();

  await Hive.openBox("Habit_Database");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeViewModel())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomeView(),
        theme: lightTheme,
      ),
    );
  }
}