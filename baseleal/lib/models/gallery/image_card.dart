import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String _imageurl;
  final String _cardName;
  final String _inCardNumber;
  const ImageCard({
    required imageurl,
    required cardName,
    required inCardNumber,
    super.key,
  })  : _cardName = cardName,
        _inCardNumber = inCardNumber,
        _imageurl = imageurl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withAlpha(215),
        boxShadow:  [
          BoxShadow(
            color: Theme.of(context).colorScheme.secondaryFixedDim,
            blurRadius: 15,
            offset: const Offset(0, 16),
          ),
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    _imageurl,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    _cardName,
                    style: Theme.of(context).textTheme.bodyLarge,
                    maxLines: 1,
                  ),
                   AutoSizeText(
                    _inCardNumber,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
