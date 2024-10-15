import 'dart:convert';

import 'package:http/http.dart' as http;
import '/repositories/user_repository.dart';

import 'models/user.dart';

Future<void> main() async {
  print("VOY A LEER LOS USUARIOS....");


  try {

    try {
      List<User> users = await UserRepository().get();

      print("NUM USERS ARE: ${users.length}");
      for (var user in users) {
        print(user.toString());
      }
      print("Users fetch success");
    }catch(e){
      
      print("CATCH INTERNO $e");
    }
    print("ESTOY EN EL TRYCATCH INTERNO");
  }catch(e){
    print("Ha habido un error al obtener los usuarios: $e");
  }

  print("HASTA LUEGO Y MUCHAS GRACIAS");


  //QIUIERO SABER QUE HA PASADO


}


Future<void> fetchToDos() async {

  String url = "https://jsonplaceholder.typicode.com/todos/";

  Uri uri = Uri.parse(url);

  http.Response response = await http.get(uri);

  if(response.statusCode >= 200 && response.statusCode < 300){
    print("LLAMADA SUCCESS, STATUS CODE: ${response.statusCode}");
    //print("CONTENIDO ${response.body}");

    List<Map<String,dynamic>> parsedResponse = List.from(jsonDecode(response.body));

    for(var element in parsedResponse){
      print("ID IS: ${element["title"]}");
    }


  }else{
    print("LLAMADA ERROR, STATUS CODE: ${response.statusCode}");
  }
}



