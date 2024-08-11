import 'package:cloud_firestore/cloud_firestore.dart';

class Mezmure {
  final String name;
  final String mezmure;
  final String mezmureType;

  Mezmure({
    required this.name,
    required this.mezmure,
    required this.mezmureType,
  });
  factory Mezmure.fromMap(Map<dynamic, dynamic> map) {
    return Mezmure(
      name: map['name'] ?? '',
      mezmure: map['mezmure'] ?? '',
      mezmureType: map['mezmureType'] ?? '',
    );
  }

  factory Mezmure.fromFirestore(DocumentSnapshot doc) {
    return Mezmure(
      name: doc.get('name'),
      mezmure: doc.get('mezmure'),
      mezmureType: doc.get('mezmureType'),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'mezmure': mezmure,
      'mezmureType': mezmureType,
    };
  }
}
