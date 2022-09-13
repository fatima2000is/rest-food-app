
import 'package:flutter/material.dart';
// ignore: must_be_immutable
class CarsFood extends StatelessWidget {
  CarsFood({Key? key}) : super(key: key);
  List<String> cardsItems = [
    "Burger",
    "Chese Chilly",
    "Noodles",
    "Pizza",
  ];
  List<String> cardsImages = [
    "images/burger.jpg",
    "images/cheesechilly.jpg",
    "images/noodles.jpg",
    "images/pizza.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    List<Widget> cards = <Widget>[];
    PageController controller =
        PageController(viewportFraction: 0.8, initialPage: 1);
    for (int i = 0; i < cardsItems.length; i++) {
      var cardsView = Padding(
          padding: const  EdgeInsets.all(10),
          child: Container(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black54,
                            offset: Offset(4.0, 4.0),
                            blurRadius: 5,
                            spreadRadius: 1)
                      ]),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    cardsImages[i],
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black38])),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cardsItems[i],
                        style:  const TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      const Text(
                        "More than 40 % ",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      )
                    ],
                  ),
                )
              ],
            ),
          ));
      cards.add(cardsView);
    }
    return InkWell(
      onTap: () {
        print("yes");
      },
      child: SizedBox(
        height: screenwidth * 9 / 16,
        width: screenwidth,
        child: PageView(
          controller: controller,
          scrollDirection: Axis.horizontal,
          children: cards,
        ),
      ),
    );
  }
}
