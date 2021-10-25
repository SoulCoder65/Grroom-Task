import 'package:flutter/material.dart';

class NotDeveloped extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Not Developed Yet",
                  style: TextStyle(
                      color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10,),
                Icon(Icons.emoji_emotions_sharp,color: Colors.white,size: 25,)
              ],
            )
        ),
      ),
    );
  }
}
