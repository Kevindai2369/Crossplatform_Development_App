import 'package:flutter/material.dart';
import '/l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';

class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog({super.key});

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  final _titleController = TextEditingController();
  final _categoryController = TextEditingController();
  DateTime? _deadline;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return AlertDialog(
      title: Text(loc.addTask),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: loc.taskTitle),
            ),
            TextField(
              controller: _categoryController,
              decoration: InputDecoration(labelText: loc.category),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  _deadline == null
                      ? loc.deadline
                      : _deadline.toString().split(" ")[0],
                ),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2100),
                    );
                    if (date != null) {
                      setState(() {
                        _deadline = date;
                      });
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(loc.cancel),
        ),
        ElevatedButton(
          onPressed: () {
            if (_titleController.text.isNotEmpty &&
                _categoryController.text.isNotEmpty) {
              final task = Task(
                title: _titleController.text,
                category: _categoryController.text,
                deadline: _deadline,
              );
              Provider.of<TaskProvider>(context, listen: false).addTask(task);
              Navigator.pop(context);
            }
          },
          child: Text(loc.save),
        ),
      ],
    );
  }
}
