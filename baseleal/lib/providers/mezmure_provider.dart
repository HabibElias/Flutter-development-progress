import 'package:flutter/material.dart';
import '../models/mezmure.dart';
import '../models/mezmures/lefelegeh.dart' as lefelegeh;
import '../models/mezmures/menfesqedus.dart' as menfesqedus;
import '../models/mezmures/meswaet.dart' as meswaet;
import '../models/mezmures/telek.dart' as telek;
import '../models/mezmures/mesgana.dart' as mesgana;
import '../models/mezmures/amesegnalew.dart' as amesgenalew;
import '../models/mezmures/nafkot.dart' as nafkot;
import '../models/mezmures/endanete.dart' as endanete;
import '../models/mezmures/efelegehalew.dart' as efelegehalew;
import '../models/mezmures/yaqen.dart' as yaqen;
import '../models/mezmures/gerum.dart' as gerum;

class MezmureProvider extends ChangeNotifier {
  // list of mezmures
  List<Mezmure> mezmures = [
    Mezmure(
      name: lefelegeh.name,
      mezmure: lefelegeh.mezmure,
      mezmureType: lefelegeh.mezmureType,
    ),
    Mezmure(
      name: meswaet.name,
      mezmure: meswaet.mezmure,
      mezmureType: meswaet.mezmureType,
    ),
    Mezmure(
      name: menfesqedus.name,
      mezmure: menfesqedus.mezmure,
      mezmureType: menfesqedus.mezmureType,
    ),
    Mezmure(
      name: mesgana.name,
      mezmure: mesgana.mezmure,
      mezmureType: mesgana.mezmureType,
    ),
    Mezmure(
      name: telek.name,
      mezmure: telek.mezmure,
      mezmureType: telek.mezmureType,
    ),
    Mezmure(
      name: amesgenalew.name,
      mezmure: amesgenalew.mezmure,
      mezmureType: amesgenalew.mezmureType,
    ),
    Mezmure(
      name: nafkot.name,
      mezmure: nafkot.mezmure,
      mezmureType: nafkot.mezmureType,
    ),
    Mezmure(
      name: endanete.name,
      mezmure: endanete.mezmure,
      mezmureType: endanete.mezmureType,
    ),
    Mezmure(
      name: efelegehalew.name,
      mezmure: efelegehalew.mezmure,
      mezmureType: efelegehalew.mezmureType,
    ),
    Mezmure(
      name: yaqen.name,
      mezmure: yaqen.mezmure,
      mezmureType: yaqen.mezmureType,
    ),
    Mezmure(
      name: gerum.name,
      mezmure: gerum.mezmure,
      mezmureType: gerum.mezmureType,
    ),
  ];

  List<Mezmure> get getMezmures => mezmures;
}
