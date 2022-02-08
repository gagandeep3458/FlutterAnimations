import 'dart:async';

import 'package:flutter/material.dart';

class ImplicitAnimationPage extends StatefulWidget {
  const ImplicitAnimationPage({Key? key}) : super(key: key);

  @override
  State<ImplicitAnimationPage> createState() => _ImplicitAnimationPageState();
}

class _ImplicitAnimationPageState extends State<ImplicitAnimationPage> {
  bool isExpanded = false;

  StreamController<bool> expandWidgetController = StreamController<bool>();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: StreamBuilder(
                  stream: expandWidgetController.stream,
                  initialData: false,
                  builder: (context, snapshot) {
                    if (!snapshot.hasError && snapshot.hasData) {
                      return AnimatedContainer(
                        height: (snapshot.data as bool) ? 200 : 100,
                        width: (snapshot.data as bool) ? 200 : 100,
                        color: Colors.amber,
                        duration: const Duration(seconds: 2),
                        curve: Curves.easeOutCubic,
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  isExpanded = !isExpanded;
                  expandWidgetController.add(isExpanded);
                },
                child: const Text("Toogle Expand"))
          ],
        ));
  }
}
