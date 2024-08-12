import 'package:baseleal/models/gallery/galler_folder_model.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<List<GalleryFolder>> fetchingGaller() async {
  List<GalleryFolder> galleryFolders = [];
  try {
    final firebaseStorage = FirebaseStorage.instance.ref('gallery');

    final foldersAndFiles = await firebaseStorage.listAll();

    for (var folders in foldersAndFiles.prefixes) {
      // chang the folders name to the child name
      String nameChild = folders.fullPath.replaceAll('gallery/', '');
      final filesInfolders = await firebaseStorage.child(nameChild).listAll();

      // find the number of files it has
      String inFolderLength = filesInfolders.items.length.toString();

      // get one file url
      final oneImageurl = await filesInfolders.items.first.getDownloadURL();

      // store it in a string
      String imageUrl = oneImageurl;

      galleryFolders.add(
        GalleryFolder(
          folderName: nameChild,
          imagesInFolder: '$inFolderLength photos',
          folderImageurl: imageUrl,
        ),
      );
    }
  } catch (e) {
    return galleryFolders;
  }

  return galleryFolders;
}
