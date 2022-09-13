import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  CategoryList({Key? key, required this.title, required this.press})
      : super(key: key);
  final String title;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: () {},
        child: Chip(
            backgroundColor:const  Color.fromARGB(255, 187, 197, 204),
            //shadowColor: Colors.orange,

            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            label: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                title,
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 116, 71, 14)),
              ),
            )),
      ),
    );
  }
}
