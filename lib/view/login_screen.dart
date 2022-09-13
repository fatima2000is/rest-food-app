import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rest_food/view/homepage.dart';
import 'package:rest_food/view/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No User found for that email");
      }
    }
    return user;
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    bool _isObscure = true;
    // ignore: no_leading_underscores_for_local_identifiers
    TextEditingController _emailController = TextEditingController();
    // ignore: no_leading_underscores_for_local_identifiers
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                end: Alignment.topCenter,
                begin: Alignment.bottomCenter,
                colors: [
              Color.fromARGB(127, 231, 161, 80),
              Color.fromARGB(220, 207, 150, 97),
              Color.fromARGB(43, 255, 145, 0)
            ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Login",
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Welcome Back",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  //margin: EdgeInsets.only(right: 20, left: 20),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(59, 255, 255, 255),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60))),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      end: Alignment.topCenter,
                                      begin: Alignment.bottomCenter,
                                      colors: [
                                        Color.fromARGB(127, 231, 161, 80),
                                        Color.fromARGB(220, 207, 150, 97),
                                        Color.fromARGB(43, 255, 145, 0)
                                      ]),
                                  //borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                        color:
                                            Color.fromARGB(127, 187, 151, 138),
                                        blurRadius: 20,
                                        offset: Offset(0, 10)),
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: TextFormField(
                                  controller: _emailController,

                                  keyboardType: TextInputType.emailAddress,
                                  // cursorColor: Colors.amber,
                                  decoration: InputDecoration(
                                    focusedBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    prefixIcon: const Icon(
                                      Icons.mail,
                                      color: Colors.white,
                                    ),
                                    hintText: "Entre your email or your phone",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email ';
                                    }
                                    // final bool _isvalid = Email
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      end: Alignment.topCenter,
                                      begin: Alignment.bottomCenter,
                                      colors: [
                                        Color.fromARGB(127, 231, 161, 80),
                                        Color.fromARGB(220, 207, 150, 97),
                                        Color.fromARGB(43, 255, 145, 0)
                                      ]),
                                  //borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                        color:
                                            Color.fromARGB(127, 187, 151, 138),
                                        blurRadius: 20,
                                        offset: Offset(0, 10)),
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty || value.length < 8) {
                                        return 'Password cannot be empty and must be at least 8 chars!';
                                      }
                                      // ignore: unnecessary_null_comparison
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter you password';
                                      }
                                      return null;
                                    },
                                    controller: _passwordController,
                                    obscureText: _isObscure,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Entrer votre password",
                                      prefixIcon: const Icon(
                                        Icons.lock,
                                        color: Colors.white,
                                      ),
                                      suffixIcon: IconButton(
                                          icon: const Icon(Icons.visibility,
                                              color: Colors.white),
                                          onPressed: () {
                                            setState(() {});
                                          }),
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400]),
                                    )),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          GestureDetector(
                              onTap: () {},
                              child: const Text(
                                "Forget Password",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.grey),
                              )),
                          const SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () async {
                              log(_emailController.text);
                              log(_passwordController.text);
                              // User? user =
                              //     await LoginScreen.loginUsingEmailPassword(
                              //         email: _emailController.text,
                              //         password: _passwordController.text,
                              //         context: context);
                              // log(user.toString());
                              // if (user != null) {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => const MyHomePage()));
                            },
                            child: Container(
                              height: 40,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                    end: Alignment.topCenter,
                                    begin: Alignment.bottomCenter,
                                    colors: [
                                      Color.fromARGB(127, 231, 161, 80),
                                      Color.fromARGB(220, 207, 150, 97),
                                      Color.fromARGB(43, 255, 145, 0)
                                    ]),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: const Center(
                                child: Text(
                                  "Login ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      letterSpacing: 1.7,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Center(
                            child: Text(
                              " Connect with social media  ",
                              style: TextStyle(
                                  fontSize: 20,
                                  letterSpacing: 1.7,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.all(14),
                                      elevation: 3,
                                      onPrimary: Colors.white,
                                      primary: Colors.black12,
                                      minimumSize: const Size(150, 50),
                                      side: const BorderSide(
                                          color: Color.fromARGB(
                                              255, 151, 142, 142),
                                          width: 1),
                                      shape: BeveledRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      textStyle: const TextStyle(fontSize: 23)),
                                  onPressed: () {},
                                  icon: const Icon(Icons.facebook_outlined),
                                  label: const Text("Githup")),
                              ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.all(14),
                                      elevation: 3,
                                      onPrimary: Colors.white,
                                      primary: Colors.blueAccent,
                                      minimumSize: const Size(150, 50),
                                      side: const BorderSide(
                                          color: Color.fromARGB(
                                              255, 151, 142, 142),
                                          width: 1),
                                      shape: BeveledRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      textStyle: const TextStyle(fontSize: 23)),
                                  onPressed: () {},
                                  icon: const Icon(Icons.facebook_outlined),
                                  label: const Text("Facebook")),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Register_Screen()));
                                },
                                child: RichText(
                                  text: const TextSpan(
                                    text: "D'ont have Count ? ",
                                    style: TextStyle(fontSize: 16),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Registre Now',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Color.fromARGB(
                                                  255, 134, 92, 76),
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
