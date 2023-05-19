final String todoTable = 'Todo';

// This class is the model for the sqlite database table columns for the todolist we will save in the database later.:)
class TodoFields {
  static final String id = 'id';
  static final String title = 'title';
  static final String created = 'created';
  static final String status = 'done';

  static final List<String> allFields = [id, title, created, status];
}

// Here is the todo class to hold the data as in the real data model
class Todo {
  int? id;
  final String title;
  final DateTime created;
  bool status;

  Todo(
      {this.id, 
      required this.title,
      required this.created,
      this.status = false});

  // This is the method to turn the user entries into a map to insert into the database :)
  Map<String, Object?> toJson() => {
        TodoFields.id : id,
        TodoFields.title: title,
        TodoFields.created: created.toIso8601String(),
        TodoFields.status: status ? 1 : 0
      };

  static Todo fromJson(Map<String, Object?> json) => Todo(
        id: json[TodoFields.id] as int,
        title: json[TodoFields.title] as String,
        status: json[TodoFields.status] == 1 ? true : false,
        created: DateTime.parse(json[TodoFields.created] as String),
      );

  @override
  bool operator ==(covariant Todo todo) {
    return (this.title == todo.title) &&
        (this.title.toUpperCase().compareTo(todo.title.toUpperCase()) == 0);
  }

  // @override
  // int get hashcode {
  //   return hashValues(title, status);
  // }
}
