import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final void Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(onPressed: deleteFunction,
            icon: Icons.delete_forever_sharp,
            backgroundColor: Colors.redAccent,
            borderRadius: BorderRadius.circular(12),)
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              children: [
                //checkbox
                Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                  activeColor: Colors.black87,
                ),

                //task name
                Text(
                  taskName,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'JetBrains',
                    fontSize: 17,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
