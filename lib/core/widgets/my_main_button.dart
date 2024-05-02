import 'package:flutter/material.dart';
import 'package:market_app_web_2/core/style/app_colors.dart';

// ignore: must_be_immutable
class MyMainButton extends StatefulWidget {
  final BuildContext context;
  Function onTap;
  final String title;
  final EdgeInsetsGeometry margin;

  MyMainButton({
    super.key,
    required this.context,
    required this.onTap,
    required this.title,
    this.margin = const EdgeInsetsDirectional.all(0),
  });

  @override
  State<MyMainButton> createState() => _MyMainButtonState();
}

class _MyMainButtonState extends State<MyMainButton> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: widget.margin,
      child: InkWell(
        onTap: () {
          widget.onTap();
        },
        child: Container(
          height: (screenWidth * .04).clamp(55, 65),
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.primaryColor,
                  offset: Offset(2, 4),
                  blurRadius: 15,
                )
              ]),
          child: Center(
              child: Text(widget.title,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ))),
        ),
      ),
    );
  }
}
