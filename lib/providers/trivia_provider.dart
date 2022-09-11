import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class TriviaProvider extends ChangeNotifier{

  String _baseURl = '192.168.100.66:8080';
  final storage = new FlutterSecureStorage();
  List<dynamic> categoriesList = [];
  List<dynamic> questionsList = [];

  TriviaProvider(){
    print('TriviaProvider inicializado');
    storage.deleteAll();

  }

  createNewUser(payload)async {
    var url = Uri.http(_baseURl ,'/v1/auth/sign-up');
    var response = await http.post( url ,body: payload,headers: {'Content-Type':'application/json'});

    return response.statusCode;
  }

  loginApp (payload) async {
    var url = Uri.http(_baseURl ,'/v1/auth/sign-in');
    print('loging request loading...');
    var response = await http.post( url ,body: payload,headers: {'Content-Type':'application/json'});
    var responseDecode =json.decode(response.body);
    print(responseDecode['token']);
    await storage.write(key: 'token', value: responseDecode['token']);
    print(await storage.read(key: 'token'));

    return response.statusCode;
  }

  getCategories() async {
    var url = Uri.http(_baseURl ,'/v1/categories');
    var token = await storage.read(key: 'token');
    print('categories get loading...');
    var response = await http.get( url ,headers:
    {
      'Content-Type':'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    var responseDecode =json.decode(response.body);
    print(responseDecode);
    categoriesList = responseDecode;
    return response.statusCode;
  }

  getQuestionOfCategories(uuid) async {
    print('questions get loading...');
    await storage.write(key: 'categorySelected', value: uuid);
    var url = Uri.http(_baseURl ,'/v1/categories/${uuid}/questions');
    var token = await storage.read(key: 'token');

    var response = await http.get( url ,headers:
    {
      'Content-Type':'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    var responseDecode =json.decode(response.body);
    print(responseDecode);

    questionsList =responseDecode;

    return response.statusCode;
  }

  postGameAnswer (payload) async{
    print('enviando juego');
    var token = await storage.read(key: 'token');
    var category = await storage.read(key: 'categorySelected');
    Map game ={
      "category_id":category,
      "time_played": 360.15,
      "attempts": payload
    };
    var url = Uri.http(_baseURl ,'/v1/games');
    var response = await http.post( url ,body: json.encode(game),headers: {'Content-Type':'application/json','Authorization': 'Bearer $token'});
    var responseDecode =json.decode(response.body);
    print(responseDecode);
    return response.statusCode;
  }

  logout (){
    storage.deleteAll();

  }

}