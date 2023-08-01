import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class diohelper{
  static Dio? dio;
  static init(){
    dio=Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      )
    );
  }

  static Future<Response>getData({
  @required String?method_url,
  @required Map<String,dynamic>? query,
  })async
  {
    return await dio!.get(method_url!,queryParameters:query);
  }

}
