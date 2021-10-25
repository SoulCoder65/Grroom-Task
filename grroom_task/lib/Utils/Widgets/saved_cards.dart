import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grrom_task/Models/characters_model.dart';
import 'package:grrom_task/Services/statemanagement.dart';
import 'package:grrom_task/Utils/Widgets/home_header.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void removeData(BuildContext context,int index)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();

  final saved_data=prefs.getStringList('liked_characters')??[];
  saved_data.remove(index.toString());
  prefs.setStringList('liked_characters', saved_data);
  Provider.of<CharactersStateManagement>(context,listen: false).liked_char=prefs.getStringList('liked_characters')??[];
  Provider.of<CharactersStateManagement>(context,listen: false).updateListeners();
}

Widget savedCard(
    BuildContext context, Results results,bool showRemove) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    child: Card(
      color: Colors.white38,
      elevation: 5,
      child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(
                        width: 1.0, color: Colors.brown.shade100))),
            child: CachedNetworkImage(
                imageUrl:results.image,
                imageBuilder: (context, imageProvider) => Container(
                      width: MediaQuery.of(context).size.width * 0.1,
                      height: 40.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) {
                  return CircularProgressIndicator();
                },
            ),
          ),
          title: AutoSizeText(
            results.name,
            style: GoogleFonts.montserrat(color: colorpallete.textColor,fontSize: 20),
            maxLines: 2,
          ),
          trailing: showRemove?Container(
            child: IconButton(
              icon: Icon(
                FontAwesome.remove,
                color:colorpallete.textColor,
                size: 26.0,
              ),
              onPressed: () {
                removeData(context,results.id);
              },
            ),
          ):SizedBox()),
    ),
  );
}
