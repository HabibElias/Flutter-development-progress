import 'package:baseleal/models/mezmure.dart';
import 'package:baseleal/pages/mezmure_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MezmureTile extends StatelessWidget {
  final DocumentSnapshot _mezmure;

  const MezmureTile({
    super.key,
    required mezmure,
  }) : _mezmure = mezmure;

  @override
  Widget build(BuildContext context) {
    final data = _mezmure['mezmure'] as Map<String, dynamic>;
    var mezmure = Mezmure.fromJson(data);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MezmurePage(mezmure: mezmure),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(
          top: 22,
          left: 22,
          right: 22,
        ),
        child: Container(
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(20, 20, 20, 0.2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mezmure.name,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Text(
                mezmure.mezmureType,
                style: Theme.of(context).textTheme.labelSmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}
