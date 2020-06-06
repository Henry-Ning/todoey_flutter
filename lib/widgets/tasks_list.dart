import 'package:flutter/material.dart';
import 'package:todoeyflutter/widgets/tasks_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoeyflutter/models/task_data.dart';


class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              onLongPress: () {
                taskData.deleteTask(index);
              },
              taskTitle: taskData.tasks[index].name,
              isChecked: taskData.tasks[index].isDone,
              checkboxCallback: (checkboxState) {
                taskData.updateTask(taskData.tasks[index]);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}