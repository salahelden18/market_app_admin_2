import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoadingShapeFullScreen extends StatelessWidget {
  LoadingShapeFullScreen(
      {super.key, required this.child, required this.condition});
  Widget child;
  bool condition;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (condition)
          Container(
              color: Colors.black26,
              child: const Center(child: CircularProgressIndicator())),
      ],
    );
  }
}
