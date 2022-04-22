import 'package:flutter/material.dart';

class AppWhiteCard extends StatelessWidget {
  final Column items;
  final double marginTop;
  final double marginHorizontal;
  final double marginBottom;
  const AppWhiteCard({
    Key? key,
    required this.items,
    this.marginTop = 0,
    this.marginHorizontal = 0,
    this.marginBottom = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: marginTop,
        right: marginHorizontal,
        left: marginHorizontal,
        bottom: marginBottom,
      ),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color.fromARGB(255, 231, 233, 236),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: items,
      ),
    );
  }
}
