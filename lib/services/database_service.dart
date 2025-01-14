import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventifyapp/models/todos.dart';

const String TODOS_COLLECTION_REF = "event1";

class DatabaseService {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _event1Ref;

  DatabaseService() {
    _event1Ref =
        _firestore.collection(TODOS_COLLECTION_REF).withConverter<Todos>(
            fromFirestore: (snapshots, _) => Todos.fromJson(
                  snapshots.data()!,
                ),
            toFirestore: (todos, _) => todos.toJson());
  }

  Stream<QuerySnapshot> getTodos() {
    return _event1Ref.snapshots();
  }

  void addTodos(Todos todos) async {
    _event1Ref.add(todos);
  }

  void updateTodos(String todoId, Todos todos) {}
}
