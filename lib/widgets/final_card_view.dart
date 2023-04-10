import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

import '../model/recipe.dart';
import '../model/recipes.dart';

class FinalCarView extends StatefulWidget {
  final int idx;
  const FinalCarView({super.key, required this.idx});

  @override
  State<FinalCarView> createState() => _FinalCarViewState();
}

class _FinalCarViewState extends State<FinalCarView> {
  @override
  Widget build(BuildContext context) {
    List<Recipe> recipe = Provider.of<Recipes>(context).finalIng();

    return InkWell(
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: recipe[widget.idx].imgUrl),
                      ),
                    )),
                Positioned(
                  bottom: 10,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.all(Radius.circular(2))),
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    width: 330,
                    child: Text(
                      recipe[widget.idx].label,
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.all(20),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [
            //       Row(
            //         children: [
            //           Icon(Icons.schedule),
            //           SizedBox(
            //             width: 6,
            //           ),
            //           Text('${duration} min'),
            //         ],
            //       ),
            //       Row(
            //         children: [
            //           Icon(Icons.work),
            //           SizedBox(
            //             width: 6,
            //           ),
            //           Text('$complexityText'),
            //         ],
            //       ),
            //       Row(
            //         children: [
            //           Icon(Icons.attach_money),
            //           SizedBox(
            //             width: 6,
            //           ),
            //           Text('$affordabilityText'),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
