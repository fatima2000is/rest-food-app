import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:rest_food/view/homepage.dart';

import 'package:rest_food/view/login_screen.dart';
import 'dart:math' as math;

import 'package:rest_food/widget/centerWidget.dart';
import 'package:rest_food/widget/social_btn_login.dart';

// ignore: camel_case_types
class Register_Screen extends StatefulWidget {
  const Register_Screen({Key? key}) : super(key: key);

  @override
  State<Register_Screen> createState() => _Register_ScreenState();
}

// ignore: camel_case_types
class _Register_ScreenState extends State<Register_Screen> {
  Widget topWidget(double screenWidth) {
    return Transform.rotate(
      angle: -35 * math.pi / 180,
      child: Container(
        width: 1.2 * screenWidth,
        height: 1.2 * screenWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(150),
            gradient: const LinearGradient(
                begin: Alignment(-0.2, -0.8),
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(127, 231, 161, 80),
                  Color.fromARGB(220, 207, 150, 97),
                  Color.fromARGB(43, 255, 145, 0)
                ])),
      ),
    );
  }

  Widget bottomWidget(double screenWidth) {
    return Container(
      width: 1.5 * screenWidth,
      height: 1.5 * screenWidth,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(127, 231, 161, 80),
            Color.fromARGB(220, 207, 150, 97),
            Color.fromARGB(43, 255, 145, 0)
          ],
          begin: Alignment(0.6, -1.1),
          end: Alignment(0.7, 0.8),
        ),
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();

  bool isvisible = true;

  bool conforminvisible = true;

  TextEditingController _emailController = TextEditingController();
  TextEditingController firstname = TextEditingController();

  TextEditingController _passwordController = TextEditingController();
  TextEditingController confirmpasswordTextController = TextEditingController();

  TextEditingController lastName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0Xffffe4b5),
      //backgroundColor: Color.fromARGB(22, 248, 193, 130),
      body: Stack(children: [
        Positioned(top: -160, left: -30, child: topWidget(screenSize.width)),
        Positioned(
          bottom: -250,
          left: -6,
          child: bottomWidget(screenSize.width),
        ),
        Positioned(
          child: CentreWidget(
            size: screenSize,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Email";
                        }
                        //now we use email validator package
                        // ignore: no_leading_underscores_for_local_identifiers
                        final bool _isvalid =
                            EmailValidator.validate(_emailController.text);
                        if (!_isvalid) {
                          return "Email was entered incorrectly";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.email_outlined),
                        hintText: "Email",
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: TextFormField(
                      controller: firstname,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter First Name";
                        }

                        return null;
                      },
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.person_outline),
                        hintText: "First Name",
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: TextFormField(
                      controller: lastName,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Last Name";
                        }

                        return null;
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.person_outline),
                        hintText: "Last Name",
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  //password field
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: TextFormField(
                      obscureText: isvisible,
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Password";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isvisible = !isvisible;
                            });
                          },
                          icon: isvisible == true
                              ? const Icon(Icons.visibility)
                              : const  Icon(Icons.visibility_off),
                        ),
                        hintText: "Password",
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  //confirm password field
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: TextFormField(
                      obscureText: conforminvisible,
                      controller: confirmpasswordTextController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Password";
                        }
                        if (_passwordController.text !=
                            confirmpasswordTextController.text) {
                          return "Password not Matched";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {});
                          },
                          icon:  const Icon(Icons.visibility),
                        ),
                        hintText: "Re-Enter Password",
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //sign Up Button
                  MaterialButton(
                    color: Colors.green,
                    minWidth: double.infinity,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    height: 50,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyHomePage()));
                      }
                    },
                    child: const Text(
                      "Sign Up ",
                      style: TextStyle(
                        color: Color.fromARGB(255, 73, 61, 15),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                const   SocialLoginBtn(),
                  const SizedBox(
                    height: 26,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already a member ?",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: const Text(
                          "Log in",
                          style: TextStyle(
                              fontSize: 27,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
