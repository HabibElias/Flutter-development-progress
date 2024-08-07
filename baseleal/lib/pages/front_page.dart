import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({super.key});

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  List<String> imageURL = [];
  bool isLoading = false;
  fetch() async {
    setState(() {
      isLoading = true;
    });
    final data =
        await FirebaseStorage.instance.ref().child('BaselealPhotos').listAll();
    for (var item in data.items) {
      var a = await item.getDownloadURL();
      imageURL.add(a);
    }
    print(imageURL);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch();
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 33,
              ),
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
              isLoading == true
                  ? const Center(child: CircularProgressIndicator())
                  : Expanded(child: Image.network('https://firebasestorage.googleapis.com/v0/b/baseleal-9fb49.appspot.com/o/BaselealPhotos%2Fphoto_6_2024-08-05_08-21-35%20(1).jpg?alt=media&token=935eb46c-1187-4072-a4')),
            ],
          ),
        ),
      ),
    );
  }
}