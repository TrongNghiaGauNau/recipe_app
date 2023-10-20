import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:recipe_food_app/auth/user_info_payload.dart';
import 'package:recipe_food_app/constants/firebase_collection_name.dart';
import 'package:recipe_food_app/constants/firebase_filed_name.dart';
import 'package:recipe_food_app/typdef/typdef.dart';

@immutable
class UserInfoStorage {
  const UserInfoStorage();

  Future<bool> saveUserInfo({
    required UserId userId,
    required String displayName,
    required String? email,
  }) async {
    try {
      //first check if we have this user's info from before
      final userInfo = await FirebaseFirestore.instance
          .collection(FirebaseCollectionName.users)
          .where(
            FirebaseFieldName.userId,
            isEqualTo: userId,
          )
          .limit(1)
          .get();

      if (userInfo.docs.isNotEmpty) {
        //we already have this user's info
        await userInfo.docs.first.reference.update({
          FirebaseFieldName.displayName: displayName,
          FirebaseFieldName.email: email ?? '',
        });
        return true;
      }

      //we don't have this user's info from before
      final payload = UserInfoPayload(
        userId: userId,
        displayName: displayName,
        email: email,
      );
      await FirebaseFirestore.instance
          .collection(
            FirebaseCollectionName.users,
          )
          .add(
            payload,
          );
      return true;
    } catch (e) {
      return false;
    }
  }
}
