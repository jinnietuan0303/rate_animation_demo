import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class TopPage extends StatefulWidget {
  const TopPage({super.key});

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  SMIInput<double>? _rating;

  void _onRiveInit(Artboard artboard) {
    final controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');
    artboard.addController(controller!);
    _rating = controller.findInput<double>('rating') as SMINumber;
  }

  void _changeRating(double rate) => _rating?.change(rate);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textController = TextEditingController();

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(color: Colors.black),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 512,
              width: 512,
              child: RiveAnimation.asset(
                'assets/rating_animation.riv',
                onInit: _onRiveInit,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () => _changeRating(1),
                      child: const Text('1')),
                  ElevatedButton(
                      onPressed: () => _changeRating(2),
                      child: const Text('2')),
                  ElevatedButton(
                      onPressed: () => _changeRating(3),
                      child: const Text('3')),
                  ElevatedButton(
                      onPressed: () => _changeRating(4),
                      child: const Text('4')),
                  ElevatedButton(
                      onPressed: () => _changeRating(5),
                      child: const Text('5')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
