
import 'package:flutter/material.dart';
import 'package:latihan_api/DetailedView.dart';
import 'package:latihan_api/PostView.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter GetX API Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PostView(),
        getPages: [
      GetPage(name: '/detail', page: () => DetailView()),
    ],
    );
  }
}