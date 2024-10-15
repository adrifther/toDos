
import 'dart:convert';

import '/constants.dart';
import '/models/todo.dart';
import 'package:http/http.dart' as http;

// TodoRepository().get();

class TodoRepository{

  //AQUI ANIRIEN LES PROPIETATS PERO NO EN TE

  Future<List<Todo>> get() async {

    String url = "https://jsonplaceholder.typicode.com/todos/";

    Uri uri = Uri.parse(url);

    var response = await http.get(uri);

    print("STATUS CODE: ${response.statusCode}");

    if(response.statusCode >= 200 && response.statusCode < 300){

      //MI RESPUESTA ESTA EN EL BODY
      //TRANSFORMAR LA RESPUESTA "STRING" A MAP<STRING,DYNAMIC>

      List<Map<String,dynamic>> parsedResponse = List.from(jsonDecode(response.body));

      //TENEMOS EL FORMATO MAP

      List<Todo> todos = parsedResponse.map(
          (element){
            print("ELEMENT $element");
            return Todo.fromJson(element);
          }
      ).toList();

      return todos;

    }else{
      throw Exception("Error leyendo todos de la red ${response.statusCode}");
    }

  }


  Future<Todo> getDetail(int id) async {
    var url = "$kBaseUrl/todos/$id";

    Uri uri = Uri.parse(url);

    var response = await http.get(uri);

    if(response.statusCode >= 200 && response.statusCode < 300){

      Map<String,dynamic> parsedResponse = jsonDecode(response.body);

      return Todo.fromJson(parsedResponse);

    }else{
      throw Exception("Error leyendo el todo $id");
    }



  }


}