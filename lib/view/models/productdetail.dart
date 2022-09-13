import 'package:flutter/material.dart';
import 'package:rest_food/view/homedetail.dart';
import 'package:rest_food/view/models/platjson.dart';

class ProductDetail extends StatefulWidget {
  final PlatJson productde;
  const ProductDetail({Key? key, required this.productde}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int i = 0;
  
  void increment() {
    setState(() {
      i++;
    });
  }

  void decrement() {
    setState(() {
      i--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      appBar: AppBar(
        //backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Color.fromARGB(195, 185, 128, 63),
                Color.fromARGB(220, 207, 150, 97),
                //Color.fromARGB(43, 255, 145, 0)
              ])),
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const HomeDetail()));
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(widget.productde.title!),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: double.infinity,
            decoration: const BoxDecoration(
                // gradient: LinearGradient(
                //     end: Alignment.topCenter,
                //     begin: Alignment.bottomCenter,
                //     colors: [
                //       Color.fromARGB(127, 231, 161, 80),
                //       Color.fromARGB(220, 207, 150, 97),
                //       Color.fromARGB(43, 255, 145, 0)
                //     ]),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
            child: Image.asset(
              widget.productde.image!,
              //colorBlendMode: BlendMode.colorBurn,
              fit: BoxFit.cover,
              scale: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              children: [
                const Text(
                  "There are so many ways to describe food, including taste, texture, preparation style, and more. Whether you’re looking to spice up your food related vocabulary or you’re simply looking for the right words to describe food you’ve eaten or prepared recently, there are plenty of options to consider. Learning new ways to describe food can help you find the perfect culinary terms",
                  maxLines: 4,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.brown,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 17,
                ),
                Row(
                  children: [
                    Text(
                      "\$${widget.productde.price}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 138, 149, 156),
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Text(
                      "${widget.productde.rating}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 138, 149, 156),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: decrement,
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: <Color>[
                                  Color.fromARGB(195, 185, 128, 63),
                                  Color.fromARGB(220, 207, 150, 97),
                                  //Color.fromARGB(43, 255, 145, 0)
                                ])),
                        child: const Icon(Icons.remove),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "$i",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: increment,
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: <Color>[
                                  Color.fromARGB(195, 185, 128, 63),
                                  Color.fromARGB(220, 207, 150, 97),
                                  Color.fromARGB(43, 255, 145, 0)
                                ])),
                        child: const Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  color:const  Color.fromARGB(153, 141, 126, 82),
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  height: 40,
                  minWidth: double.infinity,
                  child: const Text(
                    "Add To Cart",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
