import 'package:baseleal/models/gallery/fetching_galler.dart';
import 'package:baseleal/models/gallery/galler_folder_model.dart';
import 'package:baseleal/models/gallery/image_card.dart';
import 'package:baseleal/models/gallery/image_grid.dart';
import 'package:flutter/material.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  late Future<List<GalleryFolder>> galleryList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    galleryList = fetchingGaller();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/images/gallery.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // app bar

          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 13,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      padding: const EdgeInsets.all(14),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                      ),
                    ),
                    Text(
                      'Gallery',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Color(0xff9E9E9E),
                height: 2,
              ),
            ],
          ),
          // End app

          FutureBuilder(
              future: galleryList,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ); // Display loading indicator
                } else if (snapshot.hasError) {
                  return const Center(
                      child: Text(
                          'Connection Error please try again!!1')); // Handle errors
                } else if (snapshot.hasData) {
                  return Expanded(
                    child: GridView.builder(
                      itemCount: snapshot.data!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ImageGrid(
                                    foldersName:
                                        snapshot.data![index].folderName),
                              ),
                            );
                          },
                          child: ImageCard(
                            imageurl: snapshot.data![index].folderImageurl,
                            cardName: snapshot.data![index].folderName,
                            inCardNumber: snapshot.data![index].imagesInFolder,
                          ),
                        ),
                      ),
                    ),
                  ); // Display data
                } else {
                  return const Center(
                    child: Text('Something went wrong'),
                  ); // Handle unexpected cases
                }
              }),
          // the cards
        ],
      ),
    ));
  }
}
