import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/repositories/person_repository.dart';
import 'package:darts_link_project/repositories/store_owner_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppUserRepository {
  static Future<AppUser?> fetchAppUser(String uid) async {
    final person = await PersonRepository.fetchPerson(uid);
    if (person != null) {
      return person;
    }
    final storeOwner = await StoreOwnerRepository.fetchStoreOwner(uid);
    if (storeOwner != null) {
      return storeOwner;
    }
  }

  static DocumentReference getAppUserDocRef(AppUser appUser) {
    if (appUser is Person) {
      return PersonRepository.getDocumentRef(appUser.id);
    }
    return StoreOwnerRepository.getDocumentRef(appUser.id);
  }
}
