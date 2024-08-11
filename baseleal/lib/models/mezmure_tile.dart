import 'package:baseleal/models/mezmure.dart';
import 'package:baseleal/models/mezmure_page.dart';
import 'package:flutter/material.dart';

class MezmureTile extends StatelessWidget {
  final Mezmure _mezmure;

  const MezmureTile({
    super.key,
    required mezmure,
  }) : _mezmure = mezmure;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MezmurePage(mezmure: _mezmure),
          ),
        );
      },
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
              _mezmure.name,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(
              _mezmure.mezmureType,
              style: Theme.of(context).textTheme.labelSmall,
            )
          ],
        ),
      ),
    );
  }
}
