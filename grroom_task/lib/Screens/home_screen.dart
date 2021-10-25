import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:grrom_task/Services/statemanagement.dart';
import 'package:provider/provider.dart';
import '../Utils/Constants/colors.dart';

//Components
import '../Utils/Widgets/home_header.dart';
import '../Utils/Widgets/swipe_card.dart';
import '../Utils/Widgets/toast.dart';
import '../Utils/Widgets/no_data.dart';

class HomeScreen extends StatefulWidget {

  static const routeName = "/homescreen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var screenWidth;
  var screenHeight;
  final String titleText = "DISCOVER";
  bool show_nope = false;
  bool show_like = false;

  final colorpallete = ColorPallete();
  CardController controller;

  //<----Save Data in Local Storage------->
  void savedDataToLike(int index)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final saved_data=prefs.getStringList('liked_characters')??[];
    if(!saved_data.contains(index.toString()))
      {
        saved_data.add(index.toString());
        prefs.setStringList('liked_characters', saved_data);


      }
        Provider.of<CharactersStateManagement>(context,listen: false).liked_char=saved_data;
    Provider.of<CharactersStateManagement>(context,listen: false).updateListeners();
  }


  //<----Save Data in Local Storage------->
  void savedDataToDislike(int index)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final saved_data=prefs.getStringList('disliked_characters')??[];
    if(!saved_data.contains(index.toString()))
    {
      saved_data.add(index.toString());
      prefs.setStringList('disliked_characters', saved_data);
      print(saved_data);

    }

    Provider.of<CharactersStateManagement>(context,listen: false).disliked_char=saved_data;
    Provider.of<CharactersStateManagement>(context,listen: false).updateListeners();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: screenWidth,
          height: screenHeight,
          color: colorpallete.bgColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                homeHeader(context, screenWidth, titleText),
                _cardUI()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _cardUI() {
    return Center(
      child: Consumer<CharactersStateManagement>(
        builder: (context, value, child) {
          if (value.characters!=null && value.characters.results.isNotEmpty) {
            return Container(
                height: screenHeight * 0.6,
                child: TinderSwapCard(
                  totalNum: value.characters.results.length,
                  animDuration: 300,
                  swipeDown: true,
                  swipeUp: true,
                  orientation: AmassOrientation.BOTTOM,
                  stackNum: 3,
                  swipeEdge: 5,
                  maxHeight: screenHeight * 0.9,
                  maxWidth: screenWidth * 0.9,
                  minHeight: screenHeight * 0.7,
                  minWidth: screenWidth * 0.8,
                  cardBuilder: (context, index) {
                    return cardui_widget(
                        context, screenWidth, value.characters.results[index]);
                  },
                  cardController: controller = CardController(),
                  swipeUpdateCallback:
                      (DragUpdateDetails details, Alignment align) {},
                  swipeCompleteCallback:
                      (CardSwipeOrientation orientation, int index) {
                    // currentIndex=index+1;

                    if (orientation == CardSwipeOrientation.RIGHT) {
                      savedDataToLike(value.characters.results[index].id);
                      showSnack(value.characters.results[index].name, context);
                    }
                    else if(orientation==CardSwipeOrientation.LEFT){
                      savedDataToDislike(value.characters.results[index].id);
                    }
                  },
                ));
          } else {
            return Container(
              width: screenWidth,
              height: screenHeight*0.6,
              child: Center(
                child: noDataWidget(context, "Something went wrong",true)
              ),
            );
          }
        },
      ),
    );
  }
}
