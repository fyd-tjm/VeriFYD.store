import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:verifyd_store/domain/shared/i_shared_info_repository.dart';
import 'package:verifyd_store/domain/shared/shared_info_failure.dart';
import 'package:verifyd_store/domain/shared/shared_info.dart';
import 'package:verifyd_store/infrastructure/core/firebase_helper.dart';
import 'package:rxdart/rxdart.dart';

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
      if (e is FirebaseException && e.message!.contains('permission-denied')) {
        return left(const SharedInfoFailure.permissionDenied());
      } else {
        log(e.toString());
        return left(const SharedInfoFailure.unexpected());
      }
    });
  }
}
