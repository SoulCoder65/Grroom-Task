import 'package:flutter/material.dart';
import 'package:grrom_task/Utils/Widgets/home_header.dart';
import 'package:grrom_task/Utils/initialdata.dart';

Widget noDataWidget(BuildContext context,String text,bool retry)
{
  return Container(
    color: Colors.black,
    width: MediaQuery.of(context).size.width,

    child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                  color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10,),
            retry?IconButton(icon: Icon(Icons.refresh,color: colorpallete.textColor,size: 50,), onPressed: () {
            loadData(context);
            },):Icon(Icons.emoji_emotions_sharp,color: Colors.white,size: 25,)
          ],
        )
    ),
  );
}