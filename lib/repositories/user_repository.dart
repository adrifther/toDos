
import 'dart:convert';

import '../models/user.dart';
import 'package:http/http.dart' as http;

class UserRepository{

  Future<List<User>> get() async {
    String url = "https://jsonplaceholder.typicode.com/usersrt/";



    Uri uri = Uri.parse(url);

    var response = await http.get(uri);

    if(response.statusCode >= 200 && response.statusCode < 300){

      List<Map<String,dynamic>> parsedResponse = List.from(jsonDecode(response.body));

      //AQUI TENEMOS UNA LISTA DE MAPS

      List<User> users = parsedResponse.map(
              (element){
            return User.fromJson(element);
          }
      ).toList();

      return users;

    }else{
      throw Exception("Error de conexión status code: ${response.statusCode}");
    }
  }

}