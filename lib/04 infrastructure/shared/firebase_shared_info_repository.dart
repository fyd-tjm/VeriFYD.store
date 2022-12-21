import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:verifyd_store/04%20infrastructure/core/firebase_helper.dart';
import 'package:verifyd_store/04%20infrastructure/shared/shared_failure_mapper.dart';

import '../../03 domain/shared/00_export_shared_domain.dart';

@LazySingleton(as: ISharedInfoRepository)
class FirebaseSharedInfoRepository implements ISharedInfoRepository {
  final FirebaseFirestore _firestore;
  FirebaseSharedInfoRepository(this._firestore);

  @override
  Stream<Either<SharedInfoFailure, SharedInfo>> getSharedInfo() async* {
    final sharedDoc = _firestore
        .sharedInfoCollection()
        .where('docType', isEqualTo: 'main')
        .withConverter<SharedInfo>(
            fromFirestore: (snapshot, _) =>
                SharedInfo.fromJson(snapshot.data()!),
            toFirestore: (model, _) => model.toJson());

    yield* sharedDoc.snapshots().map((qSnapshot) {
      return right<SharedInfoFailure, SharedInfo>(qSnapshot.docs.first.data());
    }).onErrorReturnWith((e, stackTrace) {
      return left(SharedInfoFailureMapper.failureMapper(e));
    });
  }
}
