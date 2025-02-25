import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../base_model_provider.dart';
import 'task.dart';
import 'tasks_dbworker.dart';
import 'tasks_model.dart';

part 'tasks_model_provider.g.dart';

@riverpod
class TasksModelNotifier extends BaseModelNotifier<TasksModel> {
  TasksModelNotifier() : super(TasksModel());
  //TasksModelNotifier(super.state);

  TasksModel build(){
    var model = TasksModel();
    loadData("tasks", TasksDBWorker.db);
    return model;
  }

  void editTask(Task task) {
    state = state.copyWith(entityBeingEdited: task);
  }

}