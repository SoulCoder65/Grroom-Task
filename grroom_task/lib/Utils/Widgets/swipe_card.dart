import 'package:flutter/material.dart';
import '../../Models/characters_model.dart';
Widget cardui_widget(BuildContext context, double screenWidth,Results results) {
  return Container(
    decoration: BoxDecoration(),
    child: Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Image.network(
        results.image,
        fit: BoxFit.fill,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: EdgeInsets.all(10),
    ),

  );
}
