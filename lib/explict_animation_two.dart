import 'package:flutter/material.dart';

class ExplicitAnimationDemoTwo extends StatefulWidget {
  const ExplicitAnimationDemoTwo({Key? key}) : super(key: key);

  @override
  _ExplicitAnimationDemoTwoState createState() =>
      _ExplicitAnimationDemoTwoState();
}

class _ExplicitAnimationDemoTwoState extends State<ExplicitAnimationDemoTwo>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4))
          ..repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: BeamTransition(animationController: animationController)));
  }
}

class BeamTransition extends StatelessWidget {
  const BeamTransition({
    Key? key,
    required this.animationController,
  }) : super(key: key);

  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (_, __) {
        return ClipPath(
          clipper: const BeamClipper(),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.amber, Colors.amber.withOpacity(0.0)],
                    stops: [0.0, animationController.value],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          ),
        );
      },
    );
  }
}

class BeamClipper extends CustomClipper<Path> {
  const BeamClipper();

  @override
  Path getClip(Size size) {
    print(size);
    return Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(size.width / 2, 0)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
