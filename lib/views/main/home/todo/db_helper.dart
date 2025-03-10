import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteHelper {
  final String dbName = 'todo.db';
  final String todoList = "todoList";
  final String id = "id";
  final String title = "title";
  final String status = "status";

  // all methods in this class are asynchronous because they involve I/O operations.
  Future<Database> openMyDatabase() async {
    return await openDatabase(
      // join method is used to join the path of the database with the path of the app's document directory.
      join(await getDatabasesPath(), dbName),
      // The version of the database. This is used to manage database schema changes.
      version: 1,
      // onCreate is a callback function that is called ONLY when the database is created for the first time.
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $todoList($id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, $title TEXT, $status  INTEGER)',
        );
        //Here we are creating a table named todoList with three columns: id, title, and status.
        //The id column is the primary key and is set to autoincrement.
        //We use INTEGER for the status column because SQLite does not have a boolean data type.
        //Instead, we use 0 for false and 1 for true.
      },
    );
  }

  Future<void> insertTask({
    required String titleData,
    required bool statusData,
  }) async {
    //db is the instance of the database that we get from the openMyDatabase function.
    final db = await openMyDatabase();
    //after getting the database instance, we insert the task into the todoList table.
    //insert method takes three arguments: the name of the table, the data to be inserted, and the conflictAlgorithm.
    //data is a map with the column names as keys and the values to be inserted as values.
    //We use ConflictAlgorithm.replace to replace the task if it already exists.
    //here we don't need to insert the id column because it is set to autoincrement.
    db.insert(todoList, {
      title: titleData,
      status: statusData ? 1 : 0,
      //We use 1 for true and 0 for false.
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteTask(int id) async {
    final db = await openMyDatabase();
    //delete method takes two arguments: the name of the table and the where clause.
    //we are using unique id for each task as the where clause to delete the task with the given id.
    db.delete(todoList, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateTask(int id, bool statusData) async {
    final db = await openMyDatabase();
    //update method takes four arguments: the name of the table, the data to be updated, the where clause, and the whereArgs.
    //In this case, we are updating the status of the task with the given id.
    db.update(
      todoList,
      {
        status: statusData ? 1 : 0,
        //We use 1 for true and 0 for false.
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Map<String, dynamic>>> getTasks() async {
    final db = await openMyDatabase();
    //query method is used to get the tasks from thetodoListtable.
    //It takes the name of the table as an argument.
    //and returns a list of maps where each map represents a task.
    //like [{id: 1, title: 'Task 1', status: 1}, {id: 2, title: 'Task 2', status: 0}]
    return db.query(todoList);
    // return await
  }
}
