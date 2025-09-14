import 'package:flutter/material.dart';
import '/l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../widgets/add_task_dialog.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.tasks),
        actions: [
          DropdownButton<String>(
            value: taskProvider.filterCategory,
            onChanged: (value) {
              if (value != null) {
                taskProvider.setFilter(value);
              }
            },
            items: taskProvider.categories
                .map(
                  (cat) => DropdownMenuItem(
                    value: cat,
                    child: Text(cat == "All" ? loc.all : cat),
                  ),
                )
                .toList(),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: taskProvider.tasks.length,
        itemBuilder: (context, index) {
          final task = taskProvider.tasks[index];
          return ListTile(
            title: Text(task.title),
            subtitle: Text(
              "${task.category}${task.deadline != null ? " - ${task.deadline}" : ""}",
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                taskProvider.removeTask(task);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (_) => const AddTaskDialog());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
