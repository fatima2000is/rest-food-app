import 'dart:developer';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:rest_food/Core/api/api.dart';
import 'package:rest_food/view/homepage.dart';
import 'package:rest_food/view/models/gridviewproduit.dart';
import 'package:rest_food/widget/categorylist.dart';

class HomeDetail extends StatefulWidget {
  const HomeDetail({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeDetail> createState() => _HomeDetailState();
}

class _HomeDetailState extends State<HomeDetail> {
  final items = const [
    Icon(
      Icons.favorite,
      size: 30,
    ),
    Icon(
      Icons.home,
      size: 30,
    ),
    Icon(
      Icons.person,
      size: 30,
    ),
  ];
  int index = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        index: index,
        onTap: (i) {
          setState(() {
            index = i;
          });
        },
        height: 70,
        backgroundColor: Color.fromARGB(115, 255, 172, 64),
        animationDuration: const Duration(seconds: 1),
      ),
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(13),
            child: Row(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const MyHomePage()));
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 24,
                    )),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintText: "Search ",
                                hintStyle: TextStyle(fontSize: 15)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.only(right: 10),
                            height: 40,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Colors.orangeAccent.shade700,
                                borderRadius: BorderRadius.circular(50)),
                            child: const Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 70,
            child: ListView(
              padding: const EdgeInsets.all(10),
              scrollDirection: Axis.horizontal,
              children: [
                CategoryList(
                  press: () {},
                  title: 'Restaurants',
                ),
                CategoryList(
                  press: () {},
                  title: 'Cofee Shop',
                ),
                CategoryList(
                  press: () {},
                  title: 'Pasta Shop',
                ),
                CategoryList(
                  press: () {},
                  title: 'Salad Shop',
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(9),
            child: const Text(
              " Popular Food ",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          FoodProduct(),
        ]),
      ),
    );
  }
}
