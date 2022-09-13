import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rest_food/view/homedetail.dart';
import 'package:rest_food/view/login_screen.dart';
import 'package:rest_food/widget/cardjson.dart';
import 'package:rest_food/widget/cardfood.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  //signout function
  signOut() async {
    await auth.signOut();
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        height: screenheight,
        width: screenwidth,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.menu)),
                      const Text(
                        "food",
                        style: TextStyle(
                            fontSize: 50,
                            fontStyle: FontStyle.italic,
                            fontFamily: "Samantha"),
                      ),
                      IconButton(
                          onPressed: () {
                            signOut();
                          },
                          icon: const Icon(Icons.logout_rounded))
                    ],
                  ),
                ),
                CarsFood(),
                const SizedBox(
                  height: 8,
                ),
                const SizedBox(height: 400, child: Cardshorizontale()),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomeDetail()));
        },
        focusColor: Colors.amber,
        backgroundColor: const Color.fromARGB(255, 141, 108, 8),
        child: const Icon(Icons.restaurant_menu_rounded),
      ),
    );
  }
}
