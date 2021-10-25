import 'package:flutter/material.dart';
import 'package:grrom_task/Services/statemanagement.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


void loadData(BuildContext context)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Provider.of<CharactersStateManagement>(context,listen: false).get_char_response(context);

  final liked_data=prefs.getStringList('liked_characters')??[];
  final disliked_data=prefs.getStringList('disliked_characters')??[];
  Provider.of<CharactersStateManagement>(context,listen: false).liked_char=liked_data;
  Provider.of<CharactersStateManagement>(context,listen: false).disliked_char=disliked_data;

}