import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  // get collection of events
  final CollectionReference events =
      FirebaseFirestore.instance.collection('event');

  // CREATE : add a new event
  Future<void> addEvent(String event) {
    return events.add({
      'events': event,
      'timestamp': Timestamp.now(),
    });
  }

  // READ : get events from database
  Stream<QuerySnapshot> getEventsStream() {
    final eventsStream =
        events.orderBy('timestamp', descending: true).snapshots();

    return eventsStream;
  }

  // UPDATE : update events given a doc id
  Future<void> updateEvent(String docID, String newEvent) {
    return events.doc(docID).update({
      'events': newEvent,
      'timestamp': Timestamp.now(),
    });
  }

<<<<<<< HEAD
  void updateTodos(String todoId, Todos todos) {}

  void deleteTodos(String todoId) async {
  try {
    await _event1Ref.doc(todoId).delete();
  } catch (e) {
    print("Failed to delete todo: $e");
  }
}

=======
  // DELETE : delete events given a doc id
  Future<void> deleteEvent(String docID) {
    return events.doc(docID).delete();
  }
>>>>>>> 7a7fa2ffc4e12c3791641a6ad4b0aaad5b7e3bcd
}
