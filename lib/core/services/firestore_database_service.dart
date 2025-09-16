import 'package:cloud_firestore/cloud_firestore.dart';

/// Generic Firestore database service
/// - If you provide [fromMap] and [toMap] -> you can work with custom models.
/// - If you don't provide them -> you work directly with Map<String, dynamic>.
class FirestoreDatabaseService<T> {
  final CollectionReference _collection;
  final T Function(Map<String, dynamic> data, String id)? fromMap;
  final Map<String, dynamic> Function(T item)? toMap;

  FirestoreDatabaseService({
    required String collectionPath,
    this.fromMap,
    this.toMap,
  }) : _collection = FirebaseFirestore.instance.collection(collectionPath);

  /// Create / Add
  Future<DocumentReference> add(T item) async {
    if (toMap != null) {
      return await _collection.add(toMap!(item));
    } else {
      return await _collection.add(item as Map<String, dynamic>);
    }
  }

  Future<void> set(String id, T item, {bool merge = false}) async {
    if (toMap != null) {
      await _collection.doc(id).set(toMap!(item), SetOptions(merge: merge));
    } else {
      await _collection
          .doc(id)
          .set(item as Map<String, dynamic>, SetOptions(merge: merge));
    }
  }

  /// Read
  Future<T?> getById(String id) async {
    final doc = await _collection.doc(id).get();
    if (!doc.exists) return null;

    if (fromMap != null) {
      return fromMap!(doc.data() as Map<String, dynamic>, doc.id);
    } else {
      return doc.data() as T?;
    }
  }

  Stream<T?> streamById(String id) {
    return _collection.doc(id).snapshots().map((doc) {
      if (!doc.exists) return null;
      if (fromMap != null) {
        return fromMap!(doc.data() as Map<String, dynamic>, doc.id);
      } else {
        return doc.data() as T?;
      }
    });
  }

  Future<List<T>> getAll() async {
    final snapshot = await _collection.get();
    return snapshot.docs.map((doc) {
      if (fromMap != null) {
        return fromMap!(doc.data() as Map<String, dynamic>, doc.id);
      } else {
        return doc.data() as T;
      }
    }).toList();
  }

  Stream<List<T>> streamAll() {
    return _collection.snapshots().map((snap) {
      return snap.docs.map((doc) {
        if (fromMap != null) {
          return fromMap!(doc.data() as Map<String, dynamic>, doc.id);
        } else {
          return doc.data() as T;
        }
      }).toList();
    });
  }

  /// Update
  Future<void> update(String id, Map<String, dynamic> data) async {
    await _collection.doc(id).update(data);
  }

  /// Delete
  Future<void> delete(String id) async {
    await _collection.doc(id).delete();
  }
}
