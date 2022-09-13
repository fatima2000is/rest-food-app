import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:rest_food/Core/api/api.dart';
import 'package:rest_food/view/homedetail.dart';
import 'package:rest_food/view/models/platjson.dart';
import 'package:rest_food/view/models/productdetail.dart';

class FoodProduct extends StatefulWidget {
  FoodProduct({
    Key? key,
  }) : super(key: key);

  @override
  State<FoodProduct> createState() => _FoodProductState();
}

class _FoodProductState extends State<FoodProduct> {


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Api.importdatajson(),
      builder: ((context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("Error"),
          );
        }
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final List<PlatJson> gridlistproduit = snapshot.data! as List<PlatJson>;
        log(gridlistproduit.length.toString());
        log(gridlistproduit.toString());

        return Expanded(
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 5.0),
              itemCount: gridlistproduit.length,
              itemBuilder: (BuildContext ctx, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (  text) =>   ProductDetail(productde: gridlistproduit[index],),
                    ));
                  },
                  child: Container(
                    // height: double.infinity,
                    width: 800,
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: const Color(0xff808000).withOpacity(0.19),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          gridlistproduit[index].image!,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          gridlistproduit[index].title!,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            Text(
                              "\$${gridlistproduit[index].price}",
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
                              "${gridlistproduit[index].rating}",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 138, 149, 156),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
        );
      }),
    );
  }
}
