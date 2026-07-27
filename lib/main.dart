import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'auth_service.dart';

void main() {

  // Required for Windows SQLite
  sqfliteFfiInit();

  databaseFactory = databaseFactoryFfi;

  runApp(const GroceryApp());
}


class GroceryApp extends StatelessWidget {

  const GroceryApp({super.key});


  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: "AI Grocery App",

      theme: ThemeData(
        primarySwatch: Colors.green,
      ),

      home: const AuthService(),

    );

  }

}