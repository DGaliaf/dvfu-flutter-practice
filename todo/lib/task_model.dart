import 'package:hive/hive.dart';
 
part 'task_model.g.dart';
 
@HiveType(typeId: 0)
class Task {
  @HiveField(0)
  String task;
 
  // Просто пример для следующего атрибута 
  // @HiveField(1)
  // bool проверен;
 
  Task({this.task});
}