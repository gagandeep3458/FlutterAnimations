import 'package:flutter/material.dart';

class TweenAnimationPage extends StatefulWidget {
  const TweenAnimationPage({Key? key}) : super(key: key);

  @override
  State<TweenAnimationPage> createState() => _TweenAnimationPageState();
}

class _TweenAnimationPageState extends State<TweenAnimationPage> {
  double currentSliderValue = 0;
  Color currentColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TweenAnimationBuilder(
                child: Icon(
                  Icons.access_time_filled_outlined,
                  size: 200,
                  color: currentColor,
                ),
                tween: ColorTween(begin: Colors.red, end: currentColor),
                duration: const Duration(milliseconds: 200),
                builder: (_, Color? color, Widget? child) {
                  return Center(
                    child: ColorFiltered(
                        child: child,
                        colorFilter: ColorFilter.mode(
                            color ?? Colors.white, BlendMode.modulate)),
                  );
                }),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Slider.adaptive(
                  value: currentSliderValue,
                  onChanged: (double value) {
                    final color = Color.lerp(Colors.red, Colors.yellow, value);
                    setState(() {
                      currentSliderValue = value;
                      currentColor = color ?? Colors.white;
                    });
                  }),
            )
          ],
        ),
      ),
    );
  }
}
