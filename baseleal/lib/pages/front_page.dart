import 'dart:async';

import 'package:baseleal/models/mezmure.dart';
import 'package:baseleal/models/mezmure_tile.dart';
import 'package:baseleal/pages/gallery_page.dart';
import 'package:baseleal/pages/mezmures_page.dart';
import 'package:baseleal/providers/mezmure_provider.dart';
import 'package:baseleal/providers/theme_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({super.key});

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  late List<String> imageURL;
  final CollectionReference _mezmuresCollection =
      FirebaseFirestore.instance.collection('mezmures');

  final _myBox = Hive.box('myBox');
  List<Mezmure> mezmures = [];

  bool isLoading = true;
  bool hasConnection = false;

  fetchPhotos() async {
    setState(() {
      isLoading = true;
    });
    final data =
        await FirebaseStorage.instance.ref().child('BaselealPhotos').listAll();

    // if not empty
    imageURL = [];
    for (var item in data.items) {
      var a = await item.getDownloadURL();
      imageURL.add(a);
    }

    setState(() {
      isLoading = false;
    });
  }

  Future<void> _checkConnectivity() async {
    List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (!connectivityResult.contains(ConnectivityResult.none)) {
      hasConnection = true;
      await _fetchDataFromFirestore();
      fetchPhotos();
    } else {
      hasConnection = false;
      loadDataState();
    }
    setState(() {
      isLoading = false;
    });
  }

  void loadDataState() {
    final storedMezmures = _myBox.get('MEZMURELIST');
    if (storedMezmures != null) {
      mezmures =
          (storedMezmures as List).map((m) => Mezmure.fromMap(m)).toList();
      setMemure(mezmures);
    }
  }

  setMemure(List<Mezmure> list) {
    Provider.of<MezmureProvider>(context, listen: false).setMezmures(
      list,
    );
  }

  Future<void> _fetchDataFromFirestore() async {
    try {
      final querySnapshot = await _mezmuresCollection.get();

      mezmures = querySnapshot.docs.map(
        (doc) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          return Mezmure.fromMap(data['mezmure'] as Map<String, dynamic>);
        },
      ).toList();

      _myBox.put('MEZMURELIST', mezmures.map((m) => m.toMap()).toList());
      setMemure(mezmures);
    } catch (e) {
      // Handle errors, e.g., display an error message
      // ignore: avoid_print
      print('Error fetching data: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    imageURL = [];
    _checkConnectivity();
  }

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      backgroundColor: Theme.of(context).colorScheme.primary,
      color: Theme.of(context).colorScheme.inversePrimary,
      height: 300,
      animSpeedFactor: 2,
      showChildOpacityTransition: false,
      onRefresh: _checkConnectivity,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.inversePrimary,
              ],
              stops: const [0, 1],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 33,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Welcome!',
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .secondary
                                .withAlpha(153),
                            fontFamily: 'Rosarivo',
                            fontSize: 15,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Provider.of<ThemeProvider>(
                              context,
                              listen: false,
                            ).toggleTheme();
                          },
                          icon: Provider.of<ThemeProvider>(
                            context,
                            listen: false,
                          ).isLightmode
                              ? const Icon(Icons.dark_mode)
                              : const Icon(Icons.light_mode),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'BASELEAL',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        Text(
                          'CHOIR',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    const Divider(
                      thickness: 2,
                      color: Color(0xff82837c),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                  ],
                ),
              ),
              isLoading == true
                  ? const Center(child: CircularProgressIndicator())
                  : imageURL.isNotEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 22.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Our last Collections',
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary
                                          .withAlpha(153),
                                      fontFamily: 'Lexend',
                                      fontSize: 16,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const GalleryPage(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'View all',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Container(
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  blurRadius: 20,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryFixedDim,
                                  offset: const Offset(0, 10),
                                ),
                              ]),
                              child: CarouselSlider(
                                items: imageURL
                                    .map(
                                      (url) => Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: CachedNetworkImageProvider(
                                              url,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                options: CarouselOptions(
                                  autoPlay: true,
                                  enlargeCenterPage: true,
                                  autoPlayInterval: const Duration(
                                    seconds: 5,
                                  ),
                                  aspectRatio: 1.3,
                                  height: 220,
                                ),
                              ),
                            ),
                          ],
                        )
                      : !hasConnection
                          ? Center(
                              child: Text(
                                'No Internet Connection !!!',
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontFamily: 'Rosarivo',
                                  fontSize: 15,
                                ),
                              ),
                            )
                          : Center(
                              child: Text(
                                'Loading ...',
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontFamily: 'Rosarivo',
                                  fontSize: 15,
                                ),
                              ),
                            ),
              const SizedBox(
                height: 48,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 22.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Our Mezmures',
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withAlpha(153),
                                fontFamily: 'Lexend',
                                fontSize: 16,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MezmuresPage(),
                                  ),
                                );
                              },
                              child: Text(
                                'View all',
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Expanded(
                        child: Center(
                          child: ListView.builder(
                            itemCount: mezmures.isNotEmpty ? 4 : 1,
                            itemBuilder: (context, index) => mezmures.isNotEmpty
                                ? Padding(
                                    padding: index != 0
                                        ? const EdgeInsets.only(
                                            top: 22.0,
                                            left: 22.0,
                                            right: 22.0,
                                          )
                                        : const EdgeInsets.only(
                                            left: 22.0,
                                            right: 22.0,
                                          ),
                                    child: MezmureTile(
                                      mezmure: mezmures[index],
                                    ),
                                  )
                                : Center(
                                    child: CircularProgressIndicator(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
