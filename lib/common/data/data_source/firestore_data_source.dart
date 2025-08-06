import 'package:door_stamp/core/util/logger.dart';
import 'package:door_stamp/core/util/result.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@singleton
class FirestoreDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  DocumentReference getDoc({required String path, String? docId}) {
    final DocumentReference reference = _firestore.collection(path).doc(docId);

    return reference;
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
    required String collectionPath,
    String? docId,
    required Map<String, dynamic> args,
  }) async {
    /// docId가 주어지면 해당 ID로 문서를 추가, 주어지지 않으면 자동으로 생성
    if (docId != null) {
      try {
        await _firestore.collection(collectionPath).doc(docId).set(args);
        return Result.ok(null);
      } catch (e) {
        logger.d('addDataError: $e');
        return Result.error(Exception('Failed to add document with ID'));
      }
    }

    /// docId가 주어지지 않으면 자동으로 문서를 추가
    /// 주의: 이 경우 Firestore는 자동으로 ID를 생성합니다.
    /// 따라서, 문서가 추가된 후에 해당 ID를 알 수 없습니다.
    /// 만약 ID가 필요하다면, 문서를 추가한 후에 해당 문서의 ID를 가져와야 합니다.
    /// 예시: final docRef = await _firestore.collection(collectionPath).add(args);
    ///       final docId = docRef.id;
    ///       return Result.ok(docId);
    ///
    /// 주석 처리된 코드는 예시로 남겨두었습니다.

    try {
      await _firestore.collection(collectionPath).add(args);
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
          .where(
            'id',
            isEqualTo: args['id'],
          )
          .get()
          .then((snapshot) {
            if (snapshot.docs.isNotEmpty) {
              final docId = snapshot.docs.first.id;
              return _firestore
                  .collection(path)
                  .doc(docId)
                  .set(args, SetOptions(merge: true));
            } else {
              return _firestore.collection(path).add(args);
            }
          });

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
