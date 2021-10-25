import 'package:flutter/material.dart';
import 'package:grrom_task/Services/statemanagement.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
//Components
import '../Utils/Widgets/home_header.dart';
import '../Utils/Constants/colors.dart';
import '../Utils/Widgets/saved_cards.dart';
import '../Utils/Widgets/no_data.dart';
class SwipeLeftScreen extends StatefulWidget {
  static const routeName = "swipeleftscreen";
  @override
  _SwipeLeftScreenState createState() => _SwipeLeftScreenState();
}

class _SwipeLeftScreenState extends State<SwipeLeftScreen> {
  var screenWidth;
  var screenHeight;
  final String titleText = "MY DISLIKES";
  final colorpallete = ColorPallete();

  Future<List<String>> getsaved_lefts()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final saved_data=prefs.getStringList('disliked_characters')??[];
    return saved_data;
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Stack(
          children: [
            Container(
              width: screenWidth,
              height: screenHeight,
              color: colorpallete.bgColor,

            ),

            homeHeader(context, screenWidth, titleText),
            Positioned(
                top: screenHeight*0.15,
                child: Consumer<CharactersStateManagement>(
                  builder: (context, value, child) {
                    if (value.characters!=null && value.characters.results.isNotEmpty)
                    {

                      return Container(
                        padding: const EdgeInsets.only(bottom: 50),
                        width: screenWidth,
                        height: screenHeight*0.8,
                        child: value.disliked_char.isNotEmpty?ListView.builder(
                          itemCount: value.disliked_char.length,
                          itemBuilder: (context, index) {
                           
                            if(value.disliked_char.contains(value.characters.results[index].id.toString()))
                            {

                              return savedCard(context, value.characters.results[index],false);
                            }
                            else{
                              return SizedBox();
                            }
                          },):noDataWidget(context, "No Data To Show",false),
                      );
                    }else{
                      return noDataWidget(context, "No Data To Show",false);
                    }
                  },
                ))
          ],
        ));
  }
}
