import 'package:flutter/material.dart';
import 'package:tween_animation/explict_animation_two.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Animation demo",
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const ExplicitAnimationDemoTwo(),
    );
  }
}
