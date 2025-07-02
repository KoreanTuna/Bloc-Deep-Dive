import 'package:door_stamp/util/logger.dart';
import 'package:door_stamp/util/result.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FirestoreRepsitory {
  FirestoreRepsitory._(this._firestore);

  final FirebaseFirestore _firestore;
  factory FirestoreRepsitory() {
    return FirestoreRepsitory._(FirebaseFirestore.instance);
  }
  Result<DocumentReference> getDoc({required String path, String? docId}) {
    try {
      final DocumentReference reference = _firestore
          .collection(path)
          .doc(docId);
      return Result.ok(reference);
    } catch (e) {
      logger.d('getDocError: $e');
      return Result.error(Exception('Failed to get document reference'));
    }
  }

  Future<Result<QuerySnapshot>> getCollection({required String path}) async {
    try {
      final QuerySnapshot snapshot = await _firestore.collection(path).get();
      return Result.ok(snapshot);
    } catch (e) {
      logger.d('getCollectionError: $e');
      return Result.error(Exception('Failed to get collection'));
    }
  }

  Stream<QuerySnapshot> getStream({required String path}) {
    try {
      return _firestore.collection(path).snapshots();
    } catch (e) {
      logger.d('getStreamError: $e');
      rethrow;
    }
  }

  Future<Result<QuerySnapshot>> getCollectionWithWhere({
    required String path,
    required String field,
    required String value,
  }) async {
    try {
      final QuerySnapshot snapshot =
          await _firestore
              .collection(path)
              .where(field, isEqualTo: value)
              .get();
      return Result.ok(snapshot);
    } catch (e) {
      logger.d('getCollectionWithWhereError: $e');
      return Result.error(Exception('Failed to get collection with where'));
    }
  }

  Future<Result<QuerySnapshot>> getCollectionWithOrderBy({
    required String path,
    required String field,
    bool? descending,
  }) async {
    try {
      final QuerySnapshot snapshot =
          await _firestore
              .collection(path)
              .orderBy(field, descending: descending ?? false)
              .get();
      return Result.ok(snapshot);
    } catch (e) {
      logger.d('getCollectionOrderByError: $e');
      return Result.error(Exception('Failed to get collection with order by'));
    }
  }

  Future<Result<void>> updateData({
    required String path,
    required String docId,
    required Map<String, dynamic> args,
  }) async {
    try {
      await _firestore.collection(path).doc(docId).update(args);
      return Result.ok(null);
    } catch (e) {
      logger.d('updateDataError: $e');
      return Result.error(Exception('Failed to update document'));
    }
  }

  Future<Result<void>> addData({
    required String path,
    required Map<String, dynamic> args,
  }) async {
    try {
      await _firestore.collection(path).add(args);
      return Result.ok(null);
    } catch (e) {
      logger.d('addDataError: $e');
      return Result.error(Exception('Failed to add document'));
    }
  }

  Future<Result<void>> setData({
    required String path,
    required Map<String, dynamic> args,
  }) async {
    try {
      await _firestore
          .collection(path)
          .doc()
          .set(args, SetOptions(merge: true));
      return Result.ok(null);
    } catch (e) {
      logger.d('addDataError: $e');
      return Result.error(Exception('Failed to set document'));
    }
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getDocStream({
    required String path,
    required String docId,
  }) {
    try {
      return _firestore.collection(path).doc(docId).snapshots();
    } catch (e) {
      logger.d('getDocStreamError: $e');
      rethrow;
    }
  }
}
