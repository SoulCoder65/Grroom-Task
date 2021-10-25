import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Constants/colors.dart';

final colorpallete = ColorPallete();

Widget homeHeader(BuildContext context, double screenWidth,String titleText) {
  return Container(
    width: screenWidth,
    padding: const EdgeInsets.all(15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          titleText,
          style: GoogleFonts.montserrat(
              fontSize: 25, color: colorpallete.textColor,fontWeight: FontWeight.w500),
        ),
        InkWell(
          onTap: () {
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: CircleAvatar(
              radius: 20.0,
              backgroundImage:
              NetworkImage('https://picsum.photos/id/1005/200/300'),
              backgroundColor: Colors.transparent,
            ),
          ),
        )
      ],
    ),
  );
}
