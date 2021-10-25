import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/characters_model.dart' as Ch;
import 'api_service.dart';
class CharactersStateManagement with ChangeNotifier{

  bool isLoading=false;
  get isloading=>isLoading;
  Ch.Characters characters;
  List<String> liked_char=[];
  List<String> disliked_char=[];
  void updateListeners() {
    notifyListeners();
  }
//  <-------Get Char response----->

Future<void> get_char_response(BuildContext context)
{
  try{
    ApiService().fetch_char_list().then((data)=>{
      if(data!=null)
        {
          characters=data,
          updateListeners(),

        }
    });
  }catch(e)
  {

  }
}

}