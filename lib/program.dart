

import 'dart:io';

import '/models/todo.dart';
import '/repositories/todo_repository.dart';

Future<void> main() async {

  var result = "0";

  while(result != "4"){
    showMenu();
    var result = stdin.readLineSync();
    print("RESULT IS: $result");

    switch(result){
      case "1":
        print("SHOW TODOS");
        await showToDos();
        break;
      case "2":
        await checkSingleTodo();
        break;
      case "3":
        await checkPendingToDo();
        break;
      default:
        print("Opción desconocida, selecciona otra opción");

    }


  }


}

Future<void> checkSingleTodo() async {

  print("¿Cual quieres ver (introduce el id):");

  String? result = stdin.readLineSync();

  //ELIMINO LA POSIBILIDAD DE QUE RESULT SEA NULL
  result = result ?? "0";
  //CONVERTIR A INT EL RESULT QUE TENGO EN FORMATO TEXTO

  int? intResult = int.tryParse(result);

  // POR EJEMPLO LEERE "23"

  if(intResult != null) {
    try {
      Todo todo = await TodoRepository().getDetail(intResult);
      print("EL TODO SOLICITADO CON ID $intResult es ${todo.title}");
    }catch(e){
      print("ERROR, LA PETICIÓN NO HA PODIDO REALIZARSE: $e");
    }
  }else{
    print("Opción incorrecta");
  }
}


Future<void> checkPendingToDo() async {

  print("los pending son:");
  //AQUI IMPLEMENTAREMOS LA LECTURA Y MUESTRA DE TODOS
  var todos = await TodoRepository().get();

  for(var todo in todos) {
    if (todo.completed == false){
    print("TODO ${todo.title} is  accepted ?  : ${todo.completed}");
      }
    }

}


Future<void> showToDos() async {
  //AQUI IMPLEMENTAREMOS LA LECTURA Y MUESTRA DE TODOS
  var todos = await TodoRepository().get();

  print("TODOS LENGTH: ${todos.length}");

  for(var todo in todos){
    print("TODO ${todo.title}   accepted : ${todo.completed}");
  }
}

void showMenu(){
  print("1. Ver listado de todos los ToDos");
  print("2. Ver un ToDo concreto");
  print("3. Ver listado de ToDos pendientes");
  print("4. Salir");
}