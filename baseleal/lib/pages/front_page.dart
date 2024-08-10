import 'package:baseleal/pages/mezmure_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({super.key});

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  List<String> imageURL = [];

  bool isLoading = false;

  fetchPhotos() async {
    setState(() {
      isLoading = true;
    });
    final data =
        await FirebaseStorage.instance.ref().child('BaselealPhotos').listAll();
    for (var item in data.items) {
      var a = await item.getDownloadURL();
      imageURL.add(a);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontFamily: 'Rosarivo',
                          fontSize: 15,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: 1 == 2
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Our last Collections',
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                GestureDetector(
                                  onTap: () {},
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
                            decoration: const BoxDecoration(boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                color: Color.fromARGB(40, 17, 17, 17),
                                offset: Offset(0, 10),
                              ),
                              BoxShadow(
                                blurRadius: 10,
                                color: Color.fromARGB(40, 17, 17, 17),
                                offset: Offset(0, -10),
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
                                height: 200,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Center(
                        child: Text(
                          'No Internet Connection !!!',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontFamily: 'Rosarivo',
                            fontSize: 15,
                          ),
                        ),
                      ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Our Mezmures',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'View all',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('mezmures').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) => MezmureTile(
                      mezmure: snapshot.data!.docs[index],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
