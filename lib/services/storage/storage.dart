/* import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:ouniee/services/database/database.dart';

class StorageService {
  //!STORAGE REFERENCE
  final _storage = FirebaseStorage.instance;

  //!STORAGE FOR IMAGES
  Future uploadImage({required String email, required File file}) async {
    await _storage
        .ref()
        .child('$email/Profile_Picture/${file.path.split("/").last}')
        .putFile(file)
        .then((element) async {
      String url = await element.ref.getDownloadURL();
      await DatabaseService(email: email, uid: "")
          .updateDownloadLinks(imageDownloadLinks: url);
    });
  }
}
 */