import 'package:baseleal/models/mezmure.dart';
import 'package:baseleal/pages/mezmure_page.dart';
import 'package:baseleal/providers/mezmure_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MezmuresPage extends StatefulWidget {
  const MezmuresPage({super.key});

  @override
  State<MezmuresPage> createState() => _MezmuresPageState();
}

class _MezmuresPageState extends State<MezmuresPage> {
  @override
  Widget build(BuildContext context) {
    final List<Mezmure> mezmures =
        Provider.of<MezmureProvider>(context).getMezmures;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
          ),
          style: Theme.of(context).iconButtonTheme.style,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Our Mezmure',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.inversePrimary,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0, 1],
          ),
        ),
        child: Column(
          children: [
            const Divider(
              thickness: 2,
              color: Color(0xff82837c),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: mezmures.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MezmurePage(mezmure: mezmures[index]),
                        ),
                      ),
                      child: Padding(
                        padding: index == 0
                            ? const EdgeInsets.only(
                                top: 15,
                                left: 22,
                                right: 22,
                              )
                            : const EdgeInsets.only(
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
                                mezmures[index].name,
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              Text(
                                mezmures[index].mezmureType,
                                style: Theme.of(context).textTheme.labelSmall,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
