import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:eventifyapp/models/todos.dart';
import 'package:eventifyapp/services/database_service.dart';

class TodosPageTest extends StatelessWidget{
 final DatabaseService _databaseService = DatabaseService();
  final TextEditingController _taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos App'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration: InputDecoration(
                      hintText: 'Enter new task',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_taskController.text.isNotEmpty) {
                      final todo = Todos(
                        tasks: _taskController.text,
                        isDone: false,
                        createdOn: Timestamp.now(),
                        updatedOn: Timestamp.now(),
                      );
                      _databaseService.addTodos(todo);
                      _taskController.clear();
                    }
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<List<Todos>>(
              stream: _databaseService.getTodos().map((snapshot) {
                return snapshot.docs
                    .map((doc) => doc.data() as Todos)
                    .toList();
              }),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                final todos = snapshot.data ?? [];
                if (todos.isEmpty) {
                  return Center(child: Text('No tasks found.'));
                }
                return ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    final todo = todos[index];
                    return ListTile(
                      title: Text(
                        todo.tasks,
                        style: TextStyle(
                          decoration: todo.isDone
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      trailing: Checkbox(
                        value: todo.isDone,
                        onChanged: (value) {
                          final updatedTodo = todo.copyWith(
                            isDone: value,
                            updatedOn: Timestamp.now(),
                          );
                          _databaseService.updateTodos(todo.tasks, updatedTodo);
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}