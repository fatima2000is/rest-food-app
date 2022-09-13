import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rest_food/Core/api/api.dart';
import 'package:rest_food/view/models/produit_Card1.dart';

class Cardshorizontale extends StatefulWidget {
  const Cardshorizontale({Key? key}) : super(key: key);

  @override
  State<Cardshorizontale> createState() => _CardshorizontaleState();
}

class _CardshorizontaleState extends State<Cardshorizontale> {
   String? valueChose;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Api.readdatajson(),
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Error"),
            );
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final List<Produitjson> listcardhorizon =
              snapshot.data! as List<Produitjson>;
          log(listcardhorizon.length.toString());
          log(listcardhorizon.toString());

          // ignore: unused_local_variable
          //List<dynamic> listdata = Object["placeItems"];

          return ListView.builder(
            shrinkWrap: true,
            // scrollDirection: Axis.vertical,
            itemCount: listcardhorizon.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  //color: Colors.white,
                  margin: const EdgeInsets.all(9),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(111, 205, 134, 63),
                            spreadRadius: 3,
                            blurRadius: 5)
                      ]),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                        child: Image(
                          image: AssetImage(listcardhorizon[index].placeImage!),
                          fit: BoxFit.cover,
                          width: 80,
                          height: 80,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(8),
                        child: Column(
                            //mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                listcardhorizon[index].placeName!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 141, 108, 8)),
                              ),
                              // Row(
                              //     children: List.generate(
                              //         listcardhorizon[index].placeItems!.length,
                              //         (i) => Text(listcardhorizon[index]
                              //             .placeItems![i]))),
                              DropdownButton(
                                hint: const Text("Choisi votre plats"),
                                dropdownColor:
                                    const Color.fromRGBO(109, 105, 105, 0.38),
                                //iconSize: 30,
                                //isExpanded: true,
                                style: const TextStyle(),
                                value: valueChose,
                                onChanged: (newval) {
                                  setState(() {
                                    valueChose != newval;
                                  });
                                },
                                items: listcardhorizon[index]
                                    .placeItems!
                                    .map((valueItem) {
                                  return DropdownMenuItem(
                                      value: valueItem,
                                      child: Text(
                                        valueItem,
                                      ));
                                }).toList(),
                              )
                            ]),
                      ),
                      //Text("Min order : $listcardhorizon[index].minOrder!")
                    ],
                  ),
                ),
              );
            }),
          );
        }));
  }
}
