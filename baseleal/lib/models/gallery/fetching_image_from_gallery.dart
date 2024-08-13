import 'package:firebase_storage/firebase_storage.dart';

Future<List<String>> fetchImageFromGallery(String foldersName) async {
  List<String> imageurls = [];
  try {
    final firebaseStorage = await FirebaseStorage.instance
        .ref('gallery')
        .child(foldersName)
        .listAll();

    for (var image in firebaseStorage.items) {
      var a = await image.getDownloadURL();
      imageurls.add(a);
    }
  } catch (e) {
    print('fetching images: $e');
  }

  return imageurls;
}
