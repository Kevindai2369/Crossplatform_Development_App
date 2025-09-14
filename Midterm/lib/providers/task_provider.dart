import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = [];
  String _filterCategory = "All";

  List<Task> get tasks {
    if (_filterCategory == "All") return _tasks;
    return _tasks.where((t) => t.category == _filterCategory).toList();
  }

  List<String> get categories {
    final cats = _tasks.map((t) => t.category).toSet().toList();
    cats.insert(0, "All");
    return cats;
  }

  String get filterCategory => _filterCategory;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void setFilter(String category) {
    _filterCategory = category;
    notifyListeners();
  }
}
