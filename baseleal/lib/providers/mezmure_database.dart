import 'package:baseleal/models/mezmure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';

class MezmureDatabase {
  final CollectionReference _mezmuresCollection =
      FirebaseFirestore.instance.collection('mezmures');
  final _myBox = Hive.box('myBox');
  List<Mezmure> mezmures = [];

  // Fetch data from Firestore and store it in Hive (first-time launch)
  Future<void> createInitState() async {
    try {
      final querySnapshot = await _mezmuresCollection.get();
      mezmures =
          querySnapshot.docs.map((doc) => Mezmure.fromFirestore(doc)).toList();
      _myBox.put(
          'MEZMURELIST',
          mezmures
              .map((m) => m.toMap())
              .toList()); // Using toMap for custom storage (optional)
      // ignore: avoid_print
      print('Mezmures fetched and stored in Hive!');
    } on FirebaseException catch (e) {
      // Handle Firebase errors gracefully, e.g., display an error message
      // ignore: avoid_print
      print('Error fetching data: $e');
    }
  }

  // Load data from Hive (subsequent launches)
  void loadDataState() {
    final storedMezmures = _myBox.get('MEZMURELIST');
    if (storedMezmures != null) {
      mezmures = (storedMezmures as List)
          .map((m) => Mezmure.fromMap(m))
          .toList(); // Assuming toMap conversion
    }
  }

  // Updating the database (assuming you have a way to modify mezmures)
  void updateTheDatabase() {
    _myBox.put(
        'MEZMURELIST',
        mezmures
            .map((m) => m.toMap())
            .toList()); // Using toMap for custom storage (optional)
    // Consider also updating Firestore if needed for consistency
  }

  // ... rest of your app code
}
