import 'package:baseleal/models/gallery/fetching_image_from_gallery.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

class ImageGrid extends StatefulWidget {
  final String _foldersName;
  const ImageGrid({required foldersName, super.key})
      : _foldersName = foldersName;

  @override
  State<ImageGrid> createState() => _ImageGridState();
}

class _ImageGridState extends State<ImageGrid> {
  late Future<List<String>> imageurls;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imageurls = fetchImageFromGallery(widget._foldersName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // the app bar
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
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
                      widget._foldersName,
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

          FutureBuilder(
            future: imageurls,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ); // Display loading indicator
              } else if (snapshot.hasError) {
                return const Center(
                    child: Text(
                        'Connection Error please try again!!1')); // Handle errors
              } else if (snapshot.hasData) {
                return Expanded(
                  child: MasonryGridView.builder(
                    itemCount: snapshot.data!.length,
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InstaImageViewer(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: CachedNetworkImage(
                            imageUrl: snapshot.data![index],
                          ),
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
            },
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
