import 'package:flutter/material.dart';

class CentreWidget extends StatelessWidget {
  final Size size;
  const CentreWidget({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment(1, -0.6),
              end: Alignment(-1, 0.8),
              colors: [
                Color.fromARGB(220, 207, 150, 97),
                Color.fromARGB(127, 231, 161, 80),
                Color.fromARGB(43, 255, 145, 0)
              ],
            )),
          ),
        )
      ],
    );
  }
}
