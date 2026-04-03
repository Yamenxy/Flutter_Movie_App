import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/models/profileModel.dart';

abstract class Cloudfirestoreutils {
  static CollectionReference<Profilemodel> getCollectionReference() {
    return FirebaseFirestore.instance
        .collection(Profilemodel.collectionName)
        .withConverter<Profilemodel>(
            fromFirestore: (snapshot, _) {
              final data =snapshot.data();
              if(data==null) return Profilemodel(id: snapshot.id);
               return Profilemodel.fromFireStore(snapshot.data()!,snapshot.id);},
            toFirestore: (value, _) => value.toFireStore());
  }

  static Stream<Profilemodel?> getProfileStream(String id) {

    var doc= getCollectionReference()
        .doc(id)
        .snapshots()
        .map((doc) {
          print("Doc Exists: ${doc.exists}");
          print("Doc Data: ${doc.data()}");
          return doc.data();
    });
     return doc;
  }

  static Future<bool> updateProfile(Profilemodel profile) async {
    try {
      CollectionReference collectionReference = getCollectionReference();
      var docRef = collectionReference.doc(profile.id);
      await docRef.set(profile);
      return true;
    } catch (error) {
      return false;
    }
  }
  static Future<void> deleteProfile(Profilemodel profile) async {
    CollectionReference collectionReference = getCollectionReference();
    var docRef = collectionReference.doc(profile.id);
    await docRef.delete();
  }
}
