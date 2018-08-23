import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget getCarousel() {
    return new SizedBox(
        height: 100.0,
        width: 300.0,
        child: new Carousel(
          images: [
            new CachedNetworkImageProvider(
                'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
            new CachedNetworkImageProvider(
                'https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
            new ExactAssetImage("assets/images/LaunchImage.jpg")
          ],
          dotSize: 5.0,
          dotSpacing: 30.0,
          dotColor: Colors.lightGreenAccent,
          indicatorBgPadding: 5.0,
          dotBgColor: Colors.purple.withOpacity(0.5),
          borderRadius: true,
        ));
  }