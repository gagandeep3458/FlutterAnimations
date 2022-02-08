import 'package:flutter/material.dart';

class ExplicitAnimationDemoOne extends StatefulWidget {
  const ExplicitAnimationDemoOne({Key? key}) : super(key: key);

  @override
  _ExplicitAnimationDemoOneState createState() =>
      _ExplicitAnimationDemoOneState();
}

class _ExplicitAnimationDemoOneState extends State<ExplicitAnimationDemoOne>
    with SingleTickerProviderStateMixin {
  int secondsForFullRotation = 5;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: Duration(seconds: secondsForFullRotation), vsync: this)
      ..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.black,
      padding: const EdgeInsets.all(36.0),
      child: Column(mainAxisSize: MainAxisSize.max, children: [
        const Spacer(),
        RotationTransition(
          child: SizedBox(
              width: double.infinity,
              child: Image.asset(
                "assets/galaxy.png",
                fit: BoxFit.cover,
              )),
          alignment: Alignment.center,
          turns: _animationController,
        ),
        const Spacer(),
        Text(
          "$secondsForFullRotation seconds for a Rotation",
          style: const TextStyle(color: Colors.white),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          TextButton(
              onPressed: decreaseSpeed,
              child: const Text(
                "Decrease Speed",
                style: TextStyle(color: Colors.white),
              )),
          TextButton(
              onPressed: increaseSpeed,
              child: const Text("Increase Speed",
                  style: TextStyle(color: Colors.white)))
        ])
      ]),
    ));
  }

  decreaseSpeed() {
    _animationController.duration = Duration(
        seconds: (secondsForFullRotation < 20) ? ++secondsForFullRotation : 20);
    _animationController.repeat();
    setState(() {});
  }

  increaseSpeed() {
    _animationController.duration = Duration(
        seconds: (secondsForFullRotation > 1) ? --secondsForFullRotation : 1);
    _animationController.repeat();
    setState(() {});
  }
}
