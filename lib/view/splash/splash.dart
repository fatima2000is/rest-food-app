

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:rest_food/view/splash/splash_screen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Container(
           // child: Image.asset("images/télécharger.jpg")),
         
         ), const SizedBox(
            height: 8,
          ),
          const Text(
            " Resto Food ",
            style: TextStyle(
                color: Color.fromARGB(174, 168, 77, 24),
                fontSize: 40,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
      backgroundColor:const  Color.fromARGB(255, 228, 133, 56),
      nextScreen: const Splash_Screen(),
      splashIconSize: 250,
      duration: 400,
      splashTransition: SplashTransition.sizeTransition,
      animationDuration: const Duration(seconds: 2),
    );
  }
}
