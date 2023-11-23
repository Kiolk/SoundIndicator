import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class SoundIndicatorWidget extends StatefulWidget {
  const SoundIndicatorWidget({Key? key, this.height = 24, this.width = 24}) : super(key: key);

  final double height;
  final double width;

  @override
  State<SoundIndicatorWidget> createState() => _SoundIndicatorWidgetState();
}

class _SoundIndicatorWidgetState extends State<SoundIndicatorWidget> {
  late Timer _timer;
  final Random _random = Random();

  static const int updateDuration = 50;

  int height1 = 10;
  int height2 = 20;
  int height3 = 15;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: updateDuration), (timer) {
      setState(() {
        height1 = randomizeForNumber(10, height1);
        height2 = randomizeForNumber(20, height2);
        height3 = randomizeForNumber(15, height3);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [SoundBar(height: height1), SoundBar(height: height2), SoundBar(height: height3)],
      ),
    );
  }

  int randomizeForNumber(int init, int last) {
    var random = _random.nextInt(init);
    return random < init / 3 ? last : random;
  }
}

class SoundBar extends StatelessWidget {
  const SoundBar({
    super.key,
    required this.height,
  });

  static const int animationDuration = 200;

  final int height;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 4,
      height: height.toDouble(),
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      duration: const Duration(milliseconds: animationDuration),
      curve: Curves.bounceInOut,
    );
  }
}
