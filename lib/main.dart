// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:eventifyapp/firebase_options.dart';
import 'package:eventifyapp/views/home_event.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'notification/firebase_notification.dart';
import 'package:eventifyapp/ui/todos_page_test.dart';
=======
>>>>>>> 7a7fa2ffc4e12c3791641a6ad4b0aaad5b7e3bcd

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
<<<<<<< HEAD
      title: 'ToDos',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
     home: TodosPageTest(),
=======
      home: Homepage(),
>>>>>>> 7a7fa2ffc4e12c3791641a6ad4b0aaad5b7e3bcd
    );
  }
}
