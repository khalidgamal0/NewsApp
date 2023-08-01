import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class cahe_helper{
  static SharedPreferences? sharedpreferences;
  static init()async{
      sharedpreferences= await SharedPreferences.getInstance();
  }
 static Future<bool> putbooldat ({@required String?key,@required bool?value})
 async{
  return await sharedpreferences!.setBool(key!, value!);
  }
  static bool? getbooldat({@required String?key}){
   return sharedpreferences!.getBool(key!);
  }

}