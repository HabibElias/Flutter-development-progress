import 'package:flutter/material.dart';
import '../models/mezmure.dart';
// import '../models/mezmures/lefelegeh.dart' as lefelegeh;
// import '../models/mezmures/menfesqedus.dart' as menfesqedus;
// import '../models/mezmures/meswaet.dart' as meswaet;
// import '../models/mezmures/telek.dart' as telek;
// import '../models/mezmures/mesgana.dart' as mesgana;
// import '../models/mezmures/amesegnalew.dart' as amesgenalew;
// import '../models/mezmures/nafkot.dart' as nafkot;
// import '../models/mezmures/endanete.dart' as endanete;
// import '../models/mezmures/efelegehalew.dart' as efelegehalew;
// import '../models/mezmures/yaqen.dart' as yaqen;
// import '../models/mezmures/gerum.dart' as gerum;

class MezmureProvider extends ChangeNotifier {
  // list of mezmures
  List<Mezmure> mezmures = [];
  
  void setMezmures(List<Mezmure> into) {
    mezmures = into;
    notifyListeners();
  }

  List<Mezmure> get getMezmures => mezmures;
}
