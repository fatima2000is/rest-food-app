// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rest_food/view/login_screen.dart';
// import 'package:rest_food/view/homepage.dart';
// import 'package:rest_food/view/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: camel_case_types
class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  final PageController _controller = PageController();
  bool onlastpage = false;
  Future<FirebaseApp> _initializefirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                children: const [
                  splashimages(
                    images: "images/R.jpg",
                  ),
                  splashimages(
                    images: "images/splash2.jpg",
                  ),
                  splashimages(
                    images: "images/splash3.jpg",
                  ),
                ],
              ),
            ),
            Expanded(
                child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "Choisis votre  favorable plats \nfrom the fatima restorat or coffe",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 19,
                      letterSpacing: 0.3),
                ),
                const SizedBox(
                  height: 60,
                ),
                SmoothPageIndicator(
                    effect: const SlideEffect(
                        spacing: 8.0,
                        radius: 4.0,
                        dotWidth: 24.0,
                        dotHeight: 16.0,
                        paintStyle: PaintingStyle.stroke,
                        strokeWidth: 1.5,
                        dotColor: Colors.grey,
                        activeDotColor: Color((0xffA5682A))),
                    controller: _controller,
                    count: 3),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: MaterialButton(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    minWidth: double.infinity,
                    height: 50,
                    color: const Color.fromARGB(255, 223, 143, 69),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Scaffold(
                          body: FutureBuilder(
                              future: _initializefirebase(),
                              builder: ((context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  return const LoginScreen();
                                }
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              })),
                        );
                      }));
                    },
                    child: const Text(
                      "Next",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 223, 143, 69)),
                    ))
              ],
            ))
          ],
        ),
      ]),
    );
  }
}

// ignore: camel_case_types
class splashimages extends StatelessWidget {
  const splashimages({
    Key? key,
    required this.images,
  }) : super(key: key);
  final String images;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WaveClip(),
      child: SizedBox(
        width: double.infinity,
        child: Image.asset(
          images,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
        ),
      ),
    );
  }
}

class WaveClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // Path path = new Path();
    var path = Path();
    final lowPoint = size.height - 20;
    final highPoint = size.height - 40;
    path.lineTo(0.0, size.width);
    path.quadraticBezierTo(
        size.width / 9, size.height, size.width / 4, size.height);
    path.quadraticBezierTo(size.width - (size.width / 2), size.height,
        size.width, size.height - 40);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
