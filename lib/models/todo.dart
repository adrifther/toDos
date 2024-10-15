

class Todo{

  int userId;
  int id;
  String title;
  bool completed;

  Todo({required this.userId,required this.id, required this.title, required this.completed});

  factory Todo.fromJson(Map<String,dynamic> json){
    return Todo(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
      completed: json["completed"]
    );
  }

  //CODIGO NO NECESARIO: AS EXAMPLE OF ANOTHER FACTORY
  factory Todo.sampleTodo(String title){
    return Todo(
      userId:-1,
      id: -1,
      title:title,
      completed: false
    );

  }

}