import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Add a document with auto-generated ID
  Future<DocumentReference> addDocument({
    required String collectionPath,
    required Map<String, dynamic> data,
  }) async {
    return await _db.collection(collectionPath).add(data);
  }

  /// Set (create or overwrite) a document with custom ID
  Future<void> setDocument({
    required String collectionPath,
    required String docId,
    required Map<String, dynamic> data,
    bool merge = false,
  }) async {
    await _db
        .collection(collectionPath)
        .doc(docId)
        .set(data, SetOptions(merge: merge));
  }

  /// Get a document once
  Future<DocumentSnapshot> getDocument({
    required String collectionPath,
    required String docId,
  }) async {
    return await _db.collection(collectionPath).doc(docId).get();
  }

  /// Get all document IDs from a collection
  Future<List<String>> getDocumentIds({required String collectionPath}) async {
    final snapshot = await _db.collection(collectionPath).get();
    return snapshot.docs.map((doc) => doc.id).toList();
  }

  /// Get all documents from a collection once
  Future<List<QueryDocumentSnapshot>> getCollection({
    required String collectionPath,
  }) async {
    final snapshot = await _db.collection(collectionPath).get();
    return snapshot.docs;
  }

  /// Update a document
  Future<void> updateDocument({
    required String collectionPath,
    required String docId,
    required Map<String, dynamic> data,
  }) async {
    await _db.collection(collectionPath).doc(docId).update(data);
  }

  /// Delete a document
  Future<void> deleteDocument({
    required String collectionPath,
    required String docId,
  }) async {
    await _db.collection(collectionPath).doc(docId).delete();
  }

  /// Listen to a single document changes
  Stream<DocumentSnapshot> listenDocument({
    required String collectionPath,
    required String docId,
  }) {
    return _db.collection(collectionPath).doc(docId).snapshots();
  }

  /// Listen to a collection changes
  Stream<QuerySnapshot> listenCollection({required String collectionPath}) {
    return _db.collection(collectionPath).snapshots();
  }

  /// Query with where conditions
  Future<List<QueryDocumentSnapshot>> queryCollection({
    required String collectionPath,
    String? field,
    dynamic isEqualTo,
    dynamic isGreaterThan,
    dynamic isLessThan,
    int? limit,
    String? orderBy,
    bool descending = false,
  }) async {
    Query query = _db.collection(collectionPath);

    if (field != null && isEqualTo != null) {
      query = query.where(field, isEqualTo: isEqualTo);
    }
    if (field != null && isGreaterThan != null) {
      query = query.where(field, isGreaterThan: isGreaterThan);
    }
    if (field != null && isLessThan != null) {
      query = query.where(field, isLessThan: isLessThan);
    }
    if (orderBy != null) {
      query = query.orderBy(orderBy, descending: descending);
    }
    if (limit != null) {
      query = query.limit(limit);
    }

    final snapshot = await query.get();
    return snapshot.docs;
  }

  /// Batch write example
  Future<void> batchWriteExample({
    required String collectionPath,
    required List<Map<String, dynamic>> dataList,
  }) async {
    WriteBatch batch = _db.batch();
    for (var data in dataList) {
      DocumentReference docRef = _db.collection(collectionPath).doc();
      batch.set(docRef, data);
    }
    await batch.commit();
  }

  /// Transaction example
  Future<void> runTransactionExample({
    required String collectionPath,
    required String docId,
    required Map<String, dynamic> newData,
  }) async {
    final docRef = _db.collection(collectionPath).doc(docId);
    await _db.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(docRef);

      if (!snapshot.exists) {
        throw Exception("Document does not exist!");
      }

      transaction.update(docRef, newData);
    });
  }
}
